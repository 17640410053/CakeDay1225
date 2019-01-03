package com.tom.cake.vo;

import com.tom.cake.model.Goods;
import com.tom.cake.model.OrderTable;

import java.util.List;

public class GoodsVo extends Goods {
    private List<OrderTable> orderTableList;

    public List<OrderTable> getOrderTableList() {
        return orderTableList;
    }

    public void setOrderTableList(List<OrderTable> orderTableList) {
        this.orderTableList = orderTableList;
    }
}
