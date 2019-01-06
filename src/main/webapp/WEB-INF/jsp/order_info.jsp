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
                <label class="layui-form-label" style="margin-left: -20px;font-size: larger">收货地址</label>
                <div class="layui-input-block" style="width: 800px">
                    <input type="text" name="title" required lay-verify="required"
                           value="${orderVos.get(0).addressName.replace(","," - ")}" autocomplete="off"
                           class="layui-input" readonly>
                    <%--<a href=""><span style="margin-right: -100px;margin-top: -30px;float: right">添加收货地址</span></a>--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="margin-left: -20px;font-size: larger">联系号码</label>
                <div class="layui-input-block" style="width: 800px">
                    <input type="text" name="title" required lay-verify="required"
                           value="${orderVos.get(0).phone}" autocomplete="off"
                           class="layui-input" readonly>
                    <%--<a href=""><span style="margin-right: -100px;margin-top: -30px;float: right">添加收货地址</span></a>--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="margin-left: -20px;font-size: larger">下单时间</label>
                <div class="layui-input-block" style="width: 800px">
                    <input type="text" name="title" required lay-verify="required"
                           value="${orderVos.get(0).time}" autocomplete="off"
                           class="layui-input" readonly>
                    <%--<a href=""><span style="margin-right: -100px;margin-top: -30px;float: right">添加收货地址</span></a>--%>
                </div>
            </div>

        </form>


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
            <div class="th th-op">
                <div class="th-inner">
                    操作
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
                                        <img src="<c:url value="/cakeImg/${orderDetail.goods.img}"/>" alt=""></a>
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
                            <li class="th th-op">
                                <c:choose>
                                    <c:when test="${order.status >=2}">
                                        <a href="<c:url value="/order/comment_goods?goods_id=${orderDetail.goods.goods_id}"/>">
                                            <span>去评价</span></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="<c:url value="/details?goods_id=${orderDetail.goods.goods_id}"/>">
                                            <span>查看</span></a>
                                    </c:otherwise>
                                </c:choose>


                            </li>
                        </ul>
                    </c:forEach>
                </c:forEach>
            </div>
        </div>


        <div class="FloatBarHolder layui-clear">


            <div class="layui-form-item">
                <div class="layui-input-block">
                    <%--<button class="layui-btn" lay-submit lay-filter="formDemo">提交定单</button>--%>
                    <a href="<c:url value="/order/order_list"/>">
                        <button type="button" class="layui-btn layui-btn-primary">返回</button>
                    </a>
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
<%--<script>
    /**
     *
     * @param id
     * @param price 价格
     * @param goodsNum 商品数量：用于来判断是否还剩一个之后
     * @param num   用于复用的符号：1+, 2-, 3移除
     * */
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


                /*  layer.confirm('你确定要删除吗', {
                      yes: function (index, layero) {
                          layer.close(index);
                          $.post("/addGoodsToCart", {goods_id: id, money: price, num: num}, function (data) {
                              layer.alert(data.msg);
                              $('#cart-list-' + id).remove();
                          })
                      }
                  });*/
                break;
        }
    }

    /*提示信息还没出现就删了
    **/
    /* function deleteAllGoods() {
         $.post("/deleteAllGoods", {}, function (data) {
             layer.alert(data.msg)
         })
     }*/

    function goOrder() {

    }

</script>--%>

<jsp:include page="footer.jsp"/>
