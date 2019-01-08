package com.tom.cake.mapper;

import com.tom.cake.model.OrderTable;
import com.tom.cake.vo.OrderTableVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.tom.cake.model.Goods;

@Mapper
public interface GoodsDao {
    int insert(@Param("pojo") Goods pojo);

    int insertSelective(@Param("pojo") Goods pojo);

    int insertList(@Param("pojos") List<Goods> pojo);

    int update(@Param("pojo") Goods pojo);

    List<Goods> selectByType(Goods goods);

    List<Goods> selectByStar(Goods goods);

    Goods selectById(Goods goods);

    List<Goods> searchGoods(Goods goods);

    List<OrderTableVo> selectManyByOrderId(OrderTable orderTable);

    List<Goods> selectAllGoodsStarLQ3();

}
