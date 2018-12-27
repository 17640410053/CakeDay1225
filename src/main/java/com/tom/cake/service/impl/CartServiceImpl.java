package com.tom.cake.service.impl;

import com.tom.cake.model.Cart;
import com.tom.cake.service.CartService;
import com.tom.cake.vo.CartVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

import com.tom.cake.mapper.CartDao;

@Service
public class CartServiceImpl implements CartService {

    @Resource
    private CartDao cartDao;

    public int insert(Cart pojo) {
        return cartDao.insert(pojo);
    }

    public int insertSelective(Cart pojo) {
        return cartDao.insertSelective(pojo);
    }

    public int insertList(List<Cart> pojos) {
        return cartDao.insertList(pojos);
    }

    public int update(Cart pojo) {
        return cartDao.update(pojo);
    }

    @Override
    public Cart findByGIdAndUId(Cart cart) {
        return cartDao.selectByGIdAndUId(cart);
    }

    @Override
    public void saveCart(Cart cart) {
        cartDao.insertCart(cart);
    }

    @Override
    public void updateCart(Cart cart) {
        cartDao.updateCart(cart);
    }

    @Override
    public List<CartVo> findForUsersCart(Cart cart) {
        return cartDao.selectForUsersCart(cart);
    }

    @Override
    public void remove(Cart cart) {
        cartDao.delete(cart);
    }
}
