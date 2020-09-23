package com.xxxx.crm.query;

import com.xxxx.base.BaseQuery;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-20 18:59
 */
public class CustomerLossQuery extends BaseQuery {
    private String cusNo;
    private Integer state;
    private String cusName;

    public String getCusNo() {
        return cusNo;
    }

    public void setCusNo(String cusNo) {
        this.cusNo = cusNo;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }
}
