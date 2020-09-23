package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import com.xxxx.crm.query.OrderDetalisQuery;
import com.xxxx.crm.service.OrderDetalisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-20 13:37
 */
@Controller
@RequestMapping("order_details")
public class OrderDetailsController extends BaseController {
    @Autowired
    private OrderDetalisService orderDetalisService;

    //列表
    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> queryCustomerByParams(OrderDetalisQuery query) {
        return orderDetalisService.queryCustomerByParams(query);
    }
}
