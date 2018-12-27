package com.tom.cake.controller;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.Cart;
import com.tom.cake.model.Users;
import com.tom.cake.service.CartService;
import com.tom.cake.vo.CartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController extends BaseController {

    @Autowired
    private CartService cartService;

    /**
     * 加入购物车
     *
     * @param cart
     * @param session
     * @return
     */
    @RequestMapping("/addCart")
    @ResponseBody
    public ResultEntity<String> addCart(Cart cart, Integer money, HttpSession session) {
        System.out.println("money:" + money);
        ResultEntity<String> result = new ResultEntity<>();
        Users user = getUser(session);
        cart.setUser_id(user.getUser_id());
        Cart isExistCart = cartService.findByGIdAndUId(cart);
        try {
            if (isExistCart == null) {
                cart.setNum(1);
                cartService.saveCart(cart);
                result.setCodeAndMsg(ResultEnum.INSERT_SUCCESS_MESS);
            } else {
                isExistCart.setNum(isExistCart.getNum() + 1);
                System.out.println();
                isExistCart.setMoney(cart.getMoney() + isExistCart.getMoney());
                cartService.updateCart(isExistCart);
                result.setCodeAndMsg(ResultEnum.INSERT_SUCCESS_MESS);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.setCodeAndMsg(ResultEnum.INSERT_FAILED_MESS);
        }
        return result;
    }


    @RequestMapping("/shopcart")
    public ModelAndView shopcart(HttpSession session) {
        Users user = getUser(session);
        ModelAndView mv = new ModelAndView("shopcart");
        Cart cart = new Cart();
        cart.setUser_id(user.getUser_id());
        List<CartVo> usersCart = cartService.findForUsersCart(cart);
        mv.addObject("usersCart", usersCart);
        return mv;
    }
}
