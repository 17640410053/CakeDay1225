<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/27
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="header.jsp" %>
<div class="content content-nav-base commodity-content">
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
    <div class="commod-cont-wrap">
        <div class="commod-cont w1200 layui-clear">
            <div class="left-nav">
                <div class="title">所有分类</div>
                <div class="list-box">
                    <c:forEach items="${typeVoList}" var="typeVo">
                        <dl>
                            <dt>${typeVo.name}</dt>
                            <c:forEach items="${typeVo.typesList}" var="type">
                                <dd>

                                    <a href="<c:url value="/type/commodity_type?type_id=${type.type_id}"/>">${type.name}</a>

                                </dd>
                            </c:forEach>

                        </dl>
                    </c:forEach>

                </div>
            </div>
            <div class="right-cont-wrap">
                <div class="right-cont">
                    <div class="sort layui-clear">
                        <a class="active" href="javascript:;" event='volume'>销量</a>
                        <a href="javascript:;" event='price'>价格</a>
                        <a href="javascript:;" event='newprod'>新品</a>
                        <a href="javascript:;" event='collection'>收藏</a>
                    </div>
                    <div class="prod-number">
                        <span>200个</span>
                    </div>
                    <div class="cont-list layui-clear" id="list-cont">

                        <c:forEach items="${byStar}" var="star">

                            <a href="<c:url value="/details?goods_id=${star.goods_id}"/>">
                                <div class="item">
                                    <div class="img">

                                        <img src="<c:url value="/cakeImg/${star.img}"/>"
                                             style="width: 280px;height: 280px;">

                                    </div>
                                    <div class="text">
                                        <p class="title">${star.name}</p>
                                        <p class="price">
                                            <span class="pri">￥${star.price}</span>
                                            <span class="nub">1266付款</span>
                                        </p>
                                    </div>
                                </div>

                            </a>
                        </c:forEach>


                    </div>

                    <div id="demo0" style="text-align: center;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    layui.config({
        base: '${pageContext.request.contextPath}/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'laypage', 'jquery'], function () {
        var laypage = layui.laypage, $ = layui.$,
            mm = layui.mm;
        laypage.render({
            elem: 'demo0'
            , count: 100 //数据总数
        });


        $('.sort a').on('click', function (obj) {
            $(this).addClass('active').siblings().removeClass('active');
            var event = obj.event;
            //todo
            //1.排序和搜索条件一起
            // $.post("/goods/orderByPrice",function (res) {
            //
            // })
            // alert(123)
        });
        $('.list-box dt').on('click', function () {
            if ($(this).attr('off')) {
                $(this).removeClass('active').siblings('dd').show()
                $(this).attr('off', '')
            } else {
                $(this).addClass('active').siblings('dd').hide()
                $(this).attr('off', true)
            }
        })

    });
</script>
<%@include file="footer.jsp" %>
