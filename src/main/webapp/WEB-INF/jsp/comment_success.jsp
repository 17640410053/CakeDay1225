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
        <h3>精选品质</h3>
        <p>蛋糕、糖果、点心9折起</p>
    </div>
    <div class="cart w1200">
        <div style="height: 500px;border: 1px solid #C9C9C9;text-align: center">

            <i class="layui-icon layui-icon-ok-circle" style="font-size: 45px; color: #FF5722;"></i>
            <h2>评价成功</h2>
            <br>
            <a href="<c:url value="/index"/>">返回首页</a>
            <a href="<c:url value="/comment/comment_show?comm_id=${comment.comm_id}"/>">查看评价</a>
            <a href="<c:url value="/order/order_info?order_id=${orderTable.order_id}"/>">继续评价</a>

        </div>

    </div>

</div>

<script type="text/javascript">
    layui.config({
        base: '${pageContext.request.contextPath}/res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'jquery', 'element', 'car'], function () {
        var mm = layui.mm, $ = layui.$, element = layui.element, car = layui.car;


    })
    ;

</script>
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<jsp:include page="footer.jsp"/>
