package com.tom.cake.service.impl;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.mapper.OrderTableDao;
import com.tom.cake.model.OrderTable;
import com.tom.cake.service.OrderTableService;
import com.tom.cake.vo.OrderTableVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderTableServiceImpl implements OrderTableService {

    @Resource
    private OrderTableDao orderTableDao;

    public int insert(OrderTable pojo) {
        return orderTableDao.insert(pojo);
    }

    public int insertSelective(OrderTable pojo) {
        return orderTableDao.insertSelective(pojo);
    }

    public int insertList(List<OrderTable> pojos) {
        return orderTableDao.insertList(pojos);
    }

    public int update(OrderTable pojo) {
        return orderTableDao.update(pojo);
    }

    @Override
    public void saveOrder(OrderTable order) {
        try {
            orderTableDao.addOrder(order);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderTable findByOrderId(OrderTable orderTable) {
        return orderTableDao.selectByOrderId(orderTable);
    }

    @Override
    public ResultEntity<String> modifyOrderStatus(OrderTable orderTable) {
        ResultEntity<String> result = new ResultEntity<>();
        try {
            orderTableDao.updateStatus(orderTable);
            result.setCodeAndMsg(ResultEnum.UPDATE_SUCCESS_MESS);
        } catch (Exception e) {
            e.printStackTrace();
            result.setCodeAndMsg(ResultEnum.UPDATE_FAILED_MESS);
        }
        return result;
    }

    @Override
    public List<OrderTable> findAllOrdersByUId(OrderTable orderTable) {
        return orderTableDao.selectAllOrdersByUId(orderTable);
    }

    @Override
    public List<OrderTableVo> findManyByOrderId(OrderTable orderTable) {
        return orderTableDao.selectManyByOrderId(orderTable);
    }

    @Override
    public void removeOrderByOrderId(OrderTable orderTable) {
        orderTableDao.deleteOrderByOrderId(orderTable);
    }
}
