package com.tom.cake.mapper;

import com.tom.cake.model.TP_Tree;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TP_TreeDao {
    int insert(@Param("pojo") TP_Tree pojo);

    int insertSelective(@Param("pojo") TP_Tree pojo);

    int insertList(@Param("pojos") List<TP_Tree> pojo);

    int update(@Param("pojo") TP_Tree pojo);

    List<TP_Tree> selectProvince();

    List<TP_Tree> selectCityOrCountry(TP_Tree tp_tree);



}
