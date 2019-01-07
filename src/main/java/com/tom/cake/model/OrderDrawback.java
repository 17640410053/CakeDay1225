package com.tom.cake.model;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderDrawback {
    private Integer draw_id;
    private String order_id;
    private Integer user_id;
    private String phone;
    private String reason;
    private Integer state;
    private Timestamp createtime;

    public Integer getDraw_id() {
        return draw_id;
    }

    public void setDraw_id(Integer draw_id) {
        this.draw_id = draw_id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }
}
