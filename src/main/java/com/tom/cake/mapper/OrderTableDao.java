package com.tom.cake.mapper;

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
}
