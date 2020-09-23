package com.xxxx.crm.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxxx.base.BaseService;
import com.xxxx.crm.dao.CustomerMapper;
import com.xxxx.crm.dao.CustomerServeMapper;
import com.xxxx.crm.dao.UserMapper;
import com.xxxx.crm.enums.CustomerServeStatus;
import com.xxxx.crm.query.CustomerQuery;
import com.xxxx.crm.query.CustomerServeQuery;
import com.xxxx.crm.utils.AssertUtil;
import com.xxxx.crm.vo.Customer;
import com.xxxx.crm.vo.CustomerServe;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.crypto.Data;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-21 1:19
 */
@Service
public class CustomerServeService extends BaseService<CustomerServe, Integer> {
    @Autowired
    private CustomerServeMapper customerServeMapper;
    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private UserMapper userMapper;


    /**
     * 服务分配
     * 0.参数校验 id存在
     * 1.分配状态  ASSIGNED(2)
     * 分配人必须存在
     * 设置服务更新时间
     * 设置分配时间
     * 2. 处理状态  FROCED(3)
     * 服务处理时间
     * 处理内容非空
     * 服务更新时间
     * 3.反馈 FEED_BACK(4),
     * 反馈的内容,满意度非空
     * 更新时间/状态码
     * 归档状态
     * 4.
     * 执行更新
     *
     * @param customerServe
     */
    public void update(CustomerServe customerServe) {
        AssertUtil.isTrue(null == selectByPrimaryKey(customerServe.getId()), "待更新数据不存在");
        if (customerServe.getState() == CustomerServeStatus.ASSIGNED.getState()) {
            AssertUtil.isTrue(userMapper.selectByPrimaryKey(Integer.parseInt(customerServe.getAssigner())) == null,
                    "待分配用户不存在");
            customerServe.setAssignTime(new Date());
        } else if (customerServe.getState() == CustomerServeStatus.FROCED.getState()) {
            AssertUtil.isTrue(StringUtils.isBlank(customerServe.getServiceProce()), "请指定处理内容");
            customerServe.setServiceProceTime(new Date());
        } else if (customerServe.getState() == CustomerServeStatus.FEED_BACK.getState()) {
            AssertUtil.isTrue(StringUtils.isBlank(customerServe.getServiceProceResult()), "请指定反馈内容");
            AssertUtil.isTrue(StringUtils.isBlank(customerServe.getMyd()), "请指定满意度");
            customerServe.setState(CustomerServeStatus.ARCHIVED.getState());
        }
        customerServe.setUpdateTime(new Date());
        AssertUtil.isTrue(updateByPrimaryKeySelective(customerServe) < 1, "服务记录更新失败");


    }

    /**
     * 添加服务
     * 参数校验:
     * 客户名 非空,
     * 服务类型 非空,
     * 服务请求内容 非空
     *
     * @param customer
     */
    public void saveCustomerServe(CustomerServe customer) {
        AssertUtil.isTrue(StringUtils.isBlank(customer.getCustomer()), "请输入客户名");
        AssertUtil.isTrue(customer.getServeType() == null, "请输入服务类型");
        AssertUtil.isTrue(StringUtils.isBlank(customer.getServiceRequest()), "请输入服务请求内容");
        AssertUtil.isTrue(null == customerMapper.querryCustomByName(customer.getCustomer()), "客户不存在");
        customer.setState(CustomerServeStatus.CREATE.getState());
        customer.setCreateTime(new Date());
        customer.setUpdateTime(new Date());
        customer.setIsValid(1);
        AssertUtil.isTrue(insertSelective(customer) < 1, "客户服务创建失败");
    }


    //列表
    public Map<String, Object> queryCustomerServeByParams(CustomerServeQuery customerServeQuery) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(customerServeQuery.getPage(), customerServeQuery.getLimit());
        PageInfo<CustomerServe> pageInfo = new PageInfo<CustomerServe>(selectByParams(customerServeQuery));
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }
}
