package com.tom.cake.controller;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.*;
import com.tom.cake.service.AddressService;
import com.tom.cake.service.CartService;
import com.tom.cake.service.OrderDetailService;
import com.tom.cake.service.OrderTableService;
import com.tom.cake.service.impl.OrderTableServiceImpl;
import com.tom.cake.vo.CartVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

@Controller
public class CartController extends BaseController {

    @Autowired
    private CartService cartService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private OrderTableService orderTableService;


    @Autowired
    private OrderDetailService orderDetailService;

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
        System.out.println(cart.getGoods_id());
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
                cartService.modifyCart(isExistCart);
                result.setCodeAndMsg(ResultEnum.INSERT_SUCCESS_MESS);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.setCodeAndMsg(ResultEnum.INSERT_FAILED_MESS);
        }
        return result;
    }

//    @RequestMapping("/addGoodsToCart")
//    public ResultEntity<String> addGoodsToCart() {
//        ResultEntity<String> result = new ResultEntity<>();
//        return result;
//    }


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

    @RequestMapping("/deleteAllGoods")
    public ResultEntity<String> deleteAllGoods(HttpSession session) {
        Users user = getUser(session);
        Cart cart = new Cart();
        cart.setUser_id(user.getUser_id());
        return cartService.removeAllGoodsFromCart(cart);
    }


    @RequestMapping("/addGoodsToCart")//是哪个
    @ResponseBody
    public ResultEntity<Long> addGoodsToCart(Cart cart, Integer money, Integer num, HttpSession session) {
        System.out.println("money:" + money + ",num:" + num);
        Users user = getUser(session);
        cart.setUser_id(user.getUser_id());
        ResultEntity<Long> result = cartService.updateCart(cart, money, num);
        System.out.println(result);
        //这些都是null啊
        return result;
    }

    /**
     * 定单页面
     *
     * @param session
     * @return
     */
    @RequestMapping("/ordertable")
    public ModelAndView ordertable(HttpSession session) {
        Users user = getUser(session);
        ModelAndView mv = new ModelAndView("order_table");
        Cart cart = new Cart();
        cart.setUser_id(user.getUser_id());
        Address address = new Address();
        address.setUser_id(user.getUser_id());
        List<Address> addressList = addressService.findAllAddressByUsersId(address);
        Address defaultAddress = addressService.findByUsersId(address);
        mv.addObject("defaultAddress", defaultAddress);
        mv.addObject("addressList", addressList);
        List<CartVo> usersCart = cartService.findForUsersCart(cart);
        Long countMoney = cartService.countMoney(cart);
        mv.addObject("cartOrder", usersCart);
        mv.addObject("countMoney", countMoney);
        return mv;
    }

    /**
     * 添加订单
     * status:未付款为0，已付款为1，已发货为2，已收货为3，已评价为4
     *
     * @return
     */
    @RequestMapping("/addOrder")
    @ResponseBody
    public ResultEntity<String> addOrder(HttpSession session, Address address) {
        ResultEntity<String> result = new ResultEntity<>();
        System.out.println("address_id-------" + address.getAddress_id());
        Users user = getUser(session);
        Cart cart = new Cart();
        cart.setUser_id(user.getUser_id());
        List<Cart> cartList = cartService.selectCartByUserId(cart);
        Long countMoney = cartService.countMoney(cart);
        OrderTable orderTable = new OrderTable();
        String order_id = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        orderTable.setOrder_id(order_id);
        orderTable.setUser_id(user.getUser_id());
        orderTable.setMoney(countMoney.intValue());
        orderTable.setStatus(0);
        orderTable.setAddress_id(address.getAddress_id());
        try {
            orderTableService.saveOrder(orderTable);
            for (Cart c : cartList) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrder_id(order_id);
                orderDetail.setGoods_id(c.getGoods_id());
                orderDetail.setNum(c.getNum());
                orderDetail.setMoney(c.getMoney());
                orderDetailService.saveOrderDetails(orderDetail);
            }
            cartService.removeCartByUserId(cart);
            result.setCodeAndMsg(ResultEnum.INSERT_SUCCESS_MESS);
            result.setData(order_id);
        } catch (Exception e) {
            e.printStackTrace();
            result.setCodeAndMsg(ResultEnum.INSERT_FAILED_MESS);
        }
        return result;

    }


}
