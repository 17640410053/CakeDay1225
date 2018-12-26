package com.tom.cake.vo;

import com.tom.cake.model.Goods;
import com.tom.cake.model.Type;

import java.util.List;

public class TypeVo extends Type {
    private List<Type> typesList;

    private List<Goods> goodsList;

    public List<Goods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }

    public List<Type> getTypesList() {
        return typesList;
    }

    public void setTypesList(List<Type> typesList) {
        this.typesList = typesList;
    }
}
