package com.tom.cake.service.impl;

import com.tom.cake.model.Goods;
import com.tom.cake.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

import com.tom.cake.mapper.GoodsDao;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Resource
    private GoodsDao goodsDao;

    public int insert(Goods pojo) {
        return goodsDao.insert(pojo);
    }

    public int insertSelective(Goods pojo) {
        return goodsDao.insertSelective(pojo);
    }

    public int insertList(List<Goods> pojos) {
        return goodsDao.insertList(pojos);
    }

    public int update(Goods pojo) {
        return goodsDao.update(pojo);
    }

    @Override
    public List<Goods> findByType(Goods goods) {
        return goodsDao.selectByType(goods);
    }

    @Override
    public List<Goods> findByStar(Goods goods) {
        return goodsDao.selectByStar(goods);
    }
}
