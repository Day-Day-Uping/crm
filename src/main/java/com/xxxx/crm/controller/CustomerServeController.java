package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import com.xxxx.base.ResultInfo;
import com.xxxx.crm.query.CustomerServeQuery;
import com.xxxx.crm.service.CustomerServeService;

import com.xxxx.crm.utils.LoginUserUtil;
import com.xxxx.crm.vo.CustomerServe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-21 1:20
 */
@Controller
@RequestMapping("customer_serve")
public class CustomerServeController extends BaseController {
    @Autowired
    private CustomerServeService customerServeService;

    @RequestMapping("addServeFeedBackPage")
    public String addServeFeedBackPage(Integer id, Model model) {
        model.addAttribute("feedback", customerServeService.selectByPrimaryKey(id));
        return "customerServe/customer_server_feedback_add";
    }

    @RequestMapping("addServeProcPage")
    public String addServeProcPage(Integer id, Model model) {
        model.addAttribute("serverProc", customerServeService.selectByPrimaryKey(id));
        return "customerServe/customer_server_proc_add";
    }

    @RequestMapping("addServeAssignPage")
    public String addServeAssignPage(Integer id, Model model) {
        model.addAttribute("serverAssign", customerServeService.selectByPrimaryKey(id));
        return "customerServe/customer_server_assign_add";
    }

    @RequestMapping("update")
    @ResponseBody
    public ResultInfo update(CustomerServe customerServe) {
        customerServeService.update(customerServe);
        return success("更新成功");
    }

    @RequestMapping("addPage")
    public String addPage() {
        return "customerServe/add_page";
    }

    @RequestMapping("save")
    @ResponseBody
    ResultInfo saveCustomerServe(CustomerServe customer) {
        customerServeService.saveCustomerServe(customer);
        return success("客户服务创建成功");
    }

    //列表
    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> queryCustomerServeByParams(Integer flag, HttpServletRequest request, CustomerServeQuery customerServeQuery) {
        if (flag == 1) {
            int uid = LoginUserUtil.releaseUserIdFromCookie(request);
            customerServeQuery.setAssigner(uid);
        }
        return customerServeService.queryCustomerServeByParams(customerServeQuery);
    }

    @RequestMapping("index/{type}")
    public String index(@PathVariable Integer type) {
        if (type != null) {
            if (type == 1) {
                return "customerServe/customer_serve";
            } else if (type == 2) {
                return "customerServe/customer_serve_assign";
            } else if (type == 3) {
                return "customerServe/customer_server_proce";
            } else if (type == 4) {
                return "customerServe/customer_server_feed_back";
            } else if (type == 5) {
                return "customerServe/customer_server_achieve";
            } else {
                return "null";
            }
        } else {
            return "null";
        }

    }
}
