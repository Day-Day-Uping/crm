package com.xxxx.crm.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxxx.base.BaseService;
import com.xxxx.crm.query.CustomerQuery;
import com.xxxx.crm.query.OrderDetalisQuery;
import com.xxxx.crm.vo.Customer;
import com.xxxx.crm.vo.OrderDetails;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-20 13:36
 */
@Service
public class OrderDetalisService extends BaseService<OrderDetails, Integer> {
    //列表
    public Map<String, Object> queryCustomerByParams(OrderDetalisQuery query) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(query.getPage(), query.getLimit());
        PageInfo<OrderDetails> pageInfo = new PageInfo<OrderDetails>(selectByParams(query));
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }
}
