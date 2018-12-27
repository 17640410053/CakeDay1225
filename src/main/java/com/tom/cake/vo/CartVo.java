package com.tom.cake.vo;

import com.tom.cake.model.Cart;
import com.tom.cake.model.Goods;

import java.util.List;

public class CartVo extends Cart {
    private List<Goods> goodsList;

    public List<Goods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }
}
