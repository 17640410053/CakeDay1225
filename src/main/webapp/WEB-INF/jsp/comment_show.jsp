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
<style>
    .layui-upload .mark_button {
        position: absolute;
        right: 15px;
    }

    .upload-img {
        position: relative;
        display: inline-block;
        width: 300px;
        height: 200px;
        margin: 0 10px 10px 0;
        transition: box-shadow .25s;
        border-radius: 4px;
        box-shadow: 0px 10px 10px -5px rgba(0, 0, 0, 0.5);
        transition: 0.25s;
        -webkit-transition: 0.25s;
        margin-top: 15px;
    }

    .layui-upload-img {
        width: 300px;
        height: 200px;
        border-radius: 4px;
    }

    .upload-img:hover {
        cursor: pointer;
        box-shadow: 0 0 4px rgba(0, 0, 0, 1);
        transform: scale(1.2);
        -webkit-transform: scale(1.05);
    }

    .upload-img input {
        position: absolute;
        left: 0px;
        top: 0px;
    }

    .upload-img button {
        position: absolute;
        right: 0px;
        top: 0px;
        border-radius: 6px;
    }
</style>
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
                <label class="layui-form-label">商品名</label>
                <div class="layui-input-block">
                    <input type="hidden" name="goods_id" required lay-verify="required"
                           value="${goods.goods_id}" autocomplete="off"
                           class="layui-input" readonly>
                    <input id="imgName" type="hidden" name="img"
                           value="" readonly>

                    <input type="text" required lay-verify="required"
                           value="${goods.name}" autocomplete="off"
                           class="layui-input" readonly>


                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品</label>
                <div class="layui-input-block">
                    <img src="/cakeImg/${goods.img}" alt="" style="height: 100px;width: 100px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">描述相符</label>
                <div class="layui-input-block">
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <%--<a href=""><span style="margin-right: -100px;margin-top: -30px;float: right">添加收货地址</span></a>--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">物流服务</label>
                <div class="layui-input-block">
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <%--<a href=""><span style="margin-right: -100px;margin-top: -30px;float: right">添加收货地址</span></a>--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">服务态度</label>
                <div class="layui-input-block">
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <%--<a href=""><span style="margin-right: -100px;margin-top: -30px;float: right">添加收货地址</span></a>--%>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">发表评论</label>
                <div class="layui-input-block">
                    <textarea name="content" placeholder="请输入内容" class="layui-textarea" readonly></textarea>
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">几颗星</label>
                <div class="layui-input-block">
                    <input type="radio" name="star" value="1" title="一颗星">
                    <input type="radio" name="star" value="2" title="两颗星">
                    <input type="radio" name="star" value="3" title="三颗星">
                    <input type="radio" name="star" value="4" title="四颗星">
                    <input type="radio" name="star" value="5" title="五颗星" checked>
                </div>
            </div>


            <button onclick="location.replace(document.referrer)" type="button" class="layui-btn layui-btn-primary">
                &nbsp;返回 &nbsp;
            </button>

        </form>








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
