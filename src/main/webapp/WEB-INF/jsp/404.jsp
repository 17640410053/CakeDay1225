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
<div class="content content-nav-base error-content">
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
    <div class="error-bg">
        <div class="error-cont w1200">
            <div class="layui-body error-body" id="LAY_app_body">
                <div class="layadmin-tabsbody-item layui-show">
                    <div class="layui-fluid">
                        <div class="layadmin-tips">
                            <i class="layui-icon" face=""></i>
                            <div class="layui-text">
                                <h1>
                                    <span class="layui-anim layui-anim-loop layui-anim-">4</span>
                                    <span class="layui-anim layui-anim-loop layui-anim-rotate">0</span>
                                    <span class="layui-anim layui-anim-loop layui-anim-">4</span>
                                </h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.config({
        base: './dist/' //指定 layuiAdmin 项目路径
        , version: '1.2.1'
    }).use('index', function () {
        var layer = layui.layer, admin = layui.admin;
        layer.ready(function () {
            admin.popup({
                content: '单页面专业版默认未开启“多标签”功能，实际运用时，你可以自定义是否开启'
                , area: '300px'
                , btnAlign: 'c'
                , shade: false
            });
        });
    });
</script>
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<style id="LAY_layadmin_theme">
    .layui-side-menu, .layadmin-pagetabs .layui-tab-title li:after, .layadmin-pagetabs .layui-tab-title li.layui-this:after, .layui-layer-admin .layui-layer-title, .layadmin-side-shrink .layui-side-menu .layui-nav > .layui-nav-item > .layui-nav-child {
        background-color: #20222A !important;
    }

    .layui-nav-tree .layui-this, .layui-nav-tree .layui-this > a, .layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-nav-child dd.layui-this a {
        background-color: #009688 !important;
    }

    .layui-layout-admin .layui-logo {
        background-color: #20222A !important;
    }

    .layadmin-tips .layui-icon[face] {
        display: inline-block;
        font-size: 300px;
        color: #393D49;
    }

    .layadmin-tips {
        margin-top: 30px;
        text-align: center;
    }

    .layadmin-tips .layui-text {
        width: 500px;
        margin: 30px auto;
        padding-top: 20px;
        border-top: 5px solid #cfb2f6;
        font-size: 16px;
    }

    .layadmin-tips h1 {
        font-size: 100px;
        line-height: 100px;
        color: #cfb2f6;
    }

    .layui-anim {
        -webkit-animation-duration: .3s;
        animation-duration: .3s;
        -webkit-animation-fill-mode: both;
        animation-fill-mode: both;
    }

    .layui-anim-loop {
        -webkit-animation-iteration-count: infinite;
        animation-iteration-count: infinite;
    }

    .layui-anim-rotate {
        -webkit-animation-name: layui-rotate;
        animation-name: layui-rotate;
        -webkit-animation-duration: 2s;
        animation-duration: 2s;
        -webkit-animation-timing-function: linear;
        animation-timing-function: linear;
    }

    .layadmin-tips .layui-text .layui-anim {
        display: inline-block;
    }

    .error-bg {
        width: 100%;
        background: no-repeat;
        background-size: cover;
    }


    .error-content .error-bg .error-cont{ height: 772px; position: relative;}

    .error-body {
        right: 200px;
    }
</style>
<jsp:include page="footer.jsp"/>
