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

    <%--    <div class="w1200" >
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="margin-left: -20px;font-size: larger">收货地址</label>
                    <div class="layui-input-block" style="width: 700px">
                        <select name="address_id"   lay-verify="required">
                           &lt;%&ndash; <option value=""></option>
                            <option value="0">北京</option>
                            <option value="1">上海</option>
                            <option value="2">广州</option>
                            <option value="3">深圳</option>
                            <option value="4">杭州</option>&ndash;%&gt;
                               <c:forEach items="${addressList}" var="a" varStatus="ai">
                                   <option value="${a.id}">${a.name}&nbsp;&nbsp;${a.phone}&nbsp;&nbsp;${a.detail}</option>
                               </c:forEach>
                        </select>
                        <a href=""><span  style="margin-right: -100px;margin-top: -30px;float: right">添加收货地址</span></a>
                    </div>

                </div>
            &lt;%&ndash;    <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>&ndash;%&gt;
            </form>

            <script>

                //Demo
                layui.use('form', function(){
                    var form = layui.form;
                    form.render();
                    //监听提交
                    form.on('submit(formDemo)', function(data){
                        layer.msg(JSON.stringify(data.field));
                        return false;
                    });
                });
            </script>
         &lt;%&ndash;   <select name="address_id" id="address" style="width:60%;height: 25px" class="form-control">
                <c:forEach items="${addressList}" var="a" varStatus="ai">
                    <option value="${a.id}">${a.name}&nbsp;&nbsp;${a.phone}&nbsp;&nbsp;${a.detail}</option>
                </c:forEach>
            </select>
            <c:if test="${empty addressList}">
                <a href="/address/showAddress">添加收货地址</a>
            </c:if>
            <h3>精选品质</h3>
            <p>蛋糕、糖果、点心9折起</p>&ndash;%&gt;
        </div>--%>

    <div class="cart w1200">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">全部订单</li>
                <li>待付款</li>
                <li>已付款</li>
                <li>待收货</li>
                <li>已收货</li>
                <li>待评价</li>
            </ul>
            <div class="layui-tab-content">

                <div class="layui-tab-item layui-show">
                    全部订单
                    <%--     <c:forEach items="${commentVoList}" var="commentVo">
                             <div class="layui-row layui-col-space10"  style="margin-top: 10px;border-bottom: 1px solid #ddd;;">
                                 <div class="layui-col-md2">
                                     <p style="text-align: center">
                                         <img src="/img/userImg/${commentVo.users.image}" width="50" alt="" style="border-radius: 50%"></p>
                                     <p style="text-align: center;margin-top: 10px">${commentVo.users.username}</p>
                                 </div>
                                 <div class="layui-col-md7">
                                     <p class="comment-img">
                                         <c:forEach items="${commentVo.img}" var="commImg">
                                             <img src="/upload/${commImg}" height="60"
                                                  alt="" style="margin-left: 10px">
                                         </c:forEach>
                                     </p>
                                     <div style="height: 100%;margin-top: 15px">人生就像是一场修行
                                         <p>${commentVo.content}</p>
                                     </div>
                                 </div>
                                 <div class="layui-col-md3">
                                     <span style="font-size:12px;color: #999 ">${commentVo.createTime}</span>
                                 </div>
                             </div>
                         </c:forEach>--%>
                    <%--layui.code--%>
                <table class="layui-table" lay-skin="line">
                                  <colgroup>
                                      <col width="150">
                                      <col width="200">
                                      <col>
                                  </colgroup>
                              <thead>
                                      <tr>
                                          <th>昵称</th>
                                          <th>加入时间</th>
                                          <th>签名</th>
                                          <th>昵称</th>
                                          <th>加入时间</th>
                                          <th>签名</th>
                                      </tr>
                                      </thead>
                                  <tbody>
                                  <%--<c:forEach items="${commentVoList}" var="commentVo">


                                      <tr>
                                          <td>
                                              <div><img src="/img/userImg/${commentVo.users.image}"
                                                        alt=""
                                                        style="height: 35px;width: 35px;border-radius: 50%">
                                                  <span>${commentVo.users.username}</span>
                                              </div>
                                          </td>
                                          <td>${commentVo.content}
                                              <c:forEach items="${commentVo.img}" var="commImg">
                                                  <img src="/upload/${commImg}" alt=""
                                                       style="height: 60px;width: 60px;">
                                              </c:forEach>
                                              <span> ${commentVo.createTime}</span>
                                          </td>
                                          <td>人生就像是一场修行</td>
                                      </tr>
                                  </c:forEach>--%>
                                        <tr>
                                                   <td>许闲心</td>
                                                   <td>2016-11-28</td>
                                                   <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>   <td>许闲心</td>
                                                   <td>2016-11-28</td>
                                                   <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                                               </tr>              <tr>
                                                   <td>许闲心</td>
                                                   <td>2016-11-28</td>
                                                   <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>   <td>许闲心</td>
                                                   <td>2016-11-28</td>
                                                   <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                                               </tr>
                                  </tbody>
                              </table>
                    <div class="cart-table-th">
                        <div class="th th-chk">
                            <div class="th-inner">
                                序号
                            </div>
                        </div>
                        <div class="th th-item">
                            <div class="th-inner">
                                订单号
                            </div>
                        </div>
                        <div class="th th-price">
                            <div class="th-inner">
                                总金额
                            </div>
                        </div>
                        <div class="th th-amount">
                            <div class="th-inner">
                                订单时间
                            </div>
                        </div>
                        <div class="th th-sum">
                            <div class="th-inner">
                                订单状态
                            </div>
                        </div>
                        <div class="th th-op">
                            <div class="th-inner">
                                操作
                            </div>
                        </div>
                    </div>
                    <div class="OrderList">
                        <sp class="order-content" id="list-cont">
                            <c:forEach items="${orderList}" var="order" varStatus="i">

                            <ul class="item-content layui-clear" id="cart-list-${order.order_id}">
                                <li class="th th-chk">
                                    <span>${i.count}</span>
                                </li>
                                <li class="th th-item">
                                    <span disabled="disabled">${order.order_id}</span>

                                </li>
                                <li class="th th-price">
                                    <span class="th-su">￥${order.money}.00</span>
                                </li>

                                <li class="th th-amount">
                                    <span type="" disabled="disabled">${order.time}</span>
                                </li>
                                <li class="th th-sum">
                                    <c:if test="${order.status==0}">
                                        <span class="sum">未支付</span>
                                    </c:if>
                                    <c:if test="${order.status==1}">
                                        <span class="sum">已支付</span>
                                    </c:if>
                                        <%--    <c:if test="${order.status==2}">
                                                <span class="sum">已发货</span>
                                            </c:if>--%>
                                    <c:if test="${order.status==2}">
                                        <span class="sum">已收货</span>
                                    </c:if>
                                    <c:if test="${order.status==3}">
                                        <span class="sum">已评价</span>
                                    </c:if>
                                </li>
                                <li class="th th-op">
                                    <a type="button" class="layui-btn layui-btn-primary" style="margin-top:-30px;margin-bottom: 3px"
                                       href="<c:url value="/order/order_info?order_id=${order.order_id}"/>">订单详情</a>
                                    <c:choose>
                                        <c:when test="${order.status == 0}">
                                            <a type="button" class="layui-btn layui-btn-warm" style="margin-bottom: 3px"
                                               href="<c:url value="/order/pay_order?order_id=${order.order_id}"/>">去支付</a>
                                            <a type="button" class="layui-btn layui-btn-danger" style="margin-bottom: 3px"
                                               href="<c:url value="/order/delete_order?order_id=${order.order_id}"/>">删除订单</a>
                                        </c:when>
                                        <c:when test="${order.status == 1}">
                                            <a type="button" class="layui-btn"
                                               href="<c:url value="/order/pay_response?order_id=${order.order_id}&num=2"/>">确认收货</a>
                                        </c:when>
                                        <%--<c:when test="${order.status == 2 }">--%>
                                        <%--<a type="button" class="layui-btn"--%>
                                        <%--href="<c:url value="/order/order_info?order_id=${order.order_id}&num=3"/>">去评价</a>--%>
                                        <%--</c:when>--%>
                                    </c:choose>
                                </li>
                            </ul>

                            </c:forEach>
                    </div>

                </div>
                <div class="layui-tab-item layui-show">
                    待付款
                    <%--     <c:forEach items="${commentVoList}" var="commentVo">
                             <div class="layui-row layui-col-space10"  style="margin-top: 10px;border-bottom: 1px solid #ddd;;">
                                 <div class="layui-col-md2">
                                     <p style="text-align: center">
                                         <img src="/img/userImg/${commentVo.users.image}" width="50" alt="" style="border-radius: 50%"></p>
                                     <p style="text-align: center;margin-top: 10px">${commentVo.users.username}</p>
                                 </div>
                                 <div class="layui-col-md7">
                                     <p class="comment-img">
                                         <c:forEach items="${commentVo.img}" var="commImg">
                                             <img src="/upload/${commImg}" height="60"
                                                  alt="" style="margin-left: 10px">
                                         </c:forEach>
                                     </p>
                                     <div style="height: 100%;margin-top: 15px">人生就像是一场修行
                                         <p>${commentVo.content}</p>
                                     </div>
                                 </div>
                                 <div class="layui-col-md3">
                                     <span style="font-size:12px;color: #999 ">${commentVo.createTime}</span>
                                 </div>
                             </div>
                         </c:forEach>--%>
                    <%--layui.code--%>
                    <%--          <table class="layui-table" lay-skin="line">
                                  <colgroup>
                                      <col width="150">
                                      <col width="200">
                                      <col>
                                  </colgroup>
                                  &lt;%&ndash;    <thead>
                                      <tr>
                                          <th>昵称</th>
                                          <th>加入时间</th>
                                          <th>签名</th>
                                      </tr>
                                      </thead>&ndash;%&gt;
                                  <tbody>
                                  <c:forEach items="${commentVoList}" var="commentVo">


                                      <tr>
                                          <td>
                                              <div><img src="/img/userImg/${commentVo.users.image}"
                                                        alt=""
                                                        style="height: 35px;width: 35px;border-radius: 50%">
                                                  <span>${commentVo.users.username}</span>
                                              </div>
                                          </td>
                                          <td>${commentVo.content}
                                              <c:forEach items="${commentVo.img}" var="commImg">
                                                  <img src="/upload/${commImg}" alt=""
                                                       style="height: 60px;width: 60px;">
                                              </c:forEach>
                                              <span> ${commentVo.createTime}</span>
                                          </td>
                                          <td>人生就像是一场修行</td>
                                      </tr>
                                  </c:forEach>
                                  &lt;%&ndash;             <tr>
                                                   <td>许闲心</td>
                                                   <td>2016-11-28</td>
                                                   <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
                                               </tr>&ndash;%&gt;
                                  </tbody>
                              </table>--%>
                </div>
                <div class="layui-tab-item">

                    已付款

                </div>
                <div class="layui-tab-item">
                    待收货
                </div>
                <div class="layui-tab-item">
                    已收货
                </div>
                <div class="layui-tab-item">
                    待评价
                </div>

            </div>
        </div>



        <div class="FloatBarHolder layui-clear">
            <a href="<c:url value="/index"/>">
                <button type="button" class="layui-btn layui-btn-primary" style="float: right">返回</button>
            </a>
        </div>


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
<p><span>粉色</span> <span>130</span>cm</p>
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
