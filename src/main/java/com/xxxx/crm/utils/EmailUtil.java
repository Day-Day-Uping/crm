package com.xxxx.crm.utils;

import java.util.regex.Pattern;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-16 17:23
 */
public class EmailUtil {
    /**
     * 检查邮箱是否合法
     */
    public static Boolean checkEmail(String email) {
     return Pattern
             .matches("^(\\w+([-.][A-Za-z0-9]+)*){3,18}@\\w+([-.][A-Za-z0-9]+)*\\.\\w+([-.][A-Za-z0-9]+)*$"
             , email);
    }
}
