<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kirito
  Date: 2019/1/6
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<jsp:include page="header.jsp"/>
<div class="context">
    <div class="layui-row">
        <div class="layui-col-md2 layui-col-md-offset3"><%--style="margin-right: -100px"--%>
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-this"><a>个人信息</a></li>
                <li class="layui-nav-item"><a>修改密码</a></li>
                <li class="layui-nav-item"><a>修改头像</a></li>
                <li class="layui-nav-item"><a>绑定邮箱</a></li>
                <li class="layui-nav-item"><a>地址管理</a></li>
                <li class="layui-nav-item"><a href="<c:url value="/order/order_list"/>">我的订单</a></li>
                <%--这个直接跳转你的订单页--%>
                <li class="layui-nav-item"><a href="<c:url value="/shopcart"/>">我的购物车</a></li>
                <%--这个直接跳转你的购物车--%>
            </ul>
        </div>
        <div class="layui-col-md4 item-detail">
            <div class="layui-card">
                <div class="layui-card-header">
                    <img id="user_Img_1" src="<c:url value="/img/userImg/${user.image}"/> " height="45"
                         style="border-radius: 50%"
                         alt="">
                    个人信息
                </div>
                <div class="layui-card-body">
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" required lay-verify="required" value="${user.username}"
                                       autocomplete="off" readonly class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <c:if test="${user.gender==0}">
                                    <input type="radio" name="sex" value="男" title="男" checked>
                                    <input type="radio" name="sex" value="女" title="女" disabled>
                                </c:if>
                                <c:if test="${user.gender!=0}">
                                    <input type="radio" name="sex" value="男" title="男" disabled>
                                    <input type="radio" name="sex" value="女" title="女" checked>
                                </c:if>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" required lay-verify="required" value="${user.phone}"
                                       autocomplete="off" readonly class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" required lay-verify="required" value="${user.mail}"
                                       autocomplete="off" readonly class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">生日</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" required lay-verify="required" value="${user.birth}"
                                       autocomplete="off" readonly class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" required lay-verify="required"
                                       value="${address.name.replace(","," - ")}"
                                       autocomplete="off" readonly class="layui-input">
                            </div>
                        </div>


                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">个性签名</label>
                            <div class="layui-input-block">
                                <textarea name="desc" class="layui-textarea" readonly
                                          style="resize: none">对方还没看到这儿，所以没有签名~~</textarea>
                            </div>
                        </div>

                    </form>

                    <script>
                        //Demo
                        layui.use('form', function () {
                            var form = layui.form;

                            //监听提交
                            // form.on('submit(formDemo)', function (data) {
                            //     layer.msg(JSON.stringify(data.field));
                            //     return false;
                            // });
                        });
                    </script>


                    <script>
                        layui.use('form', function () {
                            var form = layui.form;

                            //各种基于事件的操作，下面会有进一步介绍
                        });
                    </script>

                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">修改密码</div>
                <div class="layui-card-body">
                    <%--这里写你的修改密码代码--%>
                    <form class="layui-form"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="oldPassword" placeholder="请输入旧密码" lay-verify="required"
                                       autocomplete="off"
                                       id="oldPassword" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">新密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="newPassword" placeholder="请输入新密码" lay-verify="required"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码确认</label>
                            <div class="layui-input-block">
                                <input type="password" name="newPasswordConfirm" lay-verify="required"
                                       placeholder="请再次输入新密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formDemo_changePassword">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>

                    </form>
                    <script>

                    </script>
                    <script>
                        //Demo
                        layui.use(['form', 'jquery'], function () {
                            var form = layui.form;
                            var $ = layui.$;
                            //监听提交
                            form.on('submit(formDemo_changePassword)', function (data) {
                                layer.msg(JSON.stringify(data.field));
                                $.post("/user/change_password", data.field, function (res) {
                                    if (res.code === 0) {
                                        alert(res.msg + "请重新登录~~");
                                        location.href = "/user/login";
                                    } else {
                                        layer.msg(res.msg)
                                    }
                                })
                                return false;
                            });
                        });
                    </script>
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">修改头像</div>
                <div class="layui-card-body">
                    <%--这里写你的修改头像代码--%>
                    <div class="layui-form-item">
                        <img id="userImg" src="<c:url value="/img/userImg/${user.image}"/>" height="100" alt="">
                    </div>

                    <div class="layui-form-item">
                        <button type="button" class="layui-btn" id="test1">
                            <i class="layui-icon">&#xe67c;</i>上传图片
                        </button>
                        <script>
                            layui.use(['upload', 'jquery'], function () {
                                var upload = layui.upload;
                                var $ = layui.$;
                                /**
                                 *这个要写上jQuery的引用，不然会报没有定义$
                                 */
                                    //执行实例
                                var uploadInst = upload.render({
                                        elem: '#test1' //绑定元素
                                        , url: '/user/change_userImg/' //上传接口
                                        , done: function (res) {
                                            //上传完毕回调
                                            layer.msg(res.msg);
                                            $("#userImg").attr("src", "/img/userImg/" + res.data);
                                            $("#user_Img_1").attr("src", "/img/userImg/" + res.data);
                                        }
                                        , error: function () {
                                            //请求异常回调
                                        }
                                    });
                            });
                        </script>
                    </div>

                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">绑定邮箱</div>
                <div class="layui-card-body">
                    <%--这里写你的绑定邮箱代码--%>
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-inline">
                                <%--<input type="text" name="mail" id="mail" required placeholder="请输入邮箱" lay-verify="email"--%>
                                <%--autocomplete="off" class="layui-input" > --%>

                                <input type="text" name="mail" id="mail" required value="${user.mail}"
                                       lay-verify="email"
                                       autocomplete="off" class="layui-input" readonly>

                            </div>
                            <div class="layui-input-inline">
                                <input type="button" class="layui-btn" id="find" value="发送验证码"/>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">验证码</label>
                            <div class="layui-input-block veri-code">
                                <div class="layui-input-inline">
                                    <input id="pnum" type="text" name="code" lay-verify="required"
                                           placeholder="请输入验证码"
                                           autocomplete="off" class="layui-input">

                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formDemoMail">立即绑定</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>

                    </form>

                    <script>
                        //Demo
                        layui.use(['form', 'jquery', 'element'], function () {
                            var form = layui.form;
                            var $ = layui.$;
                            var find = $("#find");

                            find.on("click", function () {
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
                            form.on('submit(formDemoMail)', function (data) {
                                // layer.msg(JSON.stringify(data.field));
                                $.post("/bindMail", data.field, function (data) {
                                    layer.msg(data.msg)
                                })
                                return false;
                            });
                        });
                    </script>
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">修改头像</div>
                <div class="layui-card-body">
                    <%--这里写你的地址管理代码--%>
                    <div class="layui-form-item">

                    </div>

                    <div class="layui-form-item">
                        <button type="button" class="layui-btn" id="test2">
                            <i class="layui-icon">&#xe67c;</i>上传图片
                        </button>
                        <script>
                            layui.use(['upload', 'jquery'], function () {
                                var upload = layui.upload;
                                var $ = layui.$;
                                /**
                                 *这个要写上jQuery的引用，不然会报没有定义$
                                 */
                                    //执行实例
                                var uploadInst = upload.render({
                                        elem: '#test1' //绑定元素
                                        , url: '/user/change_userImg/' //上传接口
                                        , done: function (res) {
                                            //上传完毕回调
                                            layer.msg(res.msg);
                                            $("#userImg").attr("src", "/img/userImg/" + res.data);
                                            $("#user_Img_1").attr("src", "/img/userImg/" + res.data);
                                        }
                                        , error: function () {
                                            //请求异常回调
                                        }
                                    });
                            });
                        </script>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<style>
    .item-detail .layui-card {
        display: none;
    }

    .context {
        background-color: whitesmoke;
        padding: 50px 0;
    }

    .layui-nav-tree .layui-nav-item a {
        color: #0C0C0C;
        text-align: center;
        height: 60px;
        line-height: 60px;
    }

    .layui-nav-tree .layui-nav-item a:hover {
        background-color: #009688;
    }

    .layui-nav-item.layui-this > a {
        color: white;
    }

    .layui-nav {
        background-color: white;
    }
</style>
<script>
    layui.use(['layer', 'element'], function () {
        const $ = layui.$;
        //默认开启第一个item详情
        const item = $('.item-detail .layui-card');
        item.eq(0).show();
        // 菜单标签遍历点击事件
        $('.layui-nav-item').each(function () {
            $(this).click(function () {
                //更改选中的样式
                $('.layui-nav-item').removeClass('layui-this'); //移除全部
                $(this).addClass('layui-this'); //再在选中的上面加上样式

                item.hide(); // 隐藏全部card详情页
                item.eq($(this).index()).show(); // 显示对应的card详情页
            });
        });
    })
</script>
<jsp:include page="footer.jsp"/>
