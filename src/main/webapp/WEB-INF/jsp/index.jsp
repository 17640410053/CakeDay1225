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


<div class="content">
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
    <div class="category-con">
        <div class="category-inner-con w1200">
            <div class="category-type">
                <h3>全部分类</h3>
            </div>
            <div class="category-tab-content">
                <div class="nav-con">
                    <ul class="normal-nav layui-clear">
                        <c:forEach items="${typeVoList}" var="type">
                            <li class="nav-item">
                                <div class="title">${type.name}</div>
                                <p>
                                    <c:forEach items="${type.typesList}" var="typeChild">
                                        <a href="<c:url value="/type/commodity_type?type_id=${typeChild.type_id}"/>">${typeChild.name}</a>
                                    </c:forEach>

                                </p>
                                <i class="layui-icon layui-icon-right"></i>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="category-banner">
            <div class="w1200">
                <img src="<c:url value="/res/static/img/banner1.jpg"/>">
            </div>
        </div>
    </div>
    <div class="floors">
        <div class="sk">
            <div class="sk_inner w1200">
                <div class="sk_hd">
                    <a href="javascript:;">
                        <img src="<c:url value="/res/static/img/s_img1.jpg"/>">
                    </a>
                </div>
                <div class="sk_bd">
                    <div class="layui-carousel" id="test1">
                        <div carousel-item>
                            <div class="item-box">
                                <c:forEach items="${goodsList2}" var="orderDetail">
                                    <div class="item"><a
                                            href="<c:url value="/details?goods_id=${orderDetail.goods_id}"/>">
                                            <%--<a href="javascript:;">--%>
                                            <%--<img src="/cakeImg/${orderDetail.img}">--%>
                                        <img src="<c:url value="/cakeImg/${orderDetail.img}"/> " alt="">
                                            <%--</a>--%>
                                        <div class="title">${orderDetail.name}</div>
                                        <div class="price">
                                            <span>￥${orderDetail.price}</span>
                                            <del>￥299.00</del>
                                        </div>
                                    </a></div>
                                </c:forEach>

                            </div>
                            <div class="item-box">
                                <c:forEach items="${goodsList}" var="orderDetail" begin="0" end="5">
                                    <div class="item"><a
                                            href="<c:url value="/details?goods_id=${orderDetail.goods_id}"/>">
                                            <%--<a href="javascript:;">--%>
                                        <img src="<c:url value="/cakeImg/${orderDetail.img}"/>">
                                            <%--</a>--%>
                                        <div class="title">${orderDetail.name}</div>
                                        <div class="price">
                                            <span>￥${orderDetail.price}</span>
                                            <del>￥299.00</del>
                                        </div>
                                    </a></div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="hot-recommend-con">
        <div class="hot-con1 w1200 layui-clear">

            <div class="item">
                <h4>热销推荐</h4>
                <div class="big-img">
                    <a href="<c:url value="/details?goods_id=${byStar0.goods_id}"/>"> <img
                            src="<c:url value="/cakeImg/${byStar0.img}"/>" style="width: 242px; height: 192px;"></a>
                </div>
                <div class="small-img">
                    <a href="<c:url value="/details?goods_id=${byStar4.goods_id}"/>"><img
                            src="<c:url value="/cakeImg/${byStar4.img}"/>" style="width: 112px; height: 80px;"></a>
                </div>
            </div>
            <div class="item">
                <div class="top-img">
                    <a href="<c:url value="/details?goods_id=${byStar2.goods_id}"/>"><img
                            src="<c:url value="/cakeImg/${byStar2.img}"/>" style="width: 350px; height: 246px;"></a>
                </div>
                <div class="bottom-img">
                    <a href="<c:url value="/details?goods_id=${byStar3.goods_id}"/>"><img
                            src="<c:url value="/cakeImg/${byStar3.img}"/>" style="width: 168px; height: 200px;"></a>
                    <a href="<c:url value="/details?goods_id=${byStar1.goods_id}"/>"><img
                            src="<c:url value="/cakeImg/${byStar1.img}"/>" style="width: 168px; height: 200px;"></a>
                </div>
            </div>
            <div class="item item1 margin0 padding0">
                <a href="<c:url value="/details?goods_id=${byStar6.goods_id}"/>"><img
                        src="<c:url value="/cakeImg/${byStar6.img}"/>" style="width: 390px; height: 242px;"></a>
                <a href="<c:url value="/details?goods_id=${byStar7.goods_id}"/>"><img
                        src="<c:url value="/cakeImg/${byStar7.img}"/>"
                        style="width: 390px; height: 242px;margin-top: 15px"></a>
            </div>
        </div>
    </div>


    <div class="product-cont w1200" id="product-cont">
        <c:forEach items="${goodsListAll}" var="orderDetail" varStatus="i">
            <div class="product-item product-item${i.count} layui-clear">
                <div class="left-title">
                    <h4><i>${i.count}F</i></h4>
                    <img src="<c:url value="/res/static/img/icon_gou.png"/>">
                    <h5>${orderDetail.name}</h5>
                </div>
                <div class="right-cont">
                    <a href="javascript:;" class="top-img"><img src="<c:url value="/res/static/img/img12.jpg"/>" alt=""></a>
                    <div class="img-box">
                        <c:forEach items="${orderDetail.goodsList}" var="goods1" begin="0" end="4">
                            <a href="<c:url value="/details?goods_id=${goods1.goods_id}"/>">
                                <img src="<c:url value="/cakeImg/${goods1.img}"/>"
                                     style="width: 199px;height: 197px; float: left"
                                     alt="">
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="product-list-box" id="product-list-box">
        <div class="product-list-cont w1200">
            <h4>更多推荐</h4>
            <div class="product-item-box layui-clear">
                <c:forEach items="${goodsStarLQ3}" var="goods">
                    <div class="list-item">
                        <a href="<c:url value="/details?goods_id=${goods.goods_id}"/>"><img
                                src="<c:url value="/cakeImg/${goods.img}"/>"
                                height="180"></a>
                        <p style="text-align: center">${goods.name}</p>
                        <span>￥${goods.price}</span>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    layui.config({
        base: '${pageContext.request.contextPath}/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'carousel'], function () {
        var carousel = layui.carousel,
            mm = layui.mm;
        var option = {
            elem: '#test1'
            , width: '100%' //设置容器宽度
            , arrow: 'always'
            , height: '298'
            , indicator: 'none'
        }
        carousel.render(option);



    });
</script>
<jsp:include page="footer.jsp"/>
