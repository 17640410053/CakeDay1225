package com.tom.cake.mapper;

import com.tom.cake.vo.CartVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.tom.cake.model.Cart;

@Mapper
public interface CartDao {
    int insert(@Param("pojo") Cart pojo);

    int insertSelective(@Param("pojo") Cart pojo);

    int insertList(@Param("pojos") List<Cart> pojo);

    int update(@Param("pojo") Cart pojo);

    Cart selectByGIdAndUId(Cart cart);

    void insertCart(Cart cart);

    void updateCart(Cart cart);

    List<CartVo> selectForUsersCart(Cart cart);

    void delete(Cart cart);

}
