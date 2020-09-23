package com.xxxx.crm.dao;

import com.xxxx.base.BaseMapper;
import com.xxxx.crm.vo.UserRole;

public interface UserRoleMapper extends BaseMapper<UserRole, Integer> {
    public int countUserRoleByUserId(Integer userId);

    public int delUserRoleByUserId(Integer userId);

    public int countUserRoleByRoleId(Integer roleId);

    public int delUserRoleByRoleId(Integer roleId);

}