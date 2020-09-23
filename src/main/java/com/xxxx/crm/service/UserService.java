package com.xxxx.crm.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xxxx.base.BaseService;
import com.xxxx.crm.dao.UserMapper;
import com.xxxx.crm.dao.UserRoleMapper;
import com.xxxx.crm.model.UserModel;
import com.xxxx.crm.query.UserQuery;
import com.xxxx.crm.utils.*;
import com.xxxx.crm.vo.User;
import com.xxxx.crm.vo.UserRole;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserService extends BaseService<User, Integer> {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    public UserModel login(String userName, String userPwd) {
        /**
         * 1.参数校验
         *    用户名  非空
         *    密码    非空
         * 2.根据用户名  查询用户记录
         * 3.用户存在性校验
         *     不存在   -->记录不存在  方法结束
         * 4.用户存在
         *     校验密码
         *        密码错误 -->密码不正确   方法结束
         * 5.密码正确
         *     用户登录成功  返回用户信息
         */
        checkLoginParams(userName, userPwd);
        User user = userMapper.queryUserByUserName(userName);
        AssertUtil.isTrue(null == user, "用户不存在或已注销!");
        AssertUtil.isTrue(!(user.getUserPwd().equals(Md5Util.encode(userPwd))), "用户密码不正确，请重新输入!");
        return buildUserInfo(user);
    }

    private UserModel buildUserInfo(User user) {
        UserModel userModel = new UserModel();
        userModel.setUserIdStr(UserIDBase64.encoderUserID(user.getId()));
        userModel.setUserName(user.getUserName());
        userModel.setTrueName(user.getTrueName());
        return userModel;
    }

    private void checkLoginParams(String userName, String userPwd) {
        AssertUtil.isTrue(StringUtils.isBlank(userName), "用户名不能为空!");
        AssertUtil.isTrue(StringUtils.isBlank(userPwd), "用户密码不能为空!");
    }

    public void updateUserPassword(Integer userId, String oldPassword, String newPassword, String confirmPassword) {
        /**
         * 1.参数校验
         *     userId  非空  记录必须存在
         *     oldPassword  非空 与数据库密文 密码保持一致
         *     newPassword  非空   与原始密码不能相同
         *     confirmPassword  非空 与新密码保持一致
         * 2.设置用户新密码
         *     新密码进行加密处理
         * 3.执行更新操作
         */
        checkParams(userId, oldPassword, newPassword, confirmPassword);
        User user = userMapper.selectByPrimaryKey(userId);
        user.setUserPwd(Md5Util.encode(newPassword));
        AssertUtil.isTrue(updateByPrimaryKeySelective(user) < 1, "用户密码更新失败!");
    }

    private void checkParams(Integer userId, String oldPassword, String newPassword, String confirmPassword) {
        User temp = userMapper.selectByPrimaryKey(userId);
        AssertUtil.isTrue(null == userId || null == temp, "用户未登录或不存在!");
        AssertUtil.isTrue(StringUtils.isBlank(oldPassword), "请输入原始密码!");
        AssertUtil.isTrue(StringUtils.isBlank(newPassword), "请输入新密码!");
        AssertUtil.isTrue(StringUtils.isBlank(confirmPassword), "请输入确认密码!");
        AssertUtil.isTrue(!(temp.getUserPwd().equals(Md5Util.encode(oldPassword))), "原始密码不正确!");
        AssertUtil.isTrue(!(newPassword.equals(confirmPassword)), "新密码输入不一致!");
        AssertUtil.isTrue(oldPassword.equals(newPassword), "新密码与原始密码不能相同!");
    }

    //返回销售人员列表
    public List<Map<String, Object>> queryAllSales() {
        return userMapper.queryAllSales();
    }

    //列表
    public Map<String, Object> queryUsersByParams(UserQuery userQuery) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageHelper.startPage(userQuery.getPage(), userQuery.getLimit());
        PageInfo<User> pageInfo = new PageInfo<User>(selectByParams(userQuery));
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", pageInfo.getTotal());
        map.put("data", pageInfo.getList());
        return map;
    }

    //添加
    public void save(User user) {
        /**
         * 用户名非空
         * email合法
         * 手机格式合法
         * 默认设置
         * 密码:123
         * 创建时间
         * 更新时间
         * isValid
         */
        checkFormParams(user.getUserName(), user.getEmail(), user.getPhone());
        //用户名唯一
        AssertUtil.isTrue(userMapper.queryUserByUserName(user.getUserName()) != null, "用户已存在,请重新输入");
        user.setIsValid(1);
        user.setCreateDate(new Date());
        user.setUpdateDate(new Date());
        user.setUserPwd(Md5Util.encode("123"));
        AssertUtil.isTrue(insertSelective(user) < 1, "用户添加失败");

        //用户角色管理
        //获取添加的用户id主键
        Integer userId = userMapper.queryUserByUserName(user.getUserName()).getId();
        //角色ids
        String roleIds = user.getRoleIds();
        //批量将userId和RoleId加入到用户角色表中
        //分割分配的角色id
        relationUserRole(userId, roleIds);
    }

    //用户角色id关联
    private void relationUserRole(Integer userId, String roleIds) {
        //角色关联判断
        int i = userRoleMapper.countUserRoleByUserId(userId);
        if (i > 0) {
            AssertUtil.isTrue(userRoleMapper.delUserRoleByUserId(userId) != i, "用户角色记录管理关联失败");
        }

        //角色ids非空才添加
        if (StringUtils.isNotBlank(roleIds)) {
            List<UserRole> userRoles = new ArrayList<>();
            for (String s : roleIds.split(",")) {
                UserRole userRole = new UserRole();
                userRole.setRoleId(Integer.parseInt(s));
                userRole.setUserId(userId);
                userRole.setCreateDate(new Date());
                userRole.setUpdateDate(new Date());
                userRoles.add(userRole);
            }
            AssertUtil.isTrue(userRoleMapper.insertBatch(userRoles) != userRoles.size(),
                    "用户角色记录登记失败");

        }
    }

    //更新
    public void update(User user) {
        /**
         * 用户名非空
         * email合法
         * 手机格式合法
         * 默认设置
         * 密码:123
         * 创建时间
         * 更新时间
         * isValid
         */
        //id查询
        User temp = selectByPrimaryKey(user.getId());
        AssertUtil.isTrue(temp == null, "待更新的用户不存在");
        checkFormParams(user.getUserName(), user.getEmail(), user.getPhone());
        //检查重名
        temp = userMapper.queryUserByUserName(user.getUserName());
        AssertUtil.isTrue(null != temp && !(temp.getId().equals(user.getId())), "该用户已存在");
        user.setIsValid(1);
        user.setUpdateDate(new Date());
        AssertUtil.isTrue(updateByPrimaryKeySelective(user) < 1, "用户更新失败");

        /**
         * 用户角色管理
         *先删除再添加
         */
        relationUserRole(user.getId(), user.getRoleIds());

    }

    //校验表单参数
    private void checkFormParams(String userName, String email, String phone) {

        AssertUtil.isTrue(StringUtils.isBlank(userName), "请输入用户名");
        AssertUtil.isTrue(!EmailUtil.checkEmail(email), "邮箱格式非法");
        AssertUtil.isTrue(!PhoneUtil.isMobile(phone), "手机号格式非法");


    }

    //批量删除
    public void delUserIds(Integer[] ids) {
        AssertUtil.isTrue(ids == null || ids.length == 0, "请选择待删除的用户");
        AssertUtil.isTrue(deleteBatch(ids) != ids.length, "用户删除失败");
    }


    public List<Map<String, Object>> queryAllCusManager() {
        return userMapper.queryAllCusManager();
    }
}
