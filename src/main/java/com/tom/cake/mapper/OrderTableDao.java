package com.tom.cake.mapper;

import com.tom.cake.vo.OrderTableVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.tom.cake.model.OrderTable;

@Mapper
public interface OrderTableDao {
    int insert(@Param("pojo") OrderTable pojo);

    int insertSelective(@Param("pojo") OrderTable pojo);

    int insertList(@Param("pojos") List<OrderTable> pojo);

    int update(@Param("pojo") OrderTable pojo);

    void addOrder(OrderTable orderTable);

    OrderTable selectByOrderId(OrderTable orderTable);

    void updateStatus(OrderTable orderTable);

    List<OrderTable> selectAllOrdersByUId(OrderTable orderTable);

    List<OrderTableVo> selectManyByOrderId(OrderTable orderTable);
}
