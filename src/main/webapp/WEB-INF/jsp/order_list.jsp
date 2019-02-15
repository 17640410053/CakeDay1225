<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/25
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<jsp:include page="header.jsp"/>
<style href=""></style>
<div class="content content-nav-base shopcart-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="<c:url value="/commodity"/>" class="active">所有商品</a>
                    <a href="javascript:;">今日团购</a>
                    <a href="javascript:;">Cake资讯</a>
                    <a href="javascript:;">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-bg w1200">
        <h3>精选品质</h3>
        <p>蛋糕、糖果、点心9折起</p>
    </div>



    <div class="cart w1200">

        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">全部订单</li>
                <li>待付款</li>
                <%--0--%>
                <li>待发货</li>
                <%--1--%>
                <li>待收货</li>
                <%--2--%>
                <li>待评价</li>
                <%--3--%>
                <%--
                 todo
                 1.删除订单
                 2.申请退款
                 3.确认收货
                 4.添加追评
                 --%>

            </ul>
            <div class="layui-tab-content" style="border: 1px solid #e6e6e6;border-top: none">

                <div class="layui-tab-item layui-show">
                    <c:choose>
                        <c:when test="${empty orderList}">
                            <div style="text-align: center"><i class="layui-icon layui-icon-list"
                                                               style="font-size: 120px; color: #FF5722;"></i>
                                <h2>您还没有相关的订单</h2>
                                <p style="font-size: smaller"><a href="<c:url value="/index"/>">可以去看看有哪些想买的</a></p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="layui-table" lay-skin="line">
                                <colgroup>
                                    <col width="80">
                                    <col width="270">
                                    <col width="130">
                                    <col width="140">
                                    <col width="160">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>订单号</th>
                                    <th>总金额</th>
                                    <th>订单时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${orderList}" var="order" varStatus="i">
                                    <tr class="order-list-${order.order_id}">
                                        <td><span>${i.count}</span></td>
                                        <td>
                                            <a href="<c:url value="/order/order_info?order_id=${order.order_id}"/>"><span
                                                    disabled="disabled">${order.order_id}</span></a></td>
                                        <td><span class="th-su">￥${order.money}.00</span></td>
                                        <td><span type="" disabled="disabled">${order.time}</span></td>
                                        <td>
                                            <c:if test="${order.status==-2}">
                                                <span class="sum">正在处理退款</span>
                                            </c:if>
                                            <c:if test="${order.status==-1}">
                                                <span class="sum">未支付</span>
                                            </c:if>
                                            <c:if test="${order.status==1}">
                                                <span class="sum">已支付，待发货</span>
                                            </c:if>
                                            <c:if test="${order.status==2}">
                                                <span class="sum">已发货</span>
                                            </c:if>
                                            <c:if test="${order.status==3}">
                                                <span class="sum">已收货</span>
                                            </c:if>
                                            <c:if test="${order.status==4}">
                                                <span class="sum">已评价</span>
                                            </c:if>
                                            <c:if test="${order.status==5}">
                                                <span class="sum">已评价</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a type="button" class="layui-btn layui-btn-primary"
                                               href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">订单详情</a>
                                            <c:choose>
                                                <c:when test="${order.status == -2}">

                                                    <a type="button" class="layui-btn"
                                                       href="<c:url value="/order/order_drawback_info?order_id=${order.order_id}"/>">退单详情</a><%--确认收货，状态改为已收货--%>
                                                </c:when>
                                                <c:when test="${order.status == -1}">

                                                    <a type="button" class="layui-btn layui-btn-warm"
                                                       href="<c:url value="/order/pay_order?order_id=${order.order_id}"/>">前去支付</a>
                                                    <%--<a type="button" class="layui-btn layui-btn-danger"--%>

                                                    <%--href="<c:url value="/order/delete_order?order_id=${order.order_id}"/>">删除订单</a>--%>

                                                    <%--<a type="button" class="layui-btn layui-btn-danger"
                                                       onclick="deleteOrder(${order.order_id}) ">删除订单</a>--%>

                                                    <a onclick="deleteOrder('${order.order_id}')"
                                                       class="dele-btn layui-btn layui-btn-danger">删除订单</a>
                                                    <%--你的id是int可以不加""，但是是string类型的必须要--%>

                                                    <%--<a onclick="deleteOrder('${order.order_id}')"><span--%>
                                                    <%--class="dele-btn">删除订单</span></a>--%>
                                                </c:when>
                                                <c:when test="${order.status == 1}">

                                                    <a type="button" class="layui-btn layui-btn-normal"
                                                       href="<c:url value="/order/order_drawback?order_id=${order.order_id}"/>">申请退款</a><%--确认收货，状态改为已收货--%>
                                                </c:when>
                                                <c:when test="${order.status == 2}">

                                                    <a type="button" class="layui-btn"
                                                       href="<c:url value="/order/pay_response?order_id=${order.order_id}&num=3"/>">确认收货</a><%--确认收货，状态改为已收货--%>
                                                </c:when>
                                                <c:when test="${order.status == 3}">

                                                    <a type="button" class="layui-btn layui-btn-primary"
                                                       href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">前去评价</a>
                                                    <a type="button" class="layui-btn layui-btn-danger"

                                                       href="<c:url value="/order/delete_order?order_id=${order.order_id}"/>">删除订单</a>
                                                </c:when>
                                                <c:when test="${order.status == 4}">

                                                    <a type="button" class="layui-btn"
                                                       href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">添加追评</a>
                                                    <a type="button" class="layui-btn layui-btn-danger"
                                                       href="<c:url value="/order/delete_order?order_id=${order.order_id}"/>">删除订单</a>
                                                </c:when>

                                            </c:choose>

                                        </td>
                                    </tr>

                                </c:forEach>

                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>


                </div>
                <div class="layui-tab-item">
                    <c:if test="${empty waitPayOrderList}">
                        <div style="text-align: center"><i class="layui-icon layui-icon-list"
                                                           style="font-size: 120px; color: #FF5722;"></i>
                            <h2>您还没有相关的订单</h2>
                            <p style="font-size: smaller"><a href="<c:url value="/index"/>">可以去看看有哪些想买的</a></p>
                        </div>
                    </c:if>
                    <c:if test="${!empty waitPayOrderList}">
                        <table class="layui-table" lay-skin="line">
                            <colgroup>
                                <col width="80">
                                <col width="270">
                                <col width="130">
                                <col width="140">
                                <col width="160">
                                <col>
                            </colgroup>
                            <thead>
                            <tr style="text-align: center">
                                <th>序号</th>
                                <th>订单号</th>
                                <th>总金额</th>
                                <th>订单时间</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${waitPayOrderList}" var="order" varStatus="i">
                                <tr>
                                    <td><span>${i.count}</span></td>
                                    <td><a href="<c:url value="/order/order_info?order_id=${order.order_id}"/>"><span
                                            disabled="disabled">${order.order_id}</span></a></td>
                                    <td><span class="th-su">￥${order.money}.00</span></td>
                                    <td><span type="" disabled="disabled">${order.time}</span></td>
                                    <td><c:if test="${order.status==-1}">
                                        <span class="sum">待付款</span>
                                    </c:if>
                                        <c:if test="${order.status==1}">
                                            <span class="sum">已支付，待发货</span>
                                        </c:if>
                                        <c:if test="${order.status==2}">
                                            <span class="sum">已发货,待收货</span>
                                        </c:if>
                                        <c:if test="${order.status==3}">
                                            <span class="sum">已收货，待评价</span>
                                        </c:if>
                                        <c:if test="${order.status==4}">
                                            <span class="sum">已评价</span>
                                        </c:if>
                                    </td>
                                    <td>
                                        <a type="button" class="layui-btn layui-btn-primary"

                                           href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">订单详情</a>
                                        <c:choose>
                                            <c:when test="${order.status ==-1}">

                                                <a type="button" class="layui-btn layui-btn-warm"
                                                   href="<c:url value="/order/pay_order?order_id=${order.order_id}"/>">前去支付</a>
                                                <a type="button" class="layui-btn layui-btn-danger"

                                                   href="<c:url value="/order/delete_order?order_id=${order.order_id}"/>">删除订单</a>

                                            </c:when>
                                            <c:when test="${order.status == 1}">

                                                <a type="button" class="layui-btn layui-btn-normal"
                                                   href="<c:url value="/order/pay_response?order_id=${order.order_id}&num=3"/>">申请退款</a><%--确认收货，状态改为已收货--%>
                                            </c:when>
                                            <c:when test="${order.status == 2}">

                                                <a type="button" class="layui-btn"
                                                   href="<c:url value="/order/pay_response?order_id=${order.order_id}&num=3"/>">确认收货</a><%--确认收货，状态改为已收货--%>
                                            </c:when>
                                            <c:when test="${order.status == 3}">

                                                <a type="button" class="layui-btn layui-btn-primary"
                                                   href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">前去评价</a>
                                                <a type="button" class="layui-btn layui-btn-danger"

                                                   href="<c:url value="/order/delete_order?order_id=${order.order_id}"/>">删除订单</a>
                                            </c:when>
                                            <c:when test="${order.status == 4}">

                                                <a type="button" class="layui-btn"
                                                   href="<c:url value="/order/pay_response?order_id=${order.order_id}&num=2"/>">添加追评</a>
                                                <a type="button" class="layui-btn layui-btn-danger"

                                                   href="<c:url value="/order/delete_order?order_id=${order.order_id}"/>">删除订单</a>
                                            </c:when>

                                        </c:choose>

                                    </td>
                                </tr>

                            </c:forEach>

                            </tbody>
                        </table>
                    </c:if>
                </div>
                <div class="layui-tab-item">
                    <c:choose>
                        <c:when test="${empty waitSendOrderList}">
                            <div style="text-align: center"><i class="layui-icon layui-icon-list"
                                                               style="font-size: 120px; color: #FF5722;"></i>
                                <h2>您还没有相关的订单</h2>
                                <p style="font-size: smaller"><a href="<c:url value="/index"/>">可以去看看有哪些想买的</a></p>
                            </div>
                        </c:when>
                        <c:otherwise>

                            <table class="layui-table" lay-skin="line">
                                <colgroup>
                                    <col width="80">
                                    <col width="270">
                                    <col width="130">
                                    <col width="140">
                                    <col width="160">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>订单号</th>
                                    <th>总金额</th>
                                    <th>订单时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${waitSendOrderList}" var="order" varStatus="i">
                                    <tr>
                                        <td><span>${i.count}</span></td>
                                        <td>
                                            <a href="<c:url value="/order/order_info?order_id=${order.order_id}"/>"><span
                                                    disabled="disabled">${order.order_id}</span></a></td>
                                        <td><span class="th-su">￥${order.money}.00</span></td>
                                        <td><span type="" disabled="disabled">${order.time}</span></td>
                                        <td><c:if test="${order.status==-1}">
                                            <span class="sum">待付款</span>
                                        </c:if>
                                            <c:if test="${order.status==1}">
                                                <span class="sum">已支付，待发货</span>
                                            </c:if>
                                            <c:if test="${order.status==2}">
                                                <span class="sum">已发货,待收货</span>
                                            </c:if>
                                            <c:if test="${order.status==3}">
                                                <span class="sum">已收货，待评价</span>
                                            </c:if>
                                            <c:if test="${order.status==4}">
                                                <span class="sum">已评价</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a type="button" class="layui-btn layui-btn-primary"

                                               href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">订单详情</a>
                                            <c:choose>
                                                <c:when test="${order.status == -1}">

                                                    <a type="button" class="layui-btn layui-btn-warm"
                                                       href="<c:url value="/order/pay_order?order_id=${order.order_id}"/>">前去支付</a>
                                                    <a onclick="deleteOrder('${order.order_id}')"
                                                       class="dele-btn layui-btn layui-btn-danger">删除订单</a>
                                                    <%--你的id是int可以不加""，但是是string类型的必须要--%>

                                                </c:when>
                                                <c:when test="${order.status == 1}">

                                                    <a type="button" class="layui-btn layui-btn-normal"
                                                       href="<c:url value="/order/order_drawback?order_id=${order.order_id}"/>">申请退款</a><%--确认收货，状态改为已收货--%>
                                                </c:when>
                                                <c:when test="${order.status == 2}">

                                                    <a type="button" class="layui-btn"
                                                       onclick="receiveConfirm('${order.order_id}')">确认收货</a><%--确认收货，状态改为已收货--%>
                                                </c:when>
                                                <c:when test="${order.status == 3}">

                                                    <a type="button" class="layui-btn layui-btn-primary"
                                                       href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">前去评价</a>
                                                    <a onclick="deleteOrder('${order.order_id}')"
                                                       class="dele-btn layui-btn layui-btn-danger">删除订单</a>
                                                    <%--你的id是int可以不加""，但是是string类型的必须要--%>
                                                </c:when>
                                                <c:when test="${order.status == 4}">

                                                    <a type="button" class="layui-btn"
                                                       href="<c:url value="/order/order_info?order_id=${order.order_id}&num=2"/>">添加追评</a>
                                                    <a onclick="deleteOrder('${order.order_id}')"
                                                       class="dele-btn layui-btn layui-btn-danger">删除订单</a>
                                                    <%--你的id是int可以不加""，但是是string类型的必须要--%>
                                                </c:when>

                                            </c:choose>

                                        </td>
                                    </tr>

                                </c:forEach>

                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>

                </div>
                <div class="layui-tab-item">
                    <c:choose>
                        <c:when test="${empty waitReceiveOrderList}">
                            <div style="text-align: center"><i class="layui-icon layui-icon-list"
                                                               style="font-size: 120px; color: #FF5722;"></i>
                                <h2>您还没有相关的订单</h2>
                                <p style="font-size: smaller"><a href="<c:url value="/index"/>">可以去看看有哪些想买的</a></p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="layui-table" lay-skin="line">
                                <colgroup>
                                    <col width="80">
                                    <col width="270">
                                    <col width="130">
                                    <col width="140">
                                    <col width="160">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>订单号</th>
                                    <th>总金额</th>
                                    <th>订单时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${waitReceiveOrderList}" var="order" varStatus="i">
                                    <tr>
                                        <td><span>${i.count}</span></td>
                                        <td>
                                            <a href="<c:url value="/order/order_info?order_id=${order.order_id}"/>"><span
                                                    disabled="disabled">${order.order_id}</span></a></td>
                                        <td><span class="th-su">￥${order.money}.00</span></td>
                                        <td><span type="" disabled="disabled">${order.time}</span></td>
                                        <td><c:if test="${order.status==-1}">
                                            <span class="sum">待付款</span>
                                        </c:if>
                                            <c:if test="${order.status==1}">
                                                <span class="sum">已支付，待发货</span>
                                            </c:if>
                                            <c:if test="${order.status==2}">
                                                <span class="sum">已发货,待收货</span>
                                            </c:if>
                                            <c:if test="${order.status==3}">
                                                <span class="sum">已收货，待评价</span>
                                            </c:if>
                                            <c:if test="${order.status==4}">
                                                <span class="sum">已评价</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a type="button" class="layui-btn layui-btn-primary"

                                               href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">订单详情</a>
                                            <c:choose>
                                                <c:when test="${order.status == -1}">

                                                    <a type="button" class="layui-btn layui-btn-warm"
                                                       href="<c:url value="/order/pay_order?order_id=${order.order_id}"/>">前去支付</a>
                                                    <a onclick="deleteOrder('${order.order_id}')"
                                                       class="dele-btn layui-btn layui-btn-danger">删除订单</a>
                                                    <%--你的id是int可以不加""，但是是string类型的必须要--%>

                                                </c:when>
                                                <c:when test="${order.status == 1}">

                                                    <a type="button" class="layui-btn layui-btn-normal"
                                                       href="<c:url value="/order/pay_response?order_id=${order.order_id}&num=3"/>">申请退款</a>
                                                </c:when>
                                                <c:when test="${order.status == 2}">
                                                    <a type="button" class="layui-btn"
                                                       onclick="receiveConfirm('${order.order_id}')">确认收货</a>
                                                    <a type="button" class="layui-btn"
                                                       href="<c:url value="/order/pay_response?order_id=${order.order_id}&num=3"/>">确认收货</a>
                                                </c:when>
                                                <c:when test="${order.status == 3}">

                                                    <a type="button" class="layui-btn layui-btn-primary"
                                                       href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">前去评价</a>
                                                    <a onclick="deleteOrder('${order.order_id}')"
                                                       class="dele-btn layui-btn layui-btn-danger">删除订单</a>
                                                    <%--你的id是int可以不加""，但是是string类型的必须要--%>
                                                </c:when>
                                                <c:when test="${order.status == 4}">

                                                    <a type="button" class="layui-btn"
                                                       href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">添加追评</a>
                                                    <a onclick="deleteOrder('${order.order_id}')"
                                                       class="dele-btn layui-btn layui-btn-danger">删除订单</a>
                                                    <%--你的id是int可以不加""，但是是string类型的必须要--%>
                                                </c:when>

                                            </c:choose>

                                        </td>
                                    </tr>

                                </c:forEach>

                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>

                </div>
                <div class="layui-tab-item">
                    <c:choose>
                        <c:when test="${empty waitEstimateOrderList}">
                            <div style="text-align: center"><i class="layui-icon layui-icon-list"
                                                               style="font-size: 120px; color: #FF5722;"></i>
                                <h2>您还没有相关的订单</h2>
                                <p style="font-size: smaller"><a href="<c:url value="/index"/>">可以去看看有哪些想买的</a></p>
                            </div>
                        </c:when>
                        <c:otherwise>

                            <table class="layui-table" lay-skin="line" >
                                <colgroup>
                                    <col width="80">
                                    <col width="270">
                                    <col width="130">
                                    <col width="140">
                                    <col width="160">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>订单号</th>
                                    <th>总金额</th>
                                    <th>订单时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${waitEstimateOrderList}" var="order" varStatus="i">
                                    <tr>
                                        <td><span>${i.count}</span></td>
                                        <td>
                                            <a href="<c:url value="/order/order_info?order_id=${order.order_id}"/>"><span
                                                    disabled="disabled">${order.order_id}</span></a></td>
                                        <td><span class="th-su">￥${order.money}.00</span></td>
                                        <td><span type="" disabled="disabled">${order.time}</span></td>
                                        <td><c:if test="${order.status==-1}">
                                            <span class="sum">待付款</span>
                                        </c:if>
                                            <c:if test="${order.status==1}">
                                                <span class="sum">已支付，待发货</span>
                                            </c:if>
                                            <c:if test="${order.status==2}">
                                                <span class="sum">已发货,待收货</span>
                                            </c:if>
                                            <c:if test="${order.status==3}">
                                                <span class="sum">已收货，待评价</span>
                                            </c:if>
                                            <c:if test="${order.status==4}">
                                                <span class="sum">已评价</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a type="button" class="layui-btn layui-btn-primary"

                                               href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">订单详情</a>
                                            <c:choose>
                                                <c:when test="${order.status == -1}">

                                                    <a type="button" class="layui-btn layui-btn-warm"
                                                       href="<c:url value="/order/pay_order?order_id=${order.order_id}"/>">前去支付</a>
                                                    <a type="button" class="layui-btn layui-btn-danger"
                                                       onclick="deleteOrder('${order.order_id}') "

                                                       href="<c:url value="/order/delete_order?order_id=${order.order_id}"/>">删除订单</a>

                                                    <a type="button" class="layui-btn layui-btn-danger"
                                                       onclick="deleteOrder('${order.order_id}') ">删除订单</a>

                                                </c:when>
                                                <c:when test="${order.status == 1}">

                                                    <a type="button" class="layui-btn layui-btn-normal"
                                                       href="<c:url value="/order/pay_response?order_id=${order.order_id}&num=3"/>">申请退款</a><%--确认收货，状态改为已收货--%>
                                                </c:when>
                                                <c:when test="${order.status == 2}">
                                                    <a type="button" class="layui-btn"
                                                       onclick="receiveConfirm('${order.order_id}')">确认收货</a>
                                                    <a type="button" class="layui-btn"
                                                       href="<c:url value="/order/pay_response?order_id=${order.order_id}&num=3"/>">确认收货</a><%--确认收货，状态改为已收货--%>
                                                </c:when>
                                                <c:when test="${order.status == 3}">

                                                    <a type="button" class="layui-btn layui-btn-primary"
                                                       href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">前去评价</a>
                                                    <a type="button" class="layui-btn layui-btn-danger"

                                                       href="<c:url value="/order/delete_order?order_id=${order.order_id}"/>">删除订单</a>
                                                </c:when>
                                                <c:when test="${order.status == 4}">

                                                    <a type="button" class="layui-btn"
                                                       href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">添加追评</a>
                                                    <a type="button" class="layui-btn layui-btn-danger"

                                                       href="<c:url value="/order/delete_order?order_id=${order.order_id}"/>">删除订单</a>
                                                </c:when>

                                            </c:choose>

                                        </td>
                                    </tr>

                                </c:forEach>

                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>


            </div>
        </div>


        <div class="FloatBarHolder layui-clear">

        </div>


    </div>
</div>






<script>

    //Demo
    layui.use('form', function () {
        var form = layui.form;
        form.render();
        //监听提交
        form.on('submit(formDemo)', function (data) {
            $.post('${pageContext.request.contextPath}/addOrder', data.field, function (msg) {
                if (msg.code === 0) {
                    layer.msg(msg.msg);
                    /**
                     * 在这儿写成功登陆的话去主页
                     * */
                    location.href = "${pageContext.request.contextPath}/order/pay_order?order_id=" + msg.data;
                } else {
                    layer.msg(msg.msg);
                }
            });

            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</div>

</div>
<script type="text/javascript">
    layui.config({
        base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'jquery', 'element', 'car'], function () {
        var mm = layui.mm, $ = layui.$, element = layui.element, car = layui.car;


    })
    ;

</script>
<script src="<c:url value="/js/jquery.min.js"/>"></script>

<script>
    /*  /!**
       *
       * @param id
       * @param price 价格
       * @param goodsNum 商品数量：用于来判断是否还剩一个之后
       * @param num   用于复用的符号：1+, 2-, 3移除
       * *!/
      function addCart(id, price, goodsNum, num) {
          //那你在这里提醒就好了，这就好了，还有，那就分开写，你在哪判断的，等于2是啥，减，后面还有一个参数是用于最后一个移除返回的操作提示
          //返回json的时候500了，没有返回数据，肯定不执行啊
          //这个总价还要处理下
          switch (num) {
              case 1:
                  $.post("/addGoodsToCart", {goods_id: id, money: price, num: num}, function (data) {
                      if (num === 1 && data.code === 1010) {
                          $('.Quantity-input').val(10)
                          layer.alert(data.msg);
                      }
                  });
                  break;
              case 2:
                  $.post("/addGoodsToCart", {goods_id: id, money: price, num: num}, function (data) {
                      if (num === 2 && data.code === 101) {
                          if (data.count === 0) {
                              $('.pieces-total').html("￥0.00");
                          } else {
                              $('.pieces-total').html(data.count)
                          }
                          if (data.data === 0) {
                              $('.Selected-pieces').html("0");
                          } else {
                              $('.Selected-pieces').html(data.data);
                          }
                          $('#cart-list-' + id).remove();
                      } else {
                          layer.alert(data.msg);
                      }
                  });
                  break;
              case 3:
                  if (confirm("确认要删除吗?")) {
                      $.post("/addGoodsToCart", {goods_id: id, money: price, num: num}, function (data) {
                          if (data.code === 0) {
                              if (data.count === 0) {
                                  $('.pieces-total').html("￥0.00");

                              } else {
                                  $('.pieces-total').html(data.count)
                              }
                              if (data.data === 0) {
                                  $('.Selected-pieces').html("0");
                              } else {
                                  $('.Selected-pieces').html(data.data);
                              }
                              $('#cart-list-' + id).remove();
                          } else {
                              layer.alert(data.msg);
                          }
                      });
                  }


                  /!*  layer.confirm('你确定要删除吗', {
                        yes: function (index, layero) {
                            layer.close(index);
                            $.post("/addGoodsToCart", {goods_id: id, money: price, num: num}, function (data) {
                                layer.alert(data.msg);
                                $('#cart-list-' + id).remove();
                            })
                        }
                    });*!/
                  break;
          }
      }

      /!*提示信息还没出现就删了
      **!/
      /!* function deleteAllGoods() {
           $.post("/deleteAllGoods", {}, function (data) {
               layer.alert(data.msg)
           })
       }*!/
  */
    $(function () {
        // $(".dele-btn").on("click",function () {
        //     alert("123")
        // })
    });

    function deleteOrder(id) {
        $.post("/order/delete_order", {order_id: id}, function (data) {
            // layer.msg(data.msg);
            // alert(data.msg);
            layer.msg(data.msg);
            if (data.code === 0) {
                $(".order-list-" + id).remove();
            }
        })
        // alert("123")
    }

    function receiveConfirm(id) {
        $.post("/order/pay_response", {order_id: id, num: 3}, function (data) {
            if (data.code === 0) {
                location.href = "/order/order_received_success";
            } else {
                layer.msg(data.msg);
            }
        })
        // alert("123")
    }


</script>
--%>

<jsp:include page="footer.jsp"/>
