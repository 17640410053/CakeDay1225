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
        <div class="cart-table-th">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="allCheckked" type="checkbox" value="true">
                    </div>
                    <label>&nbsp;&nbsp;全选</label>
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
                <c:forEach items="${usersCart}" var="cart">
                    <ul class="item-content layui-clear">
                        <li class="th th-chk">
                            <div class="select-all">
                                <div class="cart-checkbox">
                                    <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all"
                                           value="true">
                                </div>
                            </div>
                        </li>
                        <li class="th th-item">
                            <c:forEach items="${cart.goodsList}" var="goods">
                            <input type="text" class="hidden-goods-id" value="${goods.goods_id}" hidden title="">
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
                        </c:forEach>
                        <li class="th th-amount">
                            <div class="box-btn layui-clear">
                                <div class="less layui-btn">-</div>
                                <input class="Quantity-input" type="" name="" value="${cart.num}" disabled="disabled">
                                <div class="add layui-btn">+</div>
                            </div>
                        </li>
                        <li class="th th-sum">
                            <span class="sum">${cart.money}.00</span>
                        </li>
                        <li class="th th-op">
                            <span class="dele-btn">删除</span>
                        </li>
                    </ul>
                </c:forEach>
            </div>
        </div>


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
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="" name="select-all" type="checkbox" value="true">
                    </div>
                    <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
                </div>
            </div>
            <div class="th batch-deletion">
                <span class="batch-dele-btn">批量删除</span>
            </div>
            <div class="th Settlement">
                <button class="layui-btn settle-accounts">结算</button>
            </div>
            <div class="th total">
                <p>应付：<span class="pieces-total">0</span></p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    layui.config({
        base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'jquery', 'element', 'car'], function () {
        var mm = layui.mm, $ = layui.$, element = layui.element, car = layui.car;
        var goods_id = document.getElementsByClassName('hidden-goods-id');
        $(".settle-accounts").click(function () {
            $.post("/addCart", {goods_id: goods_id}, function (data) {
                layer.alert("啦啦啦");
                layer.alert(data.msg);
            })
        })
        // 模版导入数据
        // var html = demo.innerHTML,
        // listCont = document.getElementById('list-cont');
        // mm.request({
        //   url: '../json/shopcart.json',
        //   success : function(res){
        //     listCont.innerHTML = mm.renderHtml(html,res)
        //     element.render();
        //     car.init()
        //   },
        //   error: function(res){
        //     console.log(res);
        //   }
        // })
        //
        car.init()


    });
</script>

<jsp:include page="footer.jsp"/>
