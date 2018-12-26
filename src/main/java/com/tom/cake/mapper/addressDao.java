package com.tom.cake.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import com.tom.cake.model.Address;

@Mapper
public interface addressDao {
    int insert(@Param("pojo") Address pojo);

    int insertSelective(@Param("pojo") Address pojo);

    int insertList(@Param("pojos") List<Address> pojo);

    int update(@Param("pojo") Address pojo);
}
