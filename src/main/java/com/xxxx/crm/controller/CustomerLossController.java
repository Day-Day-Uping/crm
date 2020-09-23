package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import com.xxxx.base.ResultInfo;
import com.xxxx.crm.query.CustomerLossQuery;
import com.xxxx.crm.service.CustomerLossService;
import com.xxxx.crm.vo.CustomerLoss;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-20 18:59
 */
@Controller
@RequestMapping("customer_loss")
public class CustomerLossController extends BaseController {
    @Autowired
    private CustomerLossService customerLossService;

    //流失客户
    @ResponseBody
    @RequestMapping("updatState")
    ResultInfo updateState(Integer id, String lossReason) {
        customerLossService.updateCusLossState(id, lossReason);
        return success("客户流失成功");

    }

    @RequestMapping("toCusRepPage")
    public String toCusRepPage(Integer id, Model model) {
        CustomerLoss customerLoss = customerLossService.selectByPrimaryKey(id);
        model.addAttribute("customerLoss", customerLoss);
        return "customerLoss/cus_rep";
    }

    @ResponseBody
    @RequestMapping("list")
    public Map<String, Object> queryCustomerByParams(CustomerLossQuery customerLossQuery) {
        return customerLossService.queryCustomerByParams(customerLossQuery);
    }

    @RequestMapping("index")
    public String index() {
        return "customerLoss/customer_loss";

    }
}
