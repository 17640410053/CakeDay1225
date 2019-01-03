package com.tom.cake.service;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.model.Cart;
import com.tom.cake.vo.CartVo;

import java.util.List;

public interface CartService {
    Cart findByGIdAndUId(Cart cart);

    void saveCart(Cart cart);

    ResultEntity<Long> updateCart(Cart cart, Integer money, Integer num);

    List<CartVo> findForUsersCart(Cart cart);

    void remove(Cart cart);

    ResultEntity<String> removeAllGoodsFromCart(Cart cart);

    void modifyCart(Cart cart);

    Long countMoney(Cart cart);

    List<Cart> selectCartByUserId(Cart cart);

    void removeCartByUserId(Cart cart);
}
