package com.xxxx.crm.service;

import com.xxxx.base.BaseService;
import com.xxxx.crm.dao.PermissionMapper;
import com.xxxx.crm.vo.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-18 10:51
 */
@Service
public class PermissionService extends BaseService<Permission, Integer> {
    @Autowired
    private PermissionMapper permissionMapper;

    public List<String> queryUserHasModule(Integer userId) {
        return permissionMapper.queryUserHasModule(userId);
    }
}
