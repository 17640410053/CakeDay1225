<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <img src="<c:url value="/cakeImg/${commentVo.goods.img}"/>" alt=""
                         style="height: 100px;width: 100px;">
                </div>
            </div>
            <%-- int g = s%10;
                    int sw = s/10%10;
                    int b = s/100%10;
                    int q = s/1000%10;

                    --%>

            <div class="layui-form-item">
                <label class="layui-form-label">描述相符</label>
                <div class="layui-input-block" id="test">
                    <c:choose>
                        <c:when test="${(commentVo.star/100%10).intValue()==5}">

                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${(commentVo.star/100%10).intValue()==4}">

                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${(commentVo.star/10%10).intValue()==3}">

                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${(commentVo.star/10%10).intValue()==2}">

                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${(commentVo.star/10%10).intValue()==1}">

                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>

                    </c:choose>

                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">物流服务
                    <%--   ${(commentVo.star/10%10).intValue()}
                       ${commentVo.star.toString().substring(1,2)=='4'}--%>
                </label>

                <%--<fmt:formatNumber value="${commentVo.star/10%10}" maxFractionDigits="0"/>--%>
                <div class="layui-input-block" id="test1">
                    <c:choose>
                        <c:when test="${commentVo.star.toString().substring(1,2)=='5'}">
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star.toString().substring(1,2)=='4'}">

                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star.toString().substring(1,2)=='3'}">
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star.toString().substring(1,2)=='2'}">
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star.toString().substring(1,2)=='1'}">
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>

                    </c:choose>

                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">服务态度</label>
                <div class="layui-input-block" id="test2">
                    <c:choose>
                        <c:when test="${commentVo.star%10==5}">
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star%10==4}">
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star%10==3}">
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star%10==2}">
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>
                        <c:when test="${commentVo.star%10==1}">
                            <i class="layui-icon layui-icon-rate-solid" style="font-size: 30px; color: #FF5722;"></i>
                        </c:when>

                    </c:choose>
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
                            <img src="<c:url value="/upload/${commImg}"/>" alt="" style="height: 100px;width: 100px;">
                        </c:forEach>
                    </div>
                </div>

            </c:if>
            <div class="layui-form-item">
                <label class="layui-form-label">追加评论</label>
                <div class="layui-input-block">
                    <textarea name="add_content" placeholder="请输入追加的评论内容" class="layui-textarea"
                              style="resize: none"></textarea>
                    <input type="hidden" name="comm_id" value="${commentVo.comm_id}">

                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo_addContent">提交追评</button>
                    <button onclick="location.replace(document.referrer)" type="button"
                            class="layui-btn layui-btn-primary">
                        &nbsp;返回 &nbsp;
                    </button>
                </div>
            </div>
        </form>


    </div>

</div>
<script type="text/javascript">
    layui.config({
        base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'jquery', 'element', 'car','form'], function () {
        var mm = layui.mm, $ = layui.$, element = layui.element, car = layui.car,form = layui.form;


        //监听提交
        form.on('submit(formDemo_addContent)', function (data) {

            $.post("/comment/addContent", data.field, function (res) {
                if (res.code === 0) {
                    alert(res.msg + "请重新登录~~");
                    location.href = "/user/login";
                } else {
                    layer.msg(res.msg)
                }
            })
            return false;
        });

    })
    ;

</script>


<script src="<c:url value="/js/jquery.min.js"/>"></script>


<jsp:include page="footer.jsp"/>
