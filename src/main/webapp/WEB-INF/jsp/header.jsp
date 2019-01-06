<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/25
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<%--少了个这个--%>
<html lang="en">
<head>
    <title>cake商城-${title}</title>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/res/static/css/main.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/res/layui/css/layui.css"/>">
    <script type="text/javascript" src="<c:url value="/res/layui/layui.all.js"/>"></script>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<%--有啥不一样啊--%>

<body id="list-cont">
<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="/index">首页</a>
        </p>

        <c:if test="${sessionScope.user!=null}">
            <div class="sn-quick-menu">
                <div class="login"><a href="/user/self_info">${sessionScope.user.username}</a></div>
                <div class="login"><a href="<c:url value="/order/order_list"/>">我的订单</a></div>
                <div class="sp-cart"><a href="<c:url value="/shopcart"/>">购物车</a><span>2</span></div>
            </div>
        </c:if>
        <c:if test="${user==null}">
            <div class="sn-quick-menu">
                <div class="login"><a href="<c:url value="/user/login"/>">登录</a></div>
                <div class="login"><a href="/user/register">注册</a></div>
                <div class="sp-cart"><a href="<c:url value="/shopcart"/>">购物车</a><span>2</span></div>
            </div>
        </c:if>


    </div>
</div>


<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo">
                <a href="#" title="母婴商城">
                    <img src="<c:url value="/res/static/img/logo.png"/>">
                </a>
            </h1>
            <div class="mallSearch">
                <form action="" class="layui-form" novalidate>
                    <input type="text" name="title" required lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>
<script></script>
<script>
    //Demo
    layui.use('form', function () {
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(1111);
            return false;
        });
    });
</script>

<script type="text/javascript">
    layui.config({
        base: '/res/static/js/util' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['jquery', 'form'], function () {
        var $ = layui.$, form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function (data) {
            $.post('/searchGoods', data.field, function (data) {
                if (data.code === 0) {
                    location.href = "/commoditySearch";
                } else {
                    layer.alert("网络连接错误，请稍后再试");
                }
            });
            return false;
        });

    })
</script>
