package com.xxxx.crm.exceptions;

/**
 * @author 黄大大
 * @file crm
 * @creat 2020-09-18 15:09
 */
public class AuthException extends RuntimeException {
    private Integer code = 400;
    private String msg = "暂无权限!";

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    /**
     * Constructs a new runtime exception with {@code null} as its
     * detail message.  The cause is not initialized, and may subsequently be
     * initialized by a call to {@link #initCause}.
     */
    public AuthException(Integer code, String msg) {
        super(msg);
        this.code = code;
        this.msg = msg;
    }

    public AuthException(Integer code) {
        super("暂无权限!");
        this.code = code;
    }

    public AuthException() {
        super("暂无权限!");
    }


}
