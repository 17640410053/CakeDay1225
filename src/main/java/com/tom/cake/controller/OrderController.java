package com.tom.cake.controller;

import com.tom.cake.constant.ResultEntity;
import com.tom.cake.constant.ResultEnum;
import com.tom.cake.model.*;
import com.tom.cake.service.GoodsService;
import com.tom.cake.service.OrderDetailService;
import com.tom.cake.service.OrderTableService;
import com.tom.cake.service.impl.OrderDrawbackServiceImpl;
import com.tom.cake.vo.OrderTableVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {
    @Autowired
    private OrderTableService orderTableService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private OrderDrawbackServiceImpl orderDrawbackService;

    @RequestMapping("/pay_order")
    public ModelAndView pay_order(OrderTable orderTable) {
        ModelAndView mv = new ModelAndView("pay_order");
        OrderTable order = orderTableService.findByOrderId(orderTable);
        mv.addObject("order", order);
        mv.addObject("title", "订单支付");
        return mv;
    }

    /**
     * @param num=3 确认收货
     * @return
     */
    @RequestMapping("/pay_response")
    @ResponseBody
    public ResultEntity<String> pay_response(OrderTable orderTable, Integer num) {
        switch (num) {
            case 1:
                orderTable.setStatus(1);//已付款，待发货
                break;
            case 2:
                orderTable.setStatus(2);//已发货，待收货
                break;

            case 3:
                orderTable.setStatus(3);//已收货，待评价
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
        mv.addObject("title", "订单列表");
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
        mv.addObject("title","订单详情");

        List<OrderTableVo> orderVos = orderTableService.findManyByOrderId(orderTable);
        mv.addObject("orderVos", orderVos);
        if (num != null) {
            mv = new ModelAndView("comment_order");
            orderTable.setStatus(3);
            ResultEntity<String> result = orderTableService.modifyOrderStatus(orderTable);
            if (result.getCode() == 0) {
                orderVos = orderTableService.findManyByOrderId(orderTable);
            }
            mv.addObject("title","订单评论");

            mv.addObject("orderVos", orderVos);
            return mv;
        }

        return mv;
    }

    @RequestMapping("/delete_order")
    @ResponseBody/*ResponseBody要加上，不然一直404，但是数据还是删除了*/
    public ResultEntity<String> delete_order(OrderTable orderTable) {
        ResultEntity<String> result = new ResultEntity<>();
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setOrder_id(orderTable.getOrder_id());
        //在删除前查询是否有这个对象，不然一直提示删除成功
        OrderTable byOrderId = orderTableService.findByOrderId(orderTable);
        if (byOrderId != null) {
            try {
                orderDetailService.deleteByOrderId(orderDetail);
                orderTableService.removeOrderByOrderId(orderTable);
                result.setCodeAndMsg(ResultEnum.DELETE_SUCCESS_MESS);
            } catch (Exception e) {
                e.printStackTrace();
                result.setCodeAndMsg(ResultEnum.DELETE_FAILED_MESS);
            }
        } else {
            result.setCodeAndMsg(ResultEnum.DATA_NOT_EXISTS);
        }

        return result;
    }


    @RequestMapping("/order_drawback")
    public ModelAndView order_drawback(OrderTable orderTable, HttpSession session) {
        ModelAndView mv = new ModelAndView("order_drawback");
        List<OrderTableVo> orderVos = orderTableService.findManyByOrderId(orderTable);
        mv.addObject("orderVos", orderVos);
        mv.addObject("title", "申请退款");
        //随机生成一个token
        String token = UUID.randomUUID().toString();
        mv.addObject("token", token);
        //把这个token存入session
        session.setAttribute("order_token", token);
        return mv;
    }
//    就是给表单一个唯一标志，然后提交了过后把这唯一标志给改了，就不匹配了，不一定要用token，凡是能表示唯一的就可以

    /**
     * 退款处理，
     * 1.设置订单状态-2，
     * 2.添加退款信息,退款表里处理状态为
     * -1，未处理；1，正在处理；2，处理成功....
     *
     * @param orderTable
     * @return
     */
    @RequestMapping("/order_drawback_commit")
    @ResponseBody
    public ResultEntity<String> order_drawback_commit(OrderTable orderTable, OrderDrawback orderDrawback, @RequestParam(defaultValue = "") String drawback_token, HttpSession session) {
        ResultEntity<String> result = new ResultEntity<>();
        orderTable.setStatus(-2);
        //获取session中的token
        String token = (String) session.getAttribute("order_token");
        //判断页面传入的token和session中的是否一致，如果不一致返回错误
        if (drawback_token.equals("") || !drawback_token.equals(token)) {
            result.setCodeAndMsg(ResultEnum.DATA_IS_REPETITION);
            return result;
        }
        ResultEntity<String> modifyOrderStatus = orderTableService.modifyOrderStatus(orderTable);
        if (modifyOrderStatus.getCode() == 0) {
            try {
                orderDrawback.setState(-1);
                orderDrawbackService.insertSelective(orderDrawback);
                //成功后移除session
                session.removeAttribute("order_token");
                result.setCodeAndMsg(ResultEnum.INSERT_SUCCESS_MESS);
            } catch (Exception e) {
                e.printStackTrace();
                result.setCodeAndMsg(ResultEnum.INSERT_FAILED_MESS);
            }
        }
        return result;
    }

    @RequestMapping("/order_received_success")
    public ModelAndView order_received_success() {
        ModelAndView mv = new ModelAndView("order_received_success");
        mv.addObject("title", "收货确认成功");
        return mv;
    }

    @RequestMapping("/order_drawback_success")
    public ModelAndView order_drawback_success() {
        ModelAndView mv = new ModelAndView("order_drawback_success");
        mv.addObject("title", "退单申请成功");
        return mv;
    }

    @RequestMapping("/order_drawback_info")
    public ModelAndView order_drawback_info(OrderDrawback orderDrawback) {
        ModelAndView mv = new ModelAndView("order_drawback_info");
        mv.addObject("title", "退单详情");
        OrderTable orderTable = new OrderTable();
        orderTable.setOrder_id(orderDrawback.getOrder_id());
        List<OrderTableVo> orderVos = orderTableService.findManyByOrderId(orderTable);
        OrderDrawback drawback = orderDrawbackService.findByOrderId(orderDrawback);
        mv.addObject("drawback", drawback);
        mv.addObject("orderVos", orderVos);
        return mv;
    }


    @RequestMapping("/comment_goods")
    public ModelAndView comment_goods(Goods goods, HttpSession session, OrderTable orderTable) {
        ModelAndView mv = new ModelAndView("comment_goods");
        goods = goodsService.findByGoods(goods);
        String comment_token = UUID.randomUUID().toString();
        session.setAttribute("comment_token", comment_token);
        mv.addObject("c_token", comment_token);
        mv.addObject("goods", goods);
        mv.addObject("orderTable", orderTable);
        mv.addObject("title", "商品评价");
        return mv;
    }

   /* @RequestMapping("/submit_comment")
    @ResponseBody
    public ResultEntity<String> submit_comment(Comment comment, HttpSession session, OrderTable orderTable, String comment_token) {
        System.out.println("comment_token--------------------" + comment_token);
        ResultEntity<String> result = new ResultEntity<>();
        String sessionToken = (String) session.getAttribute("comment_token");
        if (comment_token.equals("") || !comment_token.equals(sessionToken)) {
            result.setCodeAndMsg(ResultEnum.DATA_IS_REPETITION);
            return result;
        }
        if (sessionToken.equals(comment_token)) {
            try {
                //成功后移除session
                orderTable.setStatus(4);
                orderTableService.modifyOrderStatus(orderTable);
                session.removeAttribute("comment_token");
                result.setCodeAndMsg(ResultEnum.INSERT_SUCCESS_MESS);
            } catch (Exception e) {
                e.printStackTrace();
                result.setCodeAndMsg(ResultEnum.INSERT_FAILED_MESS);
            }
        }

        return result;
    }*/
}
