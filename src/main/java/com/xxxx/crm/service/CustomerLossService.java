package com.xxxx.crm.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxxx.base.BaseMapper;
import com.xxxx.base.BaseService;
import com.xxxx.crm.dao.CustomerLossMapper;
import com.xxxx.crm.query.CustomerLossQuery;
import com.xxxx.crm.query.CustomerQuery;
import com.xxxx.crm.utils.AssertUtil;
import com.xxxx.crm.vo.Customer;
import com.xxxx.crm.vo.CustomerLoss;
import com.xxxx.crm.vo.CustomerReprieve;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-20 18:58
 */
@Service
public class CustomerLossService extends BaseService<CustomerLoss, Integer> {
    @Autowired
    private CustomerLossMapper customerLossMapper;

    //列表
    public Map<String, Object> queryCustomerByParams(CustomerLossQuery customerLossQuery) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(customerLossQuery.getPage(), customerLossQuery.getLimit());
        PageInfo<CustomerLoss> pageInfo = new PageInfo<CustomerLoss>(selectByParams(customerLossQuery));
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }

    public void updateCusLossState(Integer id, String lossReason) {
        CustomerLoss customerLoss = customerLossMapper.selectByPrimaryKey(id);
        AssertUtil.isTrue(customerLoss == null, "待流失的客户记录不存在");
        customerLoss.setLossReason(lossReason);
        customerLoss.setState(1);
        customerLoss.setUpdateDate(new Date());
        customerLoss.setConfirmLossTime(new Date());
        Integer i = updateByPrimaryKeySelective(customerLoss);
        AssertUtil.isTrue(i < 1, "流失失败");

    }
}
