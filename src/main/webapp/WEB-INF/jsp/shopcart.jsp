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
                <c:forEach items="${usersCart}" var="order">
                    <c:forEach items="${order.goodsList}" var="orderDetail">
                        <ul class="item-content layui-clear" id="cart-list-${orderDetail.goods_id}">
                            <li class="th th-chk">
                                <div class="select-all">
                                    <div class="cart-checkbox">
                                        <input class="CheckBoxShop check" type="checkbox" num="all"
                                               name="select-all"
                                               value="true">
                                    </div>
                                </div>
                            </li>
                            <li class="th th-item">


                                <div class="item-cont">
                                    <a href="javascript:;">
                                        <img src="<c:url value="/cakeImg/${orderDetail.img}"/>" alt=""></a>
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
                                <div class="box-btn layui-clear">
                                    <a onclick="addCart(${orderDetail.goods_id},${orderDetail.price},${order.num},2)">
                                        <div class="less layui-btn">-
                                        </div>
                                    </a>
                                    <input class="Quantity-input" type="" name="" value="${order.num}"
                                           disabled="disabled">
                                    <a onclick="addCart(${orderDetail.goods_id},${orderDetail.price},${order.num},1)">
                                        <div class="add layui-btn">+</div>
                                    </a>
                                </div>
                            </li>
                            <li class="th th-sum">
                                <span class="sum">${order.money}.00</span>
                            </li>
                            <li class="th th-op">
                                <a onclick="addCart(${orderDetail.goods_id},${orderDetail.price},${order.num},3)"><span
                                        class="dele-btn">删除</span></a>
                            </li>
                        </ul>
                    </c:forEach>
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
                <a><span class="batch-dele-btn">批量删除</span></a>
            </div>
            <div class="th Settlement">
                <a href="<c:url value="/ordertable"/>">
                    <button class="layui-btn settle-accounts">结算</button>
                </a>

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
        // car.init();

        var uls = document.getElementById('list-cont').getElementsByTagName('ul');//每一行
        var checkInputs = document.getElementsByClassName('check'); // 所有勾选框
        var checkAll = document.getElementsByClassName('check-all'); //全选框
        var SelectedPieces = document.getElementsByClassName('Selected-pieces')[0];//总件数
        var piecesTotal = document.getElementsByClassName('pieces-total')[0];//总价
        var batchdeletion = document.getElementsByClassName('batch-deletion')[0]//批量删除按钮
        /*计算*/
        function getTotal() {
            var seleted = 0, price = 0;
            for (var i = 0; i < uls.length; i++) {
                if (uls[i].getElementsByTagName('input')[0].checked) {
                    seleted += parseInt(uls[i].getElementsByClassName('Quantity-input')[0].value);
                    price += parseFloat(uls[i].getElementsByClassName('sum')[0].innerHTML);
                }
            }
            SelectedPieces.innerHTML = seleted;
            piecesTotal.innerHTML = '￥' + price.toFixed(2);
        }

        function fn1() {
            alert(1)
        }

        // 小计
        function getSubTotal(ul) {
            var unitprice = parseFloat(ul.getElementsByClassName('th-su')[0].innerHTML);
            var count = parseInt(ul.getElementsByClassName('Quantity-input')[0].value);
            var SubTotal = parseFloat(unitprice * count)
            ul.getElementsByClassName('sum')[0].innerHTML = SubTotal.toFixed(2);
        }

        /*全选框功能*/

        for (var i = 0; i < checkInputs.length; i++) {
            checkInputs[i].onclick = function () {
                if (this.className === 'check-all check') {
                    for (var j = 0; j < checkInputs.length; j++) {
                        checkInputs[j].checked = this.checked;
                    }
                }
                if (this.checked === false) {
                    for (var k = 0; k < checkAll.length; k++) {
                        checkAll[k].checked = false;
                    }
                }
                getTotal()
            }
        }

        for (var i = 0; i < uls.length; i++) {
            uls[i].onclick = function (e) {
                e = e || window.event;
                var el = e.srcElement;
                var cls = el.className;
                var input = this.getElementsByClassName('Quantity-input')[0];
                var less = this.getElementsByClassName('less')[0];
                var val = parseInt(input.value);
                var that = this;
                switch (cls) {
                    case 'add layui-btn':
                        if (val < 10) {
                            input.value = val + 1;
                        }
                        getSubTotal(this);
                        break;
                    case 'less layui-btn':
                        if (val > 1) {
                            input.value = val - 1;
                        }
                        getSubTotal(this);
                        break;
                    case 'dele-btn':
                        getSubTotal(this);
                        break;
                }
                getTotal()
            }
        }

        batchdeletion.onclick = function () {
            if (SelectedPieces.innerHTML != 0) {
                layer.confirm('你确定要删除吗', {
                    yes: function (index, layero) {
                        layer.close(index);
                        $.post("/deleteAllGoods", {}, function (data) {
                            layer.alert(data.msg)
                        });
                        for (var i = 0; i < uls.length; i++) {
                            var input = uls[i].getElementsByTagName('input')[0];
                            if (input.checked) {
                                uls[i].parentNode.removeChild(uls[i]);
                                i--;
                            }
                        }
                        getTotal()
                    }

                })
            } else {
                layer.msg('请选择商品')
            }

        }

        checkAll[0].checked = true;
        checkAll[0].onclick();

        /*
                $('.settle-accounts').on('click', function () {
                    // layer.alert("啦啦啦");
                    $.post("/order/addOrder", {}, function (data) {

                    })
                })*/

        function test(num) {
            layer.alert("123" + num);
        }

    })
    ;

</script>
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script>
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

</script>
<%--
todo:1.减到0时怎么去除这一行，2.还有加到一定的数值限制，防止数值越界变负数,3.删除时怎么及时的刷新
--%>
<jsp:include page="footer.jsp"/>
