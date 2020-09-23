package com.xxxx.crm.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxxx.base.BaseService;
import com.xxxx.crm.dao.CustomerMapper;
import com.xxxx.crm.dao.CustomerOrderMapper;
import com.xxxx.crm.query.CustomerOrderQuery;
import com.xxxx.crm.query.CustomerQuery;
import com.xxxx.crm.vo.Customer;
import com.xxxx.crm.vo.CustomerOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-20 10:15
 */
@Service
public class CustomerOrderService extends BaseService<CustomerOrder, Integer> {
    @Autowired
    private CustomerOrderMapper customerOrderMapper;

    /**
     * 订单详情
     *
     * @param id 订单号
     * @return
     */
    public Map<String, Object> queryCustomerOrderById(Integer id) {
        return customerOrderMapper.queryCustomerOrderById(id);

    }

    //列表
    public Map<String, Object> queryCustomerByParams(CustomerOrderQuery customerOrderQuery) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(customerOrderQuery.getPage(), customerOrderQuery.getLimit());
        PageInfo<CustomerOrder> pageInfo = new PageInfo<>(selectByParams(customerOrderQuery));
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }

}
