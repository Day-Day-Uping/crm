package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import com.xxxx.base.ResultInfo;
import com.xxxx.crm.model.TreeDto;
import com.xxxx.crm.service.ModuleService;
import com.xxxx.crm.vo.Module;
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
 * @creat 2020-09-17 17:08
 */
@Controller
@RequestMapping("/module")
public class ModuleController extends BaseController {
    @Autowired
    private ModuleService moduleService;

    @RequestMapping("/index")
    public String index() {
        return "module/module";
    }

    @RequestMapping("/queryAllModules")
    @ResponseBody
    public List<TreeDto> queryAllModules(Integer roleId) {
        return moduleService.queryAllModules(roleId);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> queryModules() {
        return moduleService.queryModules();
    }

    @RequestMapping("/save")
    @ResponseBody
    public ResultInfo saveModule(Module module) {
        moduleService.saveModule(module);
        return success("菜单添加成功");
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResultInfo updateModule(Module module) {
        moduleService.updateModule(module);
        return success("菜单更新成功");
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ResultInfo deleteModule(Integer id) {
        moduleService.delModule(id);
        return success("菜单删除成功");
    }

    //添加页面
    @RequestMapping("addModulePage")
    public String addModulePage(Integer grade, Integer parentId, Model model) {
        model.addAttribute("grade", grade);
        model.addAttribute("parentId", parentId);
        return "module/addPage";
    }

    //更新页面
    @RequestMapping("updateModulePage")
    public String updateModulePage(Integer id, Model model) {
        model.addAttribute("module", moduleService.selectByPrimaryKey(id));
        return "module/updatePage";
    }


}
