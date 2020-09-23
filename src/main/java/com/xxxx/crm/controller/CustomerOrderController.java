package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import com.xxxx.crm.query.CustomerOrderQuery;
import com.xxxx.crm.service.CustomerOrderService;
import com.xxxx.crm.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-20 10:20
 */
@Controller
@RequestMapping("order")
public class CustomerOrderController extends BaseController {
    @Autowired
    private CustomerOrderService orderService;



    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> queryCustomerByParams(CustomerOrderQuery customerOrderQuery) {
        return orderService.queryCustomerByParams(customerOrderQuery);
    }
}
