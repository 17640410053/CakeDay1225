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
                    <a href="buytoday.html">今日团购</a>
                    <a href="information.html">母婴资讯</a>
                    <a href="about.html">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-bg w1200">
        <h3>精选品质</h3>
        <p>蛋糕、糖果、点心9折起</p>
    </div>



    <div class="cart w1200">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label" style="margin-left: -20px;font-size: larger">收货地址</label>
                <div class="layui-input-block" style="width: 700px">
                    <select name="address_id" id="address" lay-verify="required">
                        <option value="${defaultAddress.address_id}">${defaultAddress.name.replace(","," - ")}&nbsp;&nbsp;${defaultAddress.phone}</option>
                        <c:forEach items="${addressList}" var="a" varStatus="ai">
                            <option value="${a.address_id}">${a.name.replace(","," - ")}&nbsp;&nbsp;${a.phone}</option>
                        </c:forEach>
                    </select>
                    <a href=""><span style="margin-right: -100px;margin-top: -30px;float: right">添加收货地址</span></a>
                </div>

            </div>


            <div class="cart-table-th">
                <div class="th th-chk">

                    <div class="th-inner">
                        序号
                    </div>
                </div>
                <div class="th th-item">
                    <div class="th-inner">
                        商品
                    </div>
                </div>
                <div class="th th-price">
                    <div class="th-inner">
                        单价
                    </div>
                </div>
                <div class="th th-amount">
                    <div class="th-inner">
                        数量
                    </div>
                </div>
                <div class="th th-sum">
                    <div class="th-inner">
                        小计
                    </div>
                </div>
                <div class="th th-op">
                    <div class="th-inner">
                        操作
                    </div>
                </div>
            </div>
            <div class="OrderList">
                <div class="order-content" id="list-cont">
                    <c:forEach items="${cartOrder}" var="order" varStatus="i">
                        <c:forEach items="${order.goodsList}" var="orderDetail">
                            <ul class="item-content layui-clear" id="cart-list-${orderDetail.goods_id}">
                                <li class="th th-chk">
                                    <div class="select-all">
                                        <div class="cart-checkbox">

                                            <span>${i.count}</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="th th-item">


                                    <div class="item-cont">
                                        <a href="javascript:;"><img src="/cakeImg/${orderDetail.img}" alt=""></a>
                                        <div class="text">
                                            <div class="title">${orderDetail.name}</div>
                                            <p><span>雪过天晴后的第一口呼吸，甜蜜清新得不落俗套。</span></p>
                                        </div>
                                    </div>

                                </li>
                                <li class="th th-price">
                                    <span class="th-su">${orderDetail.price}.00</span>
                                </li>
                                <li class="th th-amount">
                                    <span type="" disabled="disabled">${order.num}</span>
                                </li>
                                <li class="th th-sum">
                                    <span class="sum">${order.money}.00</span>
                                </li>
                                <li class="th th-op">
                                    <a onclick="addCart(${orderDetail.goods_id},${orderDetail.price},${order.num},3)">
                                        <span class="dele-btn">查看</span></a>
                                </li>
                            </ul>
                        </c:forEach>
                    </c:forEach>
                </div>
            </div>


            <!-- 模版导入数据 -->


            <div class="FloatBarHolder layui-clear">

                <%--<div class="th Settlement">--%>
                <%--<button class="layui-btn settle-accounts" onclick="goOrder()">提交定单</button>--%>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">提交定单</button>
                        <button type="button" class="layui-btn layui-btn-primary">返回</button>
                    </div>
                </div>

                <div class="th total">
                    <p>应付：<span class="pieces-total">￥${countMoney}.00</span></p>
                </div>

            </div>
        </form>

        <script>

            //Demo
            layui.use('form', function () {
                var form = layui.form;
                form.render();
                //监听提交
                form.on('submit(formDemo)', function (data) {
                    $.post('/addOrder', data.field, function (msg) {
                        if (msg.code === 0) {
                            layer.msg(msg.msg);
                            /**
                             * 在这儿写成功登陆的话去主页
                             * */
                            location.href = "/order/pay_order?order_id=" + msg.data;
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


<jsp:include page="footer.jsp"/>
