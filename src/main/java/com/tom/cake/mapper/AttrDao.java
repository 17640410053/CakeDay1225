package com.tom.cake.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import com.tom.cake.model.Attr;

@Mapper
public interface AttrDao {
    int insert(@Param("pojo") Attr pojo);

    int insertSelective(@Param("pojo") Attr pojo);

    int insertList(@Param("pojos") List<Attr> pojo);

    int update(@Param("pojo") Attr pojo);
}
