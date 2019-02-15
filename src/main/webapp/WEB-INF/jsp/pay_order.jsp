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
        <%--<h3>CakeDay1225</h3>--%>
        <h3>精选品质</h3>
        <p>蛋糕、糖果、点心9折起</p>
    </div>
    <div class="cart w1200">
        <h1>订单号：<span id="order_id">${order.order_id}</span></h1>


        <%--        <div class="cart-table-th">
                    <div class="th th-chk">
                   &lt;%&ndash;     <div class="select-all">
                            <div class="cart-checkbox">
                                <input class="check-all check" id="allCheckked" type="checkbox" value="true">
                            </div>
                            <label>&nbsp;&nbsp;全选</label>
                        </div>&ndash;%&gt;
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
                </div>--%>
        <%--  <div class="OrderList">
              <div class="order-content" id="list-cont">
                  <c:forEach items="${cartOrder}" var="cart" varStatus="i">
                      <c:forEach items="${cart.goodsList}" var="goods">
                          <ul class="item-content layui-clear" id="cart-list-${goods.goods_id}">
                              <li class="th th-chk">
                                  <div class="select-all">
                                      <div class="cart-checkbox">
                                         &lt;%&ndash; <input class="CheckBoxShop check" type="checkbox" num="all"
                                                 name="select-all"
                                                 value="true">&ndash;%&gt;
                                          <span>${i.count}</span>
                                      </div>
                                  </div>
                              </li>
                              <li class="th th-item">


                                  <div class="item-cont">
                                      <a href="javascript:;"><img src="/cakeImg/${goods.img}" alt=""></a>
                                      <div class="text">
                                          <div class="title">${goods.name}</div>
                                          <p><span>粉色</span> <span>130</span>cm</p>
                                      </div>
                                  </div>

                              </li>
                              <li class="th th-price">
                                  <span class="th-su">${goods.price}.00</span>
                              </li>
                              <li class="th th-amount">
                                  <div class="box-btn layui-clear">
                                      <a onclick="addCart(${goods.goods_id},${goods.price},${cart.num},2)">
                                          <div class="less layui-btn">-
                                          </div>
                                      </a>
                                      <input class="Quantity-input" type="" name="" value="${cart.num}"
                                             disabled="disabled">
                                      <a onclick="addCart(${goods.goods_id},${goods.price},${cart.num},1)">
                                          <div class="add layui-btn">+</div>
                                      </a>
                                  </div>
                              </li>
                              <li class="th th-sum">
                                  <span class="sum">${cart.money}.00</span>
                              </li>
                              <li class="th th-op">
                                  <a onclick="addCart(${goods.goods_id},${goods.price},${cart.num},3)"><span
                                          class="dele-btn">删除</span></a>
                              </li>
                          </ul>
                      </c:forEach>
                  </c:forEach>
              </div>
          </div>--%>


        <!-- 模版导入数据 -->
        <!-- <script type="text/html" id="demo">
          {{# layui.each(d.infoList,function(index,item){}}
            <ul class="item-content layui-clear">
              <li class="th th-chk">
                <div class="select-all">
                  <div class="cart-checkbox">
                    <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all" value="true">
                  </div>
                </div>
              </li>
              <li class="th th-item">
                <div class="item-cont">
                  <a href="javascript:;"><img src="../res/static/img/paging_img1.jpg" alt=""></a>
                  <div class="text">
                    <div class="title">宝宝T恤棉质小衫</div>
                    <p><span>粉色</span>  <span>130</span>cm</p>
                  </div>
                </div>
              </li>
              <li class="th th-price">
                <span class="th-su">189.00</span>
              </li>
              <li class="th th-amount">
                <div class="box-btn layui-clear">
                  <div class="less layui-btn">-</div>
                  <input class="Quantity-input" type="" name="" value="1" disabled="disabled">
                  <div class="add layui-btn">+</div>
                </div>
              </li>
              <li class="th th-sum">
                <span class="sum">189.00</span>
              </li>
              <li class="th th-op">
                <span class="dele-btn">删除</span>
              </li>
            </ul>
          {{# });}}
        </script> -->


        <div class="FloatBarHolder layui-clear">

            <div class="th Settlement">
                <%--<button class="layui-btn settle-accounts" id="settle-accounts" onclick="goOrder(${order.order_id})">确认支付</button>--%>
                <button class="layui-btn settle-accounts" id="settle-accounts">确认支付</button>
                <%--<button class="layui-btn settle-accounts">确认支付</button>--%>
            </div>
            <div class="th total">
                <p>应付：<span class="pieces-total">￥${order.money}.00</span></p>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    layui.config({
        base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'jquery', 'element', 'car'], function () {
        var mm = layui.mm, $ = layui.$, element = layui.element, car = layui.car;



        var settle = document.getElementById('settle-accounts');

        var order_id = document.getElementById('order_id').textContent;
        settle.onclick = function () {
            $.post("${pageContext.request.contextPath}/order/pay_response", {order_id: "${order.order_id}", num: 1}, function (data) {
                if (data.code === 0) {
                    layer.msg("支付成功");
                    location.href = "${pageContext.request.contextPath}/order/order_info?order_id=${order.order_id}" ;
                    /**
                     <%--* todo 这儿不知道可不可以用el表达式？？可以！！order_id用${order.order_id}?--%>
                     *  跳转到详情页面
                     */
                } else {
                    layer.msg("网络连接错误，请重试");
                }
            })
            // layer.msg(order_id);
            /*
            1. var order_id = document.getElementById('order_id');这个layer.msg(order_id);是由于它一直报错：
            layui.all.js:4 Uncaught TypeError: Illegal invocation
             at i (layui.all.js:4)
             at Q (layui.all.js:2)
             at Q (layui.all.js:2)
             at Q (layui.all.js:2)
             at Q (layui.all.js:2)
             at Function.pe.param (layui.all.js:4)
             at Function.ajax (layui.all.js:4)
             at Function.pe.(:8080/order/anonymous function) [as post] (http://localhost:8080/res/layui/layui.all.js:4:24426)
             at HTMLButtonElement.settle.onclick (pay_order?order_id=FF72CA0001E443D394EF213231C397C9:194)
            ，然后就想着把order_id打印一下试试看有没有内容
            2.刚开始直接获得这个元素，并没有获得内容，后面那个内容textContent纯属瞎蒙，*/
        }





    })
    ;

</script>
<%--<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script>
/*    /!**
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


                break;
        }
    }*/


    function goOrder(order_id) {

        $.post("/order/pay_response", {order_id: order_id, num: 1}, function (data) {
            layer.msg(data.msg);
        })
    }

</script>--%>

<jsp:include page="footer.jsp"/>
