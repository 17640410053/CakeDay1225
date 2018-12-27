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

<div class="content content-nav-base datails-content">
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
    <div class="data-cont-wrap w1200">
        <div class="crumb">
            <a href="javascript:;">首页</a>
            <span>></span>
            <a href="javascript:;">所有商品</a>
            <span>></span>
            <a href="javascript:;">产品详情</a>
        </div>
        <div class="product-intro layui-clear">
            <div class="preview-wrap">
                <a href="javascript:;"><img src="/cakeImg/${goods.img}" style="height: 402px;width: 402px"></a>
            </div>
            <div class="itemInfo-wrap">
                <div class="itemInfo">
                    <div class="title">
                        <h4>${goods.name}</h4>
                        <span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
                    </div>
                    <div class="summary">
                        <p class="reference"><span>参考价</span>
                            <del>￥299.00</del>
                        </p>
                        <p class="activity"><span>活动价</span><strong class="price"><i>￥</i>${goods.price}</strong></p>
                        <p class="address-box"><span>送&nbsp;&nbsp;&nbsp;&nbsp;至</span><strong
                                class="address">
                            <c:if test="${address==null}">
                                江西&nbsp;&nbsp;南昌&nbsp;&nbsp;东湖区
                            </c:if>
                            <c:if test="${address!=null}">

                                ${address.name.split(",")[0]}&nbsp;&nbsp;${address.name.split(",")[1]}&nbsp;&nbsp;${address.name.split(",")[2]}
                            </c:if>
                        </strong>
                        </p>
                    </div>
                    <div class="choose-attrs">
                        <div class="color layui-clear"><span class="title">颜&nbsp;&nbsp;&nbsp;&nbsp;色</span>
                            <div class="color-cont"><span class="btn">白色</span> <span class="btn active">粉丝</span></div>
                        </div>
                        <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span>
                            <div class="number-cont"><span class="cut btn">-</span><input
                                    onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                    maxlength="4" type="" name="" value="1"><span class="add btn">+</span></div>
                        </div>
                    </div>
                    <div class="choose-btns">
                        <button class="layui-btn layui-btn-primary purchase-btn">立刻购买</button>
                        <button class="layui-btn  layui-btn-danger car-btn"><i
                                class="layui-icon layui-icon-cart-simple"></i>加入购物车
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-clear">
            <div class="aside">
                <h4>热销推荐</h4>
                <div class="item-list">
                    <c:forEach items="${byStar}" var="star" begin="0" end="5">
                        <div class="item">
                            <a href="<c:url value="/details?goods_id=${goods.goods_id}"/>">
                                <img src="/cakeImg/${star.img}"
                                     style="width: 280px;height: 280px;">
                                <p><span>${star.name}</span><span class="pric">￥${star.price}</span></p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="detail">
                <h4>详情</h4>
                <div class="item">
                    <img src="<c:url value="/res/static/img/details_imgbig.jpg"/>">
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<c:url value="/res/layui/layui.all.js"/>"></script>
<script type="text/javascript">
    layui.config({
        base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录 这是一个入口，下面有一个入口，可能layer冲突
    }).use(['mm', 'jquery', 'layer'], function () {
        var mm = layui.mm,
            $ = layui.$;
        var cur = $('.number-cont input').val();
        $('.number-cont .btn').on('click', function () {
            if ($(this).hasClass('add')) {
                cur++;
            } else {
                if (cur > 1) {
                    cur--;
                }
            }
            $('.number-cont input').val(cur)
        });
        $('.car-btn').click(function () {
            layer.alert("啦啦啦");
        }, function () {
            $.post("/addCart", {goods_id:${goods.goods_id}, money:${goods.price}}, function (data) {
                layer.alert("啦啦啦");
                layer.alert(data.msg);
            })
        })
    });
</script>
<script>
    // layui.use(['element', 'layer'], function () {
    //     var element = layui.element, $ = layui.$, layer = layui.layer;
    //     $(".car-btn").click(function () {
    //         console.log(123);
    //         layer.msg('酷毙了');//是哪个按钮
    //     })
    // });
    /*   $(function () {

       })*/
</script>


<%--

layer.open({
  title: '在线调试'
  ,content: '可以填写任意的layer代码'
});
  layer.alert('酷毙了', {icon: 1});

  --%>
<jsp:include page="footer.jsp"/>
