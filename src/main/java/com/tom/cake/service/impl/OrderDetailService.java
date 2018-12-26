package com.tom.cake.service.impl;

import com.tom.cake.model.OrderDetail;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

import com.tom.cake.mapper.OrderDetailDao;

@Service
public class OrderDetailService{

    @Resource
    private OrderDetailDao orderDetailDao;

    public int insert(OrderDetail pojo){
        return orderDetailDao.insert(pojo);
    }

    public int insertSelective(OrderDetail pojo){
        return orderDetailDao.insertSelective(pojo);
    }

    public int insertList(List<OrderDetail> pojos){
        return orderDetailDao.insertList(pojos);
    }

    public int update(OrderDetail pojo){
        return orderDetailDao.update(pojo);
    }
}
