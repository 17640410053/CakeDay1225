package com.tom.cake.service;

import com.tom.cake.model.Cart;
import com.tom.cake.vo.CartVo;

import java.util.List;

public interface CartService {
    Cart findByGIdAndUId(Cart cart);

    void saveCart(Cart cart);

    void updateCart(Cart cart);

    List<CartVo> findForUsersCart(Cart cart);
    void remove(Cart cart);
}
