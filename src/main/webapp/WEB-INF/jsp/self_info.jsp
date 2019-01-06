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
        <div class="layui-col-md2 layui-col-md-offset3">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-this"><a>个人信息</a></li>
                <li class="layui-nav-item"><a>修改密码</a></li>
                <li class="layui-nav-item"><a>修改头像</a></li>
                <li class="layui-nav-item"><a>绑定邮箱</a></li>
                <li class="layui-nav-item"><a href="">我的订单</a></li>
                <%--这个直接跳转你的订单页--%>
                <li class="layui-nav-item"><a href="">我的购物车</a></li>
                <%--这个直接跳转你的购物车--%>
            </ul>
        </div>
        <div class="layui-col-md4 item-detail">
            <div class="layui-card">
                <div class="layui-card-header">
                    <img src="<c:url value="/img/userImg/${user.image}"/> " height="45" style="border-radius: 50%"
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
                                    <input type="radio" name="sex" value="女" title="女">
                                </c:if>
                                <c:if test="${user.gender!=0}">
                                    <input type="radio" name="sex" value="男" title="男">
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
                                <input type="text" name="title" required lay-verify="required" value="${address.name}"
                                       autocomplete="off" readonly class="layui-input">
                            </div>
                        </div>


                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">个性签名</label>
                            <div class="layui-input-block">
                                <textarea name="desc" placeholder="请输入内容" class="layui-textarea"
                                          style="resize: none"></textarea>
                            </div>
                        </div>

                    </form>

                    <script>
                        //Demo
                        layui.use('form', function () {
                            var form = layui.form;

                            //监听提交
                            form.on('submit(formDemo)', function (data) {
                                layer.msg(JSON.stringify(data.field));
                                return false;
                            });
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
                            <label class="layui-form-label">输入框</label>
                            <div class="layui-input-block">
                                <input type="text" name="" placeholder="请输入" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">下拉选择框</label>
                            <div class="layui-input-block">
                                <select name="interest" lay-filter="aihao">
                                    <option value="0">写作</option>
                                    <option value="1">阅读</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">复选框</label>
                            <div class="layui-input-block">
                                <input type="checkbox" name="like[write]" title="写作">
                                <input type="checkbox" name="like[read]" title="阅读">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">开关关</label>
                            <div class="layui-input-block">
                                <input type="checkbox" lay-skin="switch">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">开关开</label>
                            <div class="layui-input-block">
                                <input type="checkbox" checked lay-skin="switch">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">单选框</label>
                            <div class="layui-input-block">
                                <input type="radio" name="sex" value="0" title="男">
                                <input type="radio" name="sex" value="1" title="女" checked>
                            </div>
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">请填写描述</label>
                            <div class="layui-input-block">
                                <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">修改头像</div>
                <div class="layui-card-body">
                    这里写你的修改头像代码
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">绑定邮箱</div>
                <div class="layui-card-body">
                    这里写你的绑定邮箱代码
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
