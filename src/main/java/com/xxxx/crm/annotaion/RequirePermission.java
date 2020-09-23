package com.xxxx.crm.annotaion;

import java.lang.annotation.*;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-18 14:49
 */
@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequirePermission {
    //权限码
    String code() default "";
}
