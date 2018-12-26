package com.tom.cake.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import com.tom.cake.model.Cart;

@Mapper
public interface cartDao {
    int insert(@Param("pojo") Cart pojo);

    int insertSelective(@Param("pojo") Cart pojo);

    int insertList(@Param("pojos") List<Cart> pojo);

    int update(@Param("pojo") Cart pojo);
}
