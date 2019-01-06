package com.tom.cake.service;

import com.tom.cake.model.OrderDetail;

public interface OrderDetailService {

    void saveOrderDetails(OrderDetail orderDetail);
    void deleteByOrderId(OrderDetail orderDetail);
}
