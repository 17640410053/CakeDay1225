package com.tom.cake.service.impl;

import com.tom.cake.model.OrderTable;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

import com.tom.cake.mapper.OrderTableDao;

@Service
public class OrderTableService{

    @Resource
    private OrderTableDao orderTableDao;

    public int insert(OrderTable pojo){
        return orderTableDao.insert(pojo);
    }

    public int insertSelective(OrderTable pojo){
        return orderTableDao.insertSelective(pojo);
    }

    public int insertList(List<OrderTable> pojos){
        return orderTableDao.insertList(pojos);
    }

    public int update(OrderTable pojo){
        return orderTableDao.update(pojo);
    }
}
