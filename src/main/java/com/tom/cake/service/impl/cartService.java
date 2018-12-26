package com.tom.cake.service.impl;

import com.tom.cake.model.Cart;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

import com.tom.cake.mapper.cartDao;

@Service
public class cartService{

    @Resource
    private cartDao cartDao;

    public int insert(Cart pojo){
        return cartDao.insert(pojo);
    }

    public int insertSelective(Cart pojo){
        return cartDao.insertSelective(pojo);
    }

    public int insertList(List<Cart> pojos){
        return cartDao.insertList(pojos);
    }

    public int update(Cart pojo){
        return cartDao.update(pojo);
    }
}
