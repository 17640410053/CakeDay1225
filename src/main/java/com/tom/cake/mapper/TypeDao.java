package com.tom.cake.mapper;

import com.tom.cake.vo.TypeVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.tom.cake.model.Type;

@Mapper
public interface TypeDao {
    int insert(@Param("pojo") Type pojo);

    int insertSelective(@Param("pojo") Type pojo);

    int insertList(@Param("pojos") List<Type> pojo);

    int update(@Param("pojo") Type pojo);

    List<Type> selectTypes();

    List<Type> selectByParentId(Type type);

    List<TypeVo> selectTypesForChild();

    List<TypeVo> selectTypesForGoods();
}
