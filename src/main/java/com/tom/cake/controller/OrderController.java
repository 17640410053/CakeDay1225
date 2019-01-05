package com.tom.cake.controller;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.Comment;
import com.tom.cake.model.Goods;
import com.tom.cake.model.OrderTable;
import com.tom.cake.model.Users;
import com.tom.cake.service.GoodsService;
import com.tom.cake.service.OrderTableService;
import com.tom.cake.vo.OrderTableVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {
    @Autowired
    private OrderTableService orderTableService;

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/pay_order")
    public ModelAndView pay_order(OrderTable orderTable) {
        ModelAndView mv = new ModelAndView("pay_order");
        OrderTable order = orderTableService.findByOrderId(orderTable);
        mv.addObject("order", order);
        return mv;
    }

    @RequestMapping("/pay_response")
    @ResponseBody
    public ResultEntity<String> pay_response(OrderTable orderTable, Integer num) {
        switch (num) {
            case 1:
                orderTable.setStatus(1);//已付款
                break;
            case 2:
                orderTable.setStatus(2);//已收货
                break;
            case 3:
                orderTable.setStatus(3);//已评价
                break;
            case 4:
                orderTable.setStatus(4);
        }

        return orderTableService.modifyOrderStatus(orderTable);
    }

    /**
     * <li>待付款</li>
     * <%--0--%>
     * <li>待发货</li>
     * <%--1--%>
     * <li>待收货</li>
     * <%--2--%>
     * <li>待评价</li>
     * <%--3--%>
     *
     * @param session
     * @return
     */

    @RequestMapping("/order_list")
    public ModelAndView order_list(HttpSession session) {
        ModelAndView mv = new ModelAndView("order_list");
        Users user = getUser(session);
        OrderTable orderTable = new OrderTable();
        orderTable.setUser_id(user.getUser_id());
        List<OrderTable> orderList = orderTableService.findAllOrdersByUId(orderTable);
        //waitPayOrderList
        orderTable.setStatus(-1);
        List<OrderTable> waitPayOrderList = orderTableService.findAllOrdersByUId(orderTable);
        //waitSendOrderList
        orderTable.setStatus(1);
        List<OrderTable> waitSendOrderList = orderTableService.findAllOrdersByUId(orderTable);
        //waitReceiveOrderList
        orderTable.setStatus(2);
        List<OrderTable> waitReceiveOrderList = orderTableService.findAllOrdersByUId(orderTable);
        //waitEstimateOrderList
        orderTable.setStatus(3);
        List<OrderTable> waitEstimateOrderList = orderTableService.findAllOrdersByUId(orderTable);

        mv.addObject("orderList", orderList);
        mv.addObject("waitPayOrderList", waitPayOrderList);
        mv.addObject("waitSendOrderList", waitSendOrderList);
        mv.addObject("waitReceiveOrderList", waitReceiveOrderList);
        mv.addObject("waitEstimateOrderList", waitEstimateOrderList);

        return mv;
    }

    @RequestMapping("/order_info")
    public ModelAndView info(OrderTable orderTable, Integer num) {
        ModelAndView mv = new ModelAndView("order_info");
        List<OrderTableVo> orderVos = orderTableService.findManyByOrderId(orderTable);
        mv.addObject("orderVos", orderVos);
        if (num != null) {
            mv = new ModelAndView("comment_order");
            orderTable.setStatus(3);
            ResultEntity<String> result = orderTableService.modifyOrderStatus(orderTable);
            if (result.getCode() == 0) {
                orderVos = orderTableService.findManyByOrderId(orderTable);
            }
            mv.addObject("orderVos", orderVos);
            return mv;
        }

        return mv;
    }

    @RequestMapping("/delete_order")
    public ResultEntity<String> delete_order(OrderTable orderTable) {
        ResultEntity<String> result = new ResultEntity<>();
        try {
            orderTableService.removeOrderByOrderId(orderTable);
            result.setCodeAndMsg(ResultEnum.DELETE_SUCCESS_MESS);
        } catch (Exception e) {
            e.printStackTrace();
            result.setCodeAndMsg(ResultEnum.DELETE_FAILED_MESS);
        }
        return result;
    }

    @RequestMapping("/comment_goods")
    public ModelAndView comment_goods(Goods goods) {
        ModelAndView mv = new ModelAndView("comment_goods");
        goods = goodsService.findByGoods(goods);
        mv.addObject("goods", goods);
        return mv;
    }

    @RequestMapping("/submit_comment")
    public ModelAndView submit_comment(Comment comment, HttpSession session) {
        ModelAndView mv = new ModelAndView("comment_goods");
        Integer user_id = getUser(session).getUser_id();
        return mv;
    }
}
