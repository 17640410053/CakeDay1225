package com.tom.cake.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.tom.cake.model.OrderDrawback;

@Mapper
public interface OrderDrawbackDao {
    int insert(@Param("pojo") OrderDrawback pojo);

    int insertSelective(@Param("pojo") OrderDrawback pojo);

    int insertList(@Param("pojos") List<OrderDrawback> pojo);

    int update(@Param("pojo") OrderDrawback pojo);

    OrderDrawback selectByOrderId(OrderDrawback orderDrawback);
}
