package com.tom.cake.service.impl;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
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
    public ResultEntity<Long> updateCart(Cart cart, Integer money, Integer num) {
        ResultEntity<Long> result = new ResultEntity<>();
        Cart isExistCart = cartDao.selectByGIdAndUId(cart);
        System.out.println(num);
        try {
            if (num == 1) {
                if (isExistCart.getNum() >= 10) {
                    result.setCodeAndMsg(ResultEnum.NUM_OVERLARGE);
                    return result;
                } else {
                    isExistCart.setNum(isExistCart.getNum() + 1);
                    isExistCart.setMoney(money + isExistCart.getMoney());
                    cartDao.updateCart(isExistCart);
                    //result没给值
                    result.setCodeAndMsg(ResultEnum.INSERT_SUCCESS_MESS);
                }
            } else if (num == 2) {
                if (isExistCart.getNum() == 1) {
                    cartDao.delete(cart);
                    Long countMoney = cartDao.countMoney(cart);
                    if (countMoney == null) {
                        countMoney = 0L;
                    }
                    Long countNum = cartDao.countNum(cart);
                    if (countNum == null) {
                        countNum = 0L;
                    }
                    result.setCount(countMoney);
                    result.setData(countNum);
                    result.setData(cartDao.countNum(cart));
                    result.setCodeAndMsg(ResultEnum.REMOVE_SUCCESS);
                } else {
                    isExistCart.setNum(isExistCart.getNum() - 1);
                    isExistCart.setMoney(isExistCart.getMoney() - money);
                    cartDao.updateCart(isExistCart);
                    result.setCodeAndMsg(ResultEnum.DELETE_SUCCESS_MESS);
                }
            } else if (num == 3) {
                cartDao.delete(cart);
                Long countMoney = cartDao.countMoney(cart);
                if (countMoney == null) {
                    countMoney = 0L;
                }
                Long countNum = cartDao.countNum(cart);
                if (countNum == null) {
                    countNum = 0L;
                }
                result.setCount(countMoney);
                result.setData(countNum);
                result.setCodeAndMsg(ResultEnum.DELETE_SUCCESS_MESS);
            }
//            result.setCodeAndMsg(ResultEnum.PROCESS_SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            result.setCodeAndMsg(ResultEnum.PROCESS_FAILED);
        }
        System.out.println("0-------->" + result);
        return result;
    }

    @Override
    public List<CartVo> findForUsersCart(Cart cart) {
        return cartDao.selectForUsersCart(cart);
    }

    @Override
    public void remove(Cart cart) {
        cartDao.delete(cart);
    }

    @Override
    public ResultEntity<String> removeAllGoodsFromCart(Cart cart) {
        ResultEntity<String> result = new ResultEntity<>();
        try {
            cartDao.deleteAllGoodsFromCart(cart);
            result.setCodeAndMsg(ResultEnum.DELETE_SUCCESS_MESS);
        } catch (Exception e) {
            result.setCodeAndMsg(ResultEnum.DELETE_FAILED_MESS);
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void modifyCart(Cart cart) {
        cartDao.updateCart(cart);
    }

    @Override
    public Long countMoney(Cart cart) {
        return cartDao.countMoney(cart);
    }

    @Override
    public List<Cart> selectCartByUserId(Cart cart) {
        return cartDao.selectCartByUserId(cart);
    }

    @Override
    public void removeCartByUserId(Cart cart) {
        cartDao.deleteCartByUserId(cart);
    }


}
