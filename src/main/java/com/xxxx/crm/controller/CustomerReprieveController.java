package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import com.xxxx.base.ResultInfo;
import com.xxxx.crm.query.CustomerReprieveQuery;
import com.xxxx.crm.service.CustomerReprieveService;
import com.xxxx.crm.vo.CustomerReprieve;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-20 21:45
 */
@Controller
@RequestMapping("customer_rep")
public class CustomerReprieveController extends BaseController {
    @Autowired
    private CustomerReprieveService customerReprieveService;

    @RequestMapping("addOrUpdateCusRep")
    public String addOrUpdateCusRep(Integer lossId, Integer id, Model model) {
        model.addAttribute("customerRep", customerReprieveService.selectByPrimaryKey(id));
        model.addAttribute("lossId", lossId);
        return "customer/rep_add_update_page";
    }

    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> queryCustomerById(CustomerReprieveQuery customerReprieveQuery) {
        return customerReprieveService.queryCustomerById(customerReprieveQuery);
    }

    @RequestMapping("update")
    @ResponseBody
    public ResultInfo updateCustomerReprieve(CustomerReprieve customerReprieve) {
        customerReprieveService.updateCustomerReprieve(customerReprieve);
        return success("更新成功");
    }

    @RequestMapping("save")
    @ResponseBody
    public ResultInfo saveCustomerReprieve(CustomerReprieve customerReprieve) {
        customerReprieveService.saveCustomerReprieve(customerReprieve);
        return success("更新成功");
    }

    @RequestMapping("delete")
    @ResponseBody
    public ResultInfo delCustomerReprieve(Integer id) {
        customerReprieveService.delCustomerReprieve(id);
        return success("删除成功");
    }
}
