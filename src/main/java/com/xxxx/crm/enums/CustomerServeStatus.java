package com.xxxx.crm.enums;

/**
 * 客户服务状态枚举类
 *
 * @author 黄大大
 * @file crm
 * @creat 2020-09-21 11:06
 */
public enum CustomerServeStatus {
    //创建
    CREATE(1),
    //分配
    ASSIGNED(2),
    //处理
    FROCED(3),
    //反馈
    FEED_BACK(4),
    //归档
    ARCHIVED(5);
    private int state;

    CustomerServeStatus(int state) {
        this.state = state;
    }

    public int getState() {
        return state;
    }
}
