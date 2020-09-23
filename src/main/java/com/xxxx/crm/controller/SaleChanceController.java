package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import com.xxxx.base.ResultInfo;
import com.xxxx.crm.annotaion.RequirePermission;
import com.xxxx.crm.query.SaleChanceQuery;
import com.xxxx.crm.service.SaleChanceService;
import com.xxxx.crm.service.UserService;
import com.xxxx.crm.utils.LoginUserUtil;
import com.xxxx.crm.vo.SaleChance;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("sale_chance")
public class SaleChanceController extends BaseController {

    @Resource
    private SaleChanceService saleChanceService;

    @Resource
    private UserService userService;


    @RequestMapping("index")
    @RequirePermission(code = "1010")
    public String index() {
        return "saleChance/sale_chance";
    }


    @GetMapping("list")
    @ResponseBody
    @RequirePermission(code = "101030")
    public Map<String, Object> querySaleChanceByParams(@RequestParam("flag") Integer flag, HttpServletRequest request, SaleChanceQuery saleChanceQuery) {
        if (flag == 1 && flag != null) {
            //当前用户的id
            int id = LoginUserUtil.releaseUserIdFromCookie(request);
            //指定用户
            saleChanceQuery.setAssignMan(id);

        }
        return saleChanceService.querySaleChancesByParams(saleChanceQuery);
    }


    @RequestMapping("save")
    @ResponseBody
    @RequirePermission(code = "101010")
    public ResultInfo saveSaleChance(HttpServletRequest request, SaleChance saleChance) {
        saleChance.setCreateMan(userService.selectByPrimaryKey(LoginUserUtil.releaseUserIdFromCookie(request)).getTrueName());
        saleChanceService.saveSaleChance(saleChance);
        return success("机会数据添加成功");
    }


    @RequestMapping("addOrUpdateSaleChancePage")
    public String addOrUpdateSaleChancePage(Integer id, Model model) {
        if (null != id) {
            model.addAttribute("saleChance", saleChanceService.selectByPrimaryKey(id));
        }
        return "saleChance/add_update";
    }


    @RequestMapping("update")
    @ResponseBody
    @RequirePermission(code = "101040")
    public ResultInfo updateSaleChance(SaleChance saleChance) {
        saleChanceService.updateSaleChance(saleChance);
        return success("机会数据更新成功");
    }

    @RequestMapping("delete")
    @ResponseBody
    @RequirePermission(code = "101020")
    public ResultInfo deleteSaleChance(Integer[] ids) {
        saleChanceService.deleteSaleChance(ids);
        return success("机会数据删除成功!");
    }

    @RequestMapping("updateSaleChanceState")
    @ResponseBody
    public ResultInfo updateSaleChanceState(Integer id, Integer devResult) {
        saleChanceService.updateSaleChanceState(id, devResult);
        return success("开发状态更新成功");
    }


}
