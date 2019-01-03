package com.tom.cake.vo;

import com.tom.cake.model.Goods;
import com.tom.cake.model.OrderTable;

import java.util.List;

public class OrderTableVo extends OrderTable {
    private String addressName;
    private String phone;
    //这个地方已经是OrderDetailVo的集合了，也就是存在了这个集合里面
    List<OrderDetailVo> orderDetailList;

    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<OrderDetailVo> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetailVo> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }
}
