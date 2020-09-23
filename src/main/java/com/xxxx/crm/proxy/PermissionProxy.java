package com.xxxx.crm.proxy;

import com.xxxx.crm.annotaion.RequirePermission;
import com.xxxx.crm.exceptions.AuthException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-18 15:00
 */
@Component
@Aspect
public class PermissionProxy {
    @Autowired
    private HttpSession session;

    @Around(value = "@annotation(com.xxxx.crm.annotaion.RequirePermission)")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        Object result = null;
        List<String> permissions = (List<String>) session.getAttribute("permissions");
        if (permissions == null || permissions.size() == 0) {
            throw new AuthException();
        }
        //获取方法签名
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        //获取方法,拿到注解
        RequirePermission rp = signature.getMethod().getDeclaredAnnotation(RequirePermission.class);
        if (!(permissions.contains(rp.code()))) {
            throw new AuthException();
        }
        result = pjp.proceed();
        return result;
    }

}
