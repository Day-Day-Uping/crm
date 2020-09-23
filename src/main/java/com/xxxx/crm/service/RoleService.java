package com.xxxx.crm.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxxx.base.BaseQuery;
import com.xxxx.base.BaseService;
import com.xxxx.crm.dao.ModuleMapper;
import com.xxxx.crm.dao.PermissionMapper;
import com.xxxx.crm.dao.RoleMapper;
import com.xxxx.crm.dao.UserRoleMapper;
import com.xxxx.crm.query.RoleQuery;
import com.xxxx.crm.utils.AssertUtil;
import com.xxxx.crm.vo.Permission;
import com.xxxx.crm.vo.Role;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-17 10:08
 */
@Service
public class RoleService extends BaseService<Role, Integer> {
    @Resource
    private RoleMapper roleMapper;

    @Resource
    private UserRoleMapper userRoleMapper;

    @Resource
    private PermissionMapper permissionMapper;

    @Resource
    private ModuleMapper moduleMapper;

    public List<Map<String, Object>> queryAllRoles(Integer userId) {
        return roleMapper.queryAllRoles(userId);
    }

    //查询列表
    public Map<String, Object> queryUserByParams(RoleQuery roleQuery) {
        Map<String, Object> map = new HashMap<>();
        PageHelper.startPage(roleQuery.getPage(), roleQuery.getLimit());
        PageInfo<Role> rolePageInfo = new PageInfo<>(selectByParams(roleQuery));
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", rolePageInfo.getTotal());
        map.put("data", rolePageInfo.getList());
        return map;
    }

    public void saveRole(Role role) {
        AssertUtil.isTrue(StringUtils.isBlank(role.getRoleName()), "角色名不能为空");
        AssertUtil.isTrue(roleMapper.queryByRoleName(role.getRoleName()) != null, "角色已存在");
        role.setIsValid(1);
        role.setCreateDate(new Date());
        role.setUpdateDate(new Date());
        AssertUtil.isTrue(roleMapper.insertSelective(role) < 1, "角色添加失败");
    }

    public void updateRole(Role role) {
        AssertUtil.isTrue(StringUtils.isBlank(role.getRoleName()), "角色名不能为空");
        Role temp = roleMapper.queryByRoleName(role.getRoleName());
        AssertUtil.isTrue(!(temp.getId().equals(role.getId())) && temp != null, "角色已存在");
        role.setCreateDate(new Date());
        role.setUpdateDate(new Date());
        AssertUtil.isTrue(roleMapper.updateByPrimaryKeySelective(role) < 1, "角色更新失败");
    }

    /**
     * 角色删除
     * 1.非空 记录必须存在
     * 2.查询中间表数据,如存在则删除
     *
     * @param roleId
     */
    public void delRole(Integer roleId) {
        Role role = roleMapper.selectByPrimaryKey(roleId);
        AssertUtil.isTrue(role == null, "角色不存在");
        int i = userRoleMapper.countUserRoleByRoleId(roleId);
        if (i > 0) {
            AssertUtil.isTrue(userRoleMapper.delUserRoleByRoleId(roleId) != i, "用户角色删除失败");
        }
        role.setIsValid(0);
        AssertUtil.isTrue(updateByPrimaryKeySelective(role) < 1, "角色删除失败");

    }

    /**
     * 角色授权
     *
     * @param mids   moduleId
     * @param roleId 角色id
     */
    public void addGrant(Integer[] mids, Integer roleId) {
        //根据角色查找权限
        int i = permissionMapper.countPermissionByRoleId(roleId);
        if (i > 0) {
            AssertUtil.isTrue(permissionMapper.delPermissionByRoleId(roleId) != i, "角色授权失败");
        }
        if (null != mids && mids.length > 0) {
            List<Permission> permissions = new ArrayList<>();
            for (Integer mid : mids) {
                Permission permission = new Permission();
                permission.setCreatDate(new Date());
                permission.setUpdateDate(new Date());
                permission.setModuleId(mid);
                permission.setRoleId(roleId);
                //将module权限码加入到permission中
                permission.setAclValue(moduleMapper.selectByPrimaryKey(mid).getOptValue());
                permissions.add(permission);
            }
            AssertUtil.isTrue(permissions.size() != permissionMapper.insertBatch(permissions), "角色授权失败");
        }

    }
}
