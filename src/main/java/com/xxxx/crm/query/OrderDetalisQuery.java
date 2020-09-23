package com.xxxx.crm.query;

import com.xxxx.base.BaseQuery;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-20 13:33
 */
public class OrderDetalisQuery extends BaseQuery {
    private Integer orderId;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
}
