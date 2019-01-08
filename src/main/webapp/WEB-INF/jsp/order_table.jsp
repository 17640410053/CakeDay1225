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
                                        <a href="javascript:;">
                                            <img src="<c:url value="/cakeImg/${orderDetail.img}"/>"  alt=""></a>
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

        /*var uls = document.getElementById('list-cont').getElementsByTagName('ul');//每一行
        var checkInputs = document.getElementsByClassName('check'); // 所有勾选框
        var checkAll = document.getElementsByClassName('check-all'); //全选框
        var SelectedPieces = document.getElementsByClassName('Selected-pieces')[0];//总件数
        var piecesTotal = document.getElementsByClassName('pieces-total')[0];//总价
        var batchdeletion = document.getElementsByClassName('batch-deletion')[0]//批量删除按钮
        /!*计算*!/
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

        /!*全选框功能*!/

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

        /!*
                $('.settle-accounts').on('click', function () {
                    // layer.alert("啦啦啦");
                    $.post("/order/addOrder", {}, function (data) {

                    })
                })*!/

        function test(num) {
            layer.alert("123" + num);
        }*/


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
