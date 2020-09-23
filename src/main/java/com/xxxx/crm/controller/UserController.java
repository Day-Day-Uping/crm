package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import com.xxxx.base.ResultInfo;
import com.xxxx.crm.model.UserModel;
import com.xxxx.crm.query.UserQuery;
import com.xxxx.crm.service.UserService;
import com.xxxx.crm.utils.LoginUserUtil;
import com.xxxx.crm.vo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    @Resource
    private UserService userService;

    //查询客户经理
    @RequestMapping("queryAllCusManager")
    @ResponseBody
    public List<Map<String, Object>> queryAllCusManager() {
       return userService.queryAllCusManager();
    }


    //删除
    @RequestMapping("delete")
    @ResponseBody
    public ResultInfo del(Integer[] ids) {
        userService.delUserIds(ids);
        return success("用户已删除");
    }

    @RequestMapping("addOrUpdateUserPage")
    public String userPage(Integer id, Model model) {
        model.addAttribute("user", userService.selectByPrimaryKey(id));
        return "user/addOrUpd";
    }

    @RequestMapping("index")
    public String index() {
        return "user/user";
    }

    @RequestMapping("/save")
    @ResponseBody
    public ResultInfo save(User user) {
        userService.save(user);
        return success("用户记录添加成功");
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResultInfo update(User user) {
        userService.update(user);
        return success("用户记录更新成功");
    }

    /**
     * 用户登录
     *
     * @param userName
     * @param userPwd
     * @return
     */
    @PostMapping("login")
    @ResponseBody
    public ResultInfo login(String userName, String userPwd) {
        ResultInfo resultInfo = new ResultInfo();
        UserModel userModel = userService.login(userName, userPwd);
        /**
         * 登录成功后
         *    1.将用户登录信息存入session
         *    2.将用户信息返回给客户端 有客户端(cookie)保存
         */
        resultInfo.setResult(userModel);
        return resultInfo;
    }

    @PostMapping("updatePassword")
    @ResponseBody
    public ResultInfo updatePassword(HttpServletRequest request, String oldPassword, String newPassword, String confirmPassword) {
        ResultInfo resultInfo = new ResultInfo();
        userService.updateUserPassword(LoginUserUtil.releaseUserIdFromCookie(request), oldPassword, newPassword, confirmPassword);
        return resultInfo;
    }


    @RequestMapping("toPasswordPage")
    public String toPasswordPage() {
        return "user/password";
    }


    @PostMapping("login02")
    @ResponseBody
    public ResultInfo login02(String userName, String userPwd) {
        ResultInfo resultInfo = new ResultInfo();
        UserModel userModel = userService.login(userName, userPwd);
        /**
         * 登录成功后
         *    1.将用户登录信息存入session
         *    2.将用户信息返回给客户端 有客户端(cookie)保存
         */
        resultInfo.setResult(userModel);
        return resultInfo;
    }

    //查询所有销售
    @RequestMapping("queryAllSales")
    @ResponseBody
    public List<Map<String, Object>> queryAllSales() {
        return userService.queryAllSales();
    }

    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> queryUsersByParams(UserQuery userQuery) {
        return userService.queryUsersByParams(userQuery);

    }

}
