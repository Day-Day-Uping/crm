package com.xxxx.crm.service;

import com.xxxx.base.BaseService;
import com.xxxx.crm.dao.ModuleMapper;
import com.xxxx.crm.dao.PermissionMapper;
import com.xxxx.crm.model.TreeDto;
import com.xxxx.crm.utils.AssertUtil;
import com.xxxx.crm.vo.Module;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-17 17:05
 */
@Service
public class ModuleService extends BaseService<Module, Integer> {
    @Autowired
    private ModuleMapper moduleMapper;
    @Autowired
    private PermissionMapper permissionMapper;


    public List<TreeDto> queryAllModules(Integer roleId) {
        //列出所有的菜单
        List<TreeDto> treeDtos = moduleMapper.queryAllModules();
        //查找出角色被赋予的菜单
        List<Integer> mids = permissionMapper.queryRoleHasMids(roleId);
        //将已经赋予的菜单处于被选中状态
        if (mids != null && mids.size() > 0) {
            treeDtos.forEach(treeDto -> {
                if (mids.contains(treeDto.getId())) {
                    treeDto.setChecked(true);
                }
            });
        }
        return treeDtos;
    }

    public Map<String, Object> queryModules() {
        Map<String, Object> result = new HashMap<>();
        List<Module> modules = moduleMapper.queryModules();
        result.put("count", modules.size());
        result.put("data", modules);
        result.put("code", 0);
        result.put("msg", "");
        return result;
    }

    /**
     * 根菜单: parentId 0
     * grade: 0:一级菜单 1:二级菜单  2:三级菜单
     * 权限码:非空不可重复
     * 菜单名: 非空
     * url: 二级菜单非空不可重复
     *
     * @param module
     */
    public void saveModule(Module module) {
        Integer grade = module.getGrade();
        String moduleName = module.getModuleName();
        String url = module.getUrl();
        AssertUtil.isTrue(StringUtils.isBlank(moduleName), "请输入菜单名");
        AssertUtil.isTrue(grade == null || !(grade == 0 || grade == 1 || grade == 2), "菜单层级非法");
        Module mod = moduleMapper.queryModulesByGradeAndModuleName(grade, moduleName);
        AssertUtil.isTrue(mod != null, "菜单已存在");
        if (grade == 1) {
            AssertUtil.isTrue(StringUtils.isBlank(url), "请输入二级菜单url地址");
            //二级菜单名不能重复
            mod = moduleMapper.queryModulesByGradeAndUrl(grade, url);
            AssertUtil.isTrue(mod != null, "二级菜单url重复");
        }
        //二级,三级必须指定上级菜单id
        if (grade != 0) {
            AssertUtil.isTrue(null == module.getParentId() ||
                    null == selectByPrimaryKey(module.getParentId()), "请指定上级菜单");
        }
        //权限码非空
        AssertUtil.isTrue(StringUtils.isBlank(module.getOptValue()), "请输入菜单的权限码");
        mod = moduleMapper.queryModuleByOptValue(module.getOptValue());
        AssertUtil.isTrue(mod != null, "权限码重复");
        module.setIsValid(1);
        module.setCreateDate(new Date());
        module.setUpdateDate(new Date());
        AssertUtil.isTrue(insertSelective(module) < 1, "菜单添加失败");

    }

    /**
     * 根菜单: parentId 0
     * grade: 0:一级菜单 1:二级菜单  2:三级菜单
     * 权限码:非空不可重复
     * 菜单名: 非空
     * url: 二级菜单非空不可重复
     *
     * @param module
     */
    public void updateModule(Module module) {
        String moduleName = module.getModuleName();
        Integer grade = module.getGrade();
        String url = module.getUrl();
        Module temp = selectByPrimaryKey(module.getId());
        AssertUtil.isTrue(null == temp, "待修改的菜单不存在");
        AssertUtil.isTrue(StringUtils.isBlank(moduleName), "请输入菜单名");
        AssertUtil.isTrue(grade == null || !(grade == 0 || grade == 1 || grade == 2), "菜单层级非法");
        temp = moduleMapper.queryModulesByGradeAndModuleName(grade, moduleName);
        AssertUtil.isTrue(temp != null && !(module.getId().equals(temp.getId())), "菜单已存在");
        if (grade == 1) {
            AssertUtil.isTrue(StringUtils.isBlank(url), "请输入二级菜单url地址");
            //二级菜单名不能重复
            temp = moduleMapper.queryModulesByGradeAndUrl(grade, url);
            AssertUtil.isTrue(temp != null && !(temp.getId().equals(module.getId())), "二级菜单url重复");
        }
        //二级,三级必须指定上级菜单id
        if (grade != 0) {
            AssertUtil.isTrue(null == module.getParentId() ||
                    null == selectByPrimaryKey(module.getParentId()), "请指定上级菜单");
        }
        //权限码非空
        AssertUtil.isTrue(StringUtils.isBlank(module.getOptValue()), "请输入菜单的权限码");
        temp = moduleMapper.queryModuleByOptValue(module.getOptValue());
        AssertUtil.isTrue(temp != null && !(temp.getId().equals(module.getId())), "权限码重复");
        module.setUpdateDate(new Date());
        AssertUtil.isTrue(updateByPrimaryKeySelective(module) < 1, "菜单更新失败");
    }

    /**
     * meun del
     * id:not null
     * child menu :if exit,can not del
     * del t_permisson table recodes
     *
     * @param id
     */
    public void delModule(Integer id) {
        Module module = moduleMapper.selectByPrimaryKey(id);
        AssertUtil.isTrue(module == null, "待删除记录不存在");
        Integer totle = moduleMapper.countChildModuleByParentId(id);
        AssertUtil.isTrue(totle > 0, "存在子菜单,无法删除");

        //删除从表数据
        totle = permissionMapper.countPermissionByModuleId(id);
        if (totle > 0) {
            AssertUtil.isTrue(permissionMapper.delPermissionByModuleId(id) != totle, "菜单删除失败");
        }
        module.setIsValid(0);
        AssertUtil.isTrue(updateByPrimaryKeySelective(module) < 1, "菜单删除失败");


    }


}
