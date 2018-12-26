package com.tom.cake.model;

public class OrderDetail {
    private Integer orderDetail_id;
    private String order_id;
    private Integer goods_id;
    private Integer num;
    private Integer money;

    public Integer getOrderDetail_id() {
        return orderDetail_id;
    }

    public void setOrderDetail_id(Integer orderDetail_id) {
        this.orderDetail_id = orderDetail_id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }
}
