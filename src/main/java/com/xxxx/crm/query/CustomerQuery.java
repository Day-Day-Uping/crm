package com.xxxx.crm.query;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.xxxx.base.BaseQuery;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-19 16:23
 */
public class CustomerQuery extends BaseQuery {
    private String name;
    private String cusNo;
    private String level;
    private String time;
    //金额区间
    private Integer type;

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCusNo() {
        return cusNo;
    }

    public void setCusNo(String cusNo) {
        this.cusNo = cusNo;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
