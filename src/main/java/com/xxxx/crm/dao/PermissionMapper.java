package com.xxxx.crm.dao;

import com.xxxx.base.BaseMapper;
import com.xxxx.crm.vo.Permission;

import java.util.List;

public interface PermissionMapper extends BaseMapper<Permission, Integer> {
    int countPermissionByRoleId(Integer roleId);

    int delPermissionByRoleId(Integer roleId);

    List<Integer> queryRoleHasMids(Integer roleId);

    List<String> queryUserHasModule(Integer userId);

    Integer countPermissionByModuleId(Integer id);

    Integer delPermissionByModuleId(Integer id);
}