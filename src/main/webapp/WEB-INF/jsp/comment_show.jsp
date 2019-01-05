<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
                           value="${commentVo.goods.goods_id}" autocomplete="off"
                           class="layui-input" readonly>
                    <input id="imgName" type="hidden" name="img"
                           value="" readonly>

                    <input type="text" required lay-verify="required"
                           value="${commentVo.goods.name}" autocomplete="off"
                           class="layui-input" readonly>


                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品</label>
                <div class="layui-input-block">
                    <img src="/cakeImg/${commentVo.goods.img}" alt="" style="height: 100px;width: 100px;">
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">描述相符</label>
                <div class="layui-input-block" id="test">
                    <c:choose>
                        <c:when test="${commentVo.star==5}">
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star==4}">
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star==3}">
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star==2}">
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star==1}">
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>

                    </c:choose>
                    <c:if test="${commentVo.star>=5}">
                        <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                        <c:if test="${commentVo.star>=4}">
                            <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                            <c:if test="${commentVo.star>=3}">
                                <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                                <c:if test="${commentVo.star>=2}">
                                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                                    <c:if test="${commentVo.star>=1}">
                                        <i class="layui-icon layui-icon-rate"
                                           style="font-size: 30px; color: #FF5722;"></i>
                                    </c:if>
                                </c:if>
                            </c:if>
                        </c:if>
                    </c:if>


                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">物流服务</label>
                <div class="layui-input-block" id="test1">

                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">服务态度</label>
                <div class="layui-input-block" id="test2">

                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">评论内容</label>
                <div class="layui-input-block">
                    <textarea name="content" class="layui-textarea" readonly
                              style="resize: none">${commentVo.content}</textarea>
                </div>
            </div>
            <c:if test="${!empty commentVo.img}">
                <div class="layui-form-item">
                    <label class="layui-form-label">评论照片</label>

                    <div class="layui-input-block">
                        <c:forEach items="${commentVo.img}" var="commImg">
                            <img src="/upload/${commImg}" alt="" style="height: 100px;width: 100px;">
                        </c:forEach>
                    </div>
                </div>

            </c:if>
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
        $("#test1").html($("#test").html());
        $("#test2").html($("#test").html());

    })
    ;

</script>
<script src="<c:url value="/js/jquery.min.js"/>"></script>


<jsp:include page="footer.jsp"/>
