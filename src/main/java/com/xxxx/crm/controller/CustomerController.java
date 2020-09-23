package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import com.xxxx.base.ResultInfo;
import com.xxxx.crm.query.CustomerQuery;
import com.xxxx.crm.service.CustomerOrderService;
import com.xxxx.crm.service.CustomerService;
import com.xxxx.crm.vo.Customer;
import com.xxxx.crm.vo.CustomerOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-19 16:40
 */
@Controller
@RequestMapping("customer")
public class CustomerController extends BaseController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerOrderService customerOrderService;

    //统计客户的构成
    @RequestMapping("countCusMake")
    @ResponseBody
    public Map<String, Object> countCusMake() {
        return customerService.countCusMake();
    }

    @RequestMapping("countCusMake/1")
    @ResponseBody
    public Map<String, Object> countCusMake1() {
        return customerService.countCusMake1();
    }


    @RequestMapping("orderDetailPage")
    public String orderDetailPage(Integer id, Model model) {
        model.addAttribute("order", customerOrderService.queryCustomerOrderById(id));

        return "customer/order_detail-page";
    }

    @RequestMapping("orderInfoPage")
    public String orderInfoPage(Integer id, Model model) {
        Customer customer = customerService.selectByPrimaryKey(id);
        model.addAttribute("order", customer);
        return "/customer/customer_order";
    }

    @RequestMapping("addOrUpdateCustomerPage")
    public String addOrUpdateCustomerPage(Integer id, Model model) {
        Customer customer = customerService.selectByPrimaryKey(id);
        model.addAttribute("customer", customer);
        return "/customer/add_update_page";
    }

    //删除
    @RequestMapping("delete")
    @ResponseBody
    public ResultInfo delCustomer(Integer id) {
        customerService.delCustomer(id);
        return success("客户删除成功");
    }

    //添加
    @RequestMapping("update")
    @ResponseBody
    public ResultInfo updateCustomer(Customer customer) {
        customerService.updateCustomer(customer);
        return success("客户更新成功");
    }

    //添加
    @RequestMapping("save")
    @ResponseBody
    public ResultInfo saveCustomer(Customer customer) {
        customerService.saveCustomer(customer);
        return success("客户添加成功");
    }

    //列表
    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> queryCustomerByParams(CustomerQuery customerQuery) {
        return customerService.queryCustomerByParams(customerQuery);
    }

    @RequestMapping("/index")
    public String index() {
        return "customer/customer";
    }


    //列表
    @RequestMapping("cus/attribution/list")
    @ResponseBody
    public Map<String, Object> queryCusAttributionByParams(CustomerQuery customerQuery) {
        return customerService.queryCusAttributionByParams(customerQuery);
    }

}
