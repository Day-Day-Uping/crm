package com.xxxx.crm.dao;

import com.xxxx.base.BaseMapper;
import com.xxxx.crm.vo.CustomerOrder;

import java.util.Map;

public interface CustomerOrderMapper extends BaseMapper<CustomerOrder, Integer> {

    Map<String, Object> queryCustomerOrderById(Integer id);

    //查询最后一次订单
    public CustomerOrder queryCusLastOrder(Integer cusId);
}