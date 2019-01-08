package com.tom.cake.service;

import com.tom.cake.model.Goods;

import java.util.List;

public interface GoodsService {
    List<Goods> findByType(Goods goods);

    List<Goods> findByStar(Goods goods);

    Goods findByGoods(Goods goods);

    List<Goods> findSearchGoods(Goods goods);

    List<Goods> findAllGoodsStarLQ3();
}
