package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import com.xxxx.base.ResultInfo;
import com.xxxx.crm.annotaion.RequirePermission;
import com.xxxx.crm.query.CusDevPlanQuery;
import com.xxxx.crm.service.CusDevPlanService;
import com.xxxx.crm.service.SaleChanceService;
import com.xxxx.crm.vo.CusDevPlan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-15 16:16
 */
@Controller
@RequestMapping("cus_dev_plan")

public class CusDevPlanController extends BaseController {
    @Autowired
    private SaleChanceService saleChanceService;

    @Autowired
    private CusDevPlanService cusDevPlanService;

    //客户开发计划页面
    @RequirePermission(code = "1020")
    @RequestMapping("/index")
    public String index() {
        return "cusDevPlan/cus_dev_plan";
    }

    @RequirePermission(code = "102020")
    @RequestMapping("/toCusDevPlanDataPage")
    public String toCusDevPlanDataPage(Integer sid, Model model) {
        model.addAttribute("saleChance", saleChanceService.selectByPrimaryKey(sid));
        return "cusDevPlan/cus_dev_plan_data";
    }

    //列表查询
    @RequestMapping("/list")
    @ResponseBody
    @RequirePermission(code = "102010")
    public Map<String, Object> queryCusDevPlansByParams(CusDevPlanQuery cusDevPlanQuery) {
        return cusDevPlanService.queryCusDevPlansByParams(cusDevPlanQuery);
    }

    //添加
    @RequestMapping("/save")
    @ResponseBody
    public ResultInfo save(CusDevPlan cusDevPlan) {
        cusDevPlanService.saveCusDevPlan(cusDevPlan);
        return success("数据添加成功");
    }

    //添加
    @RequestMapping("/update")
    @ResponseBody
    public ResultInfo update(CusDevPlan cusDevPlan) {
        cusDevPlanService.updateCusDevPlan(cusDevPlan);
        return success("数据更新成功");
    }

    //删除
    @RequestMapping("/delete")
    @ResponseBody
    public ResultInfo del(Integer id) {
        cusDevPlanService.deleteCusDevPlan(id);
        return success("数据删除成功");
    }

    //添加更新页面
    @RequestMapping("addOrUpdateCusDevPlanPage")
    public String addOrUPD(Integer sid, Integer id, Model model) {
        model.addAttribute("sid", sid);
        model.addAttribute("cusDevPlan", cusDevPlanService.selectByPrimaryKey(id));
        return "cusDevPlan/add_update";
    }
}
