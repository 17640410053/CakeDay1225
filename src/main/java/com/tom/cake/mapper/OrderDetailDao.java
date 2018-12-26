package com.tom.cake.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import com.tom.cake.model.OrderDetail;

@Mapper
public interface OrderDetailDao {
    int insert(@Param("pojo") OrderDetail pojo);

    int insertSelective(@Param("pojo") OrderDetail pojo);

    int insertList(@Param("pojos") List<OrderDetail> pojo);

    int update(@Param("pojo") OrderDetail pojo);
}
