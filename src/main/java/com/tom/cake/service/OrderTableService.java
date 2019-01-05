package com.tom.cake.service;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.model.OrderTable;
import com.tom.cake.vo.OrderTableVo;

import java.util.List;

public interface OrderTableService {

    void saveOrder(OrderTable order);

    OrderTable findByOrderId(OrderTable orderTable);

    ResultEntity<String> modifyOrderStatus(OrderTable orderTable);

    List<OrderTable> findAllOrdersByUId(OrderTable orderTable);


    List<OrderTableVo> findManyByOrderId(OrderTable orderTable);

    void removeOrderByOrderId(OrderTable orderTable);
}
