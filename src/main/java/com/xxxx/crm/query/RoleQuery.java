package com.xxxx.crm.query;

import com.xxxx.base.BaseQuery;
import com.xxxx.crm.vo.Role;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-17 13:33
 */
public class RoleQuery extends BaseQuery {
    private String roleName;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
