package com.itheima.exception;

/**
 * 自定义异常类
 * @Title: sysException
 * @Description:IntelliJ IDEA
 * @Auther:LiuQb
 * @Version:1.0
 * @create:2020/1/16 0016 17:39
 */
public class SysException extends Exception {
    private String message;

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public SysException(String message) {
        this.message = message;
    }

    public SysException(String message, String message1) {
        super(message);
        this.message = message1;
    }
}

