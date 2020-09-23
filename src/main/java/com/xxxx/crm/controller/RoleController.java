package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import com.xxxx.base.ResultInfo;
import com.xxxx.crm.query.RoleQuery;
import com.xxxx.crm.service.RoleService;
import com.xxxx.crm.vo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-17 10:11
 */
@Controller
@RequestMapping("role")
public class RoleController extends BaseController {
    @Autowired
    private RoleService roleService;

    @RequestMapping("queryAllRoles")
    @ResponseBody
    public List<Map<String, Object>> queryAllRoles(Integer userId) {
        return roleService.queryAllRoles(userId);
    }

    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> queryUserByParams(RoleQuery roleQuery) {
        return roleService.queryUserByParams(roleQuery);
    }

    //角色页面
    @RequestMapping("index")
    public String index() {
        return "role/role";
    }

    //添加
    @RequestMapping("save")
    @ResponseBody
    public ResultInfo saveRole(Role role) {
        roleService.saveRole(role);
        return success("角色添加成功");
    }

    //更新
    @RequestMapping("update")
    @ResponseBody
    public ResultInfo updateRole(Role role) {
        roleService.updateRole(role);
        return success("角色更新成功");
    }

    @RequestMapping("addOrUpdateRolePage")
    public String userPage(Integer id, Model model) {
        model.addAttribute("role", roleService.selectByPrimaryKey(id));
        return "role/add_update";
    }

    //删除
    @RequestMapping("delete")
    @ResponseBody
    ResultInfo delRole(Integer roleId) {
        roleService.delRole(roleId);
        return success("角色删除成功");
    }

    @RequestMapping("toAddGrantPage")
    public String toAddGrantPage(Integer roleId, Model model) {
        model.addAttribute("roleId", roleId);
        return "role/grant";
    }

    @RequestMapping("addGrant")
    @ResponseBody
    ResultInfo addGrant(Integer[] mids, Integer roleId) {
        roleService.addGrant(mids, roleId);
        return success("角色授权成功");
    }

}
