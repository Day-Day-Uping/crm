package com.xxxx.crm.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxxx.base.BaseService;
import com.xxxx.crm.dao.CustomerReprieveMapper;
import com.xxxx.crm.query.CustomerQuery;
import com.xxxx.crm.query.CustomerReprieveQuery;
import com.xxxx.crm.utils.AssertUtil;
import com.xxxx.crm.vo.Customer;
import com.xxxx.crm.vo.CustomerReprieve;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-20 21:44
 */
@Service
public class CustomerReprieveService extends BaseService<CustomerReprieve, Integer> {
    @Autowired
    private CustomerReprieveMapper customerReprieveMapper;

    //列表
    public Map<String, Object> queryCustomerById(CustomerReprieveQuery customerReprieveQuery) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(customerReprieveQuery.getPage(), customerReprieveQuery.getLimit());
        PageInfo<CustomerReprieve> pageInfo = new PageInfo<CustomerReprieve>(selectByParams(customerReprieveQuery));
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }

    /**
     * 保存暂缓流失客户数据
     * 流失客户id非空,记录必须存在
     * 措施非空
     *
     * @param customerReprieve
     */
    public void saveCustomerReprieve(CustomerReprieve customerReprieve) {
        AssertUtil.isTrue(customerReprieve.getLossId() == null ||
                null == customerReprieveMapper.selectByPrimaryKey(customerReprieve.getLossId()), "请指定流失客户id");
        AssertUtil.isTrue(StringUtils.isBlank(customerReprieve.getMeasure()), "请写明措施项");
        customerReprieve.setCreateDate(new Date());
        customerReprieve.setUpdateDate(new Date());
        customerReprieve.setIsValid(1);
        AssertUtil.isTrue(insertSelective(customerReprieve) < 1, "暂缓措施添加失败");
    }

    /**
     * 保存暂缓流失客户数据
     * 流失客户id非空,记录必须存在
     * 措施非空
     *
     * @param customerReprieve
     */
    public void updateCustomerReprieve(CustomerReprieve customerReprieve) {
        AssertUtil.isTrue(customerReprieve.getId() == null, "待更新的暂缓措施不存在");
        AssertUtil.isTrue(customerReprieve.getLossId() == null ||
                null == customerReprieveMapper.selectByPrimaryKey(customerReprieve.getLossId()), "请指定流失客户id");
        AssertUtil.isTrue(StringUtils.isBlank(customerReprieve.getMeasure()), "请写明措施项");
        customerReprieve.setUpdateDate(new Date());
        AssertUtil.isTrue(updateByPrimaryKeySelective(customerReprieve) < 1, "暂缓措施更新失败");
    }

    public void delCustomerReprieve(Integer id) {
        CustomerReprieve temp = selectByPrimaryKey(id);
        AssertUtil.isTrue(temp == null, "待删除的数据不存在");
        temp.setIsValid(0);
        AssertUtil.isTrue(updateByPrimaryKeySelective(temp) < 1, "暂缓措施删除失败");

    }


}
