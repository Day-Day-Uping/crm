package com.xxxx.crm.controller;

import com.xxxx.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-22 9:03
 */
@Controller
@RequestMapping("report")
public class ReportController extends BaseController {
    @RequestMapping("/{type}")
    public String index(@PathVariable Integer type) {
        if (type == 0) {
            //客户贡献分析
            return "report/cus_contribution";
        }
        if (type == 1) {
            //客户构成
            return "report/cus_make";
        } if (type == 3) {
            //客户流失
            return "report/cus_loss";
        }else {
            return "";
        }

    }

}
