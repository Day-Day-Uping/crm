package com.xxxx.crm.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxxx.base.BaseService;
import com.xxxx.crm.dao.CustomerLossMapper;
import com.xxxx.crm.dao.CustomerMapper;
import com.xxxx.crm.dao.CustomerOrderMapper;
import com.xxxx.crm.query.CustomerQuery;
import com.xxxx.crm.utils.AssertUtil;
import com.xxxx.crm.utils.PhoneUtil;
import com.xxxx.crm.vo.Customer;

import com.xxxx.crm.vo.CustomerLoss;
import com.xxxx.crm.vo.CustomerOrder;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.text.SimpleDateFormat;
import java.util.*;


/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-19 16:37
 */
@Service
public class CustomerService extends BaseService<Customer, Integer> {
    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private CustomerLossMapper customerLossMapper;
    @Autowired
    private CustomerOrderMapper customerOrderMapper;

    //统计客户的构成饼图
    public Map<String, Object> countCusMake1() {
        Map<String, Object> cus = new HashMap<>();
        List<Map<String, Object>> list = customerMapper.countCusMake();
        List<String> data1 = new ArrayList<>();
        List<Map<String, Object>> data2 = new ArrayList<>();
        list.forEach(m -> {
            data1.add(m.get("level").toString());
            Map<String, Object> temp = new HashMap<>();
            temp.put("name", m.get("level"));
            temp.put("value", m.get("total"));
            data2.add(temp);
        });
        cus.put("data1", data1);
        cus.put("data2", data2);
        return cus;
    }

    //统计客户的构成折线图
    public Map<String, Object> countCusMake() {
        Map<String, Object> cus = new HashMap<>();
        List<Map<String, Object>> list = customerMapper.countCusMake();
        /**
         * X轴:level  []
         * Y轴:总数  []
         */
        List<String> level = new ArrayList<>();
        List<Integer> counts = new ArrayList<>();
        list.forEach(m -> {
            level.add((String) m.get("level"));
            counts.add(Integer.parseInt(m.get("total").toString()));
        });
        cus.put("level", level);
        cus.put("counts", counts);
        return cus;
    }

    /**
     * 客户贡献的报表
     */
    public Map<String, Object> queryCusAttributionByParams(CustomerQuery customerQuery) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(customerQuery.getPage(), customerQuery.getLimit());
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(customerMapper.queryCusContributionByparams(customerQuery));
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;

    }

    /**
     * 查询待流失客户的数据
     * 将流失的数据批量化添加到客户流失表
     * 批量更新客户的流失状态
     * 定时任务流转客户到客户流失表
     */
    public void updateCustomerState() {
        List<Customer> customers = customerMapper.queryLossCustomer();
        if (customers != null && customers.size() > 0) {
            //将数据批量化添加到客户流失表
            List<CustomerLoss> customerLosses = new ArrayList<>();
            //流失客户id
            List<Integer> lossCusIds = new ArrayList<>();
            customers.forEach(c -> {
                CustomerLoss customerLoss = new CustomerLoss();
                //流失状态默认暂缓
                customerLoss.setState(0);
                customerLoss.setCreateDate(new Date());
                customerLoss.setCusManager(c.getCusManager());
                customerLoss.setCusName(c.getName());
                customerLoss.setCusNo(c.getKhno());
                customerLoss.setIsValid(1);
                customerLoss.setUpdateDate(new Date());
                //查询最后一次下单时间
                CustomerOrder customerOrder = customerOrderMapper.queryCusLastOrder(c.getId());
                if (customerOrder != null) {
                    customerLoss.setLastOrderTime(customerOrder.getOrderDate());
                }
                customerLosses.add(customerLoss);
                lossCusIds.add(c.getId());
            });
            //批量化增加
            AssertUtil.isTrue(customerLossMapper.insertBatch(customerLosses) != customerLosses.size(), "客户数据流转失败");
            //更新客户流失表的id
            AssertUtil.isTrue(customerMapper.updateCustomerStateBIds(lossCusIds) != lossCusIds.size(),
                    "客户流转失败");


        }

    }

    /**
     * 更新功能
     * 1.id
     * 2.客户名称非空
     * 3手机号:非空
     * 3.公司法人代表:非空
     * 4.时间自动生成
     *
     * @param customer
     */
    public void updateCustomer(Customer customer) {
        Customer temp = selectByPrimaryKey(customer.getId());
        AssertUtil.isTrue(temp == null, "待更新的客户不存在");
        checkParams(customer.getName(), customer.getPhone(), customer.getFr());
        temp = customerMapper.querryCustomByName(customer.getName());
        AssertUtil.isTrue(temp != null && !(temp.getId().equals(customer.getId())), "客户已存在");
        customer.setUpdateDate(new Date());
        AssertUtil.isTrue(customerMapper.updateByPrimaryKeySelective(customer) < 1, "客户更新失败");
    }

    //列表
    public Map<String, Object> queryCustomerByParams(CustomerQuery customerQuery) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(customerQuery.getPage(), customerQuery.getLimit());
        PageInfo<Customer> pageInfo = new PageInfo<Customer>(selectByParams(customerQuery));
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }

    /**
     * 添加功能
     * 1.客户编号系统生成
     * 2.客户名称非空
     * 3手机号:非空
     * 3.公司法人代表:非空
     * 4.时间自动生成
     * 5.可用状态:1
     *
     * @param customer
     */
    public void saveCustomer(Customer customer) {
        checkParams(customer.getName(), customer.getPhone(), customer.getFr());
        AssertUtil.isTrue(null != customerMapper.querryCustomByName(customer.getName()), "该客户已存在");
        customer.setIsValid(1);
        customer.setCreateDate(new Date());
        customer.setUpdateDate(new Date());
        customer.setState(0);
        //客户编号
        String khno = "KH_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        customer.setKhno(khno);
        AssertUtil.isTrue(customerMapper.insertSelective(customer) < 1, "客户添加失败");
    }

    //校验功能
    private void checkParams(String name, String phone, String fr) {
        AssertUtil.isTrue(StringUtils.isBlank(name), "用户名不能为空");
        AssertUtil.isTrue(!PhoneUtil.isMobile(phone), "手机号码格式非法");
        AssertUtil.isTrue(StringUtils.isBlank(fr), "请指定公司法人代表");

    }

    /**
     * 删除
     *
     * @param id
     */
    public void delCustomer(Integer id) {
        Customer customer = selectByPrimaryKey(id);
        AssertUtil.isTrue(customer == null, "待删除的客户不存在");
        customer.setIsValid(0);
        AssertUtil.isTrue(updateByPrimaryKeySelective(customer) < 1, "客户删除失败");

    }
}
