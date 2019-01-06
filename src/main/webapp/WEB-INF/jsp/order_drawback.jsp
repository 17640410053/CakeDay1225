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
                    <a href="commodity.html" class="active">所有商品</a>
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
                <label class="layui-form-label">订单号</label>
                <div class="layui-input-block">
                    <input type="text" name="order_id" required lay-verify="required"
                           value="${orderVos.get(0).order_id}"
                           autocomplete="off" class="layui-input" readonly="readonly">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">订单详情</label>
                <div class="layui-input-block">
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
                                总价
                            </div>
                        </div>

                    </div>
                    <div class="OrderList">
                        <div class="order-content" id="list-cont">
                            <c:forEach items="${orderVos}" var="order">
                                <c:forEach items="${order.orderDetailList}" var="orderDetail" varStatus="i">
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
                                                <a href="javascript:;">
                                                    <img src="<c:url value="/cakeImg/${orderDetail.goods.img}"/>"
                                                         alt=""></a>
                                                <div class="text">
                                                    <div class="title">${orderDetail.goods.name}</div>
                                                </div>
                                            </div>

                                        </li>
                                        <li class="th th-price">
                                            <span class="th-su">${orderDetail.goods.price}.00</span>
                                        </li>
                                        <li class="th th-amount">
                                            <span type="" disabled="disabled">${orderDetail.num}</span>
                                        </li>
                                        <li class="th th-sum">
                                            <span class="sum">${orderDetail.money}.00</span>
                                        </li>

                                    </ul>
                                </c:forEach>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="FloatBarHolder layui-clear"></div>
                </div>
            </div>


            <div class="layui-form-item" style="margin-top: 15px">
                <label class="layui-form-label">收货地址</label>
                <div class="layui-input-block">
                    <input type="text" name="title" required lay-verify="required"
                           value="${orderVos.get(0).addressName.replace(","," - ")}" autocomplete="off"
                           class="layui-input" readonly>
                    <input type="hidden" name="user_id" required lay-verify="required"
                           value="${orderVos.get(0).user_id}" autocomplete="off"
                           class="layui-input" readonly>

                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系号码</label>
                <div class="layui-input-block">
                    <input type="text" name="phone" required lay-verify="required"
                           value="${orderVos.get(0).phone}" autocomplete="off"
                           class="layui-input" readonly>

                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">下单时间</label>
                <div class="layui-input-block">
                    <input type="text" name="title" required lay-verify="required"
                           value="${orderVos.get(0).time}" autocomplete="off"
                           class="layui-input" readonly>

                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">退款理由</label>
                <div class="layui-input-block">
                    <select name="reason" lay-verify="required">
                        <option value=""></option>
                        <%--前面的value值与后面的内容一致--%>
                        <option value="买多了">买多了</option>
                        <option value="拍错了">拍错了</option>
                        <option value="不想买了">不想买了</option>
                        <option value="先这么多">先这么多</option>
                        <option value="想到再加">想到再加</option>
                    </select>
                </div>
            </div>


            <div class="layui-form-item">
                <div class="layui-input-block">
                    <c:if test="${orderVos.get(0).status != -2}">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    </c:if>
                    <c:if test="${orderVos.get(0).status == -2}">
                        <a class="layui-btn"
                           href="<c:url value="/order/order_drawback_info?order_id=${orderVos.get(0).order_id}"/>">退货中，点击查看详情</a> <%----%>
                    </c:if>
                    <a href="<c:url value="/order/order_list"/>">
                        <button type="button" class="layui-btn layui-btn-primary">返回</button>
                    </a>

                </div>
            </div>
        </form>


        <script>

            //Demo
            layui.use('form', function () {
                var form = layui.form;
                form.render();
                //监听提交
                //监听提交
                form.on('submit(formDemo)', function (data) {
                    data.field['drawback_token'] = '${sessionScope.order_token}';
                    $.post('/order/order_drawback_commit', data.field, function (data) {
                        if (data.code === 0) {
                            location.href = "/order/order_drawback_success";
                        } else {
                            layer.msg(data.msg);
                        }
                    });
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
