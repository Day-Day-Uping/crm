package com.xxxx.crm.dao;

import com.xxxx.base.BaseMapper;
import com.xxxx.crm.query.CustomerQuery;
import com.xxxx.crm.vo.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerMapper extends BaseMapper<Customer, Integer> {

    Customer querryCustomByName(String name);

    public List<Customer> queryLossCustomer();

    int updateCustomerStateBIds(List<Integer> lossCusIds);

    public List<Map<String, Object>> queryCusContributionByparams(CustomerQuery customerQuery);

    public List<Map<String, Object>>countCusMake();

}