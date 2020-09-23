package com.xxxx.crm.task;

import com.xxxx.crm.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 定时任务
 *
 * @author 黄大大
 * @file crm
 * @creat 2020-09-20 18:27
 */
@Service
public class JobService {
    @Autowired
    private CustomerService customerService;

    @Scheduled(cron = "0 15 10 15 * ?")
    public void job() {
        customerService.updateCustomerState();
    }
}
