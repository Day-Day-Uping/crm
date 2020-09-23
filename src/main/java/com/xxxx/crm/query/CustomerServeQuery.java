package com.xxxx.crm.query;

import com.xxxx.base.BaseQuery;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-21 1:29
 */
public class CustomerServeQuery extends BaseQuery {
    private Integer serveType;
    private String customer;
    private Integer state;
    private Integer assigner;

    public Integer getAssigner() {
        return assigner;
    }

    public void setAssigner(Integer assigner) {
        this.assigner = assigner;
    }

    public Integer getServeType() {
        return serveType;
    }

    public void setServeType(Integer serveType) {
        this.serveType = serveType;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
