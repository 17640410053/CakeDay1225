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

<div class="content content-nav-base  login-content">
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
    <div class="login-bg">
        <div class="login-cont w1200">
            <div class="form-box" style="width: 380px;"><%--改登录框的宽度--%>
                <div class="layui-tab">
                    <ul class="layui-tab-title">
                        <li class="layui-this">用邮箱验证码登录</li>
                        <li>用邮箱密码登录</li>
                        <li>用户名登录</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <form class="layui-form" action="">
                                <div class="layui-form-item">
                                    <div class="layui-inline iphone">
                                        <div class="layui-input-inline">
                                            <i class="layui-icon layui-icon-cellphone iphone-icon"></i>
                                            <input type="tel" name="mail" lay-verify="required|email"
                                                   placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-inline veri-code">
                                        <div class="layui-input-inline">
                                            <input id="pnum" type="text" name="pnum" lay-verify="required"
                                                   placeholder="请输入验证码"
                                                   autocomplete="off" class="layui-input">
                                            <input type="button" class="layui-btn" id="find" value="验证码"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item login-btn">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="login-for-code"
                                                onclick="return false">登录
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="layui-tab-item">
                            <form class="layui-form" action="">
                                <div class="layui-form-item">
                                    <div class="layui-inline iphone">
                                        <div class="layui-input-inline">
                                            <i class="layui-icon layui-icon-cellphone iphone-icon"></i>
                                            <input type="email" name="mail" lay-verify="required|email"
                                                   placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-inline iphone">
                                        <div class="layui-input-inline">
                                            <i class="layui-icon layui-icon-password iphone-icon"></i>
                                            <input type="password" name="password" lay-verify="required"
                                                   placeholder="请输入密码" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-inline veri-code">
                                        <div class="layui-input-inline">
                                            <input id="verify" type="text" name="verify" lay-verify="required"
                                                   placeholder="请输入验证码"
                                                   autocomplete="off" class="layui-input">
                                            <img id="page-code" src="<c:url value="/verifyCode"/>" width="100"
                                                 title="验证码"
                                                 class="layui-btn"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item login-btn">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="login-for-pass"
                                                onclick="return false">登录
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="layui-tab-item">
                            <form class="layui-form" action="">
                                <div class="layui-form-item">
                                    <div class="layui-inline iphone">
                                        <div class="layui-input-inline">
                                            <i class="layui-icon layui-icon-username iphone-icon"></i>
                                            <input type="text" name="username" lay-verify="required"
                                                   placeholder="请输入用户名" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-inline iphone">
                                        <div class="layui-input-inline">
                                            <i class="layui-icon layui-icon-password iphone-icon"></i>
                                            <input type="password" name="password" lay-verify="required"
                                                   placeholder="请输入密码" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>

                                </div>
                                <div class="layui-form-item login-btn">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit lay-filter="login-for-name"
                                                onclick="return false">登录
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    layui.config({
        base: '/res/static/js/util' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['jquery', 'form'], function () {
        var $ = layui.$, form = layui.form;
        var find = $("#find");


        find.click(function () {
            var mail = $("[name = 'mail']:eq(0)");
            if (!/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/.test(mail.val())) {
                layer.msg("请输入正确的邮箱");
                return false;
            }
            var obj = this;
            $.ajax({
                type: "POST",
                url: "/send",
                data: {mail: mail.val()},
                dataType: "json",//返回的
                success: function (data) {
                    if (data.code === 0) {
                        find.addClass("layui-btn-disabled");
                        find.attr('disabled', "true");
                        settime(obj);
                    }
                    layer.msg(data.msg);
                },
                error: function (msg) {
                    console.log(msg);
                }
            });
        });
        var countdown = 60;

        function settime(obj) {
            if (countdown === 0) {
                obj.removeAttribute("disabled");
                obj.classList.remove("layui-btn-disabled");
                obj.value = "获取验证码";
                countdown = 60;
                return;
            } else {

                obj.value = "重新发送(" + countdown + ")";
                countdown--;
            }
            setTimeout(function () {
                    settime(obj)
                }
                , 1000)
        }

        //监听提交
        form.on('submit(login-for-code)', function (data) {
            $.post('/login', data.field, function (msg) {
                if (msg.code === 0) {
                    layer.msg(msg.msg);
                    /**
                     * 在这儿写成功登陆的话去主页
                     * */
                    location.href = "/index";
                } else {
                    layer.msg(msg.msg);
                }
            });
            return false;
        });
        //监听提交
        form.on('submit(login-for-name)', function (data) {
            $.post('/login', data.field, function (msg) {
                if (msg.code === 0) {
                    layer.msg(msg.msg);
                    /**
                     * 在这儿写成功登陆的话去主页
                     * */
                    location.href = "/index";
                } else {
                    layer.msg(msg.msg);
                }
            });
            return false;
        });


        //监听提交
        form.on('submit(login-for-pass)', function (data) {
            $.post('/login', data.field, function (msg) {
                if (msg.code === 0) {
                    layer.msg(msg.msg);
                    location.href = "/index";
                } else {
                    layer.msg(msg.msg);
                }
            });
            return false;
        });


        //
        //2.点击验证码 更新验证码
        $("#page-code").click(function () {
            $("#page-code").attr("src", "/verifyCode?time=" + new Date());
            /*加个/,这样就不会前面加user了*/
        });
    })
</script>

<jsp:include page="footer.jsp"/>
