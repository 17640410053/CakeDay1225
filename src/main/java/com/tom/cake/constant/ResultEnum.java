package com.tom.cake.constant;

public enum ResultEnum {
    /**
     * 这儿相当于new 的对象的
     */
    UPDATE_SUCCESS_MESS(0, "修改成功"),
    INSERT_SUCCESS_MESS(0, "添加成功"),
    LOGIN_SUCCESS_MESS(0, "登录成功"),
    DELETE_SUCCESS_MESS(0, "删除成功"),
    UPDATE_FAILED_MESS(500, "修改失败"),
    INSERT_FAILED_MESS(500, "添加失败"),
    LOGIN_FAILED_MESS(500, "用户名或密码不正确"),
    USER_IS_EXIST(0, "用户名已存在"),
    USER_NOT_FOUND(500, "用户名不存在"),
    DELETE_FAILED_MESS(500, "删除失败"),
    SELECT_SUCCESS(0, "查询成功"),
    SELECT_FAILED(500, "查询失败"),
    MAIL_SEND_SUCCESS(0, "邮件发送成功"),
    MAIL_SEND_FAILED(500, "邮件发送失败"),
    VERIFY_CODE_FAILED(500, "验证码不正确"),



    ;

    private Integer code;
    private String msg;

    ResultEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}