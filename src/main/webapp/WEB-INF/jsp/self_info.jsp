<%--
  Created by IntelliJ IDEA.
  User: Kirito
  Date: 2019/1/6
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <div class="layui-card-header">个人信息</div>
                <div class="layui-card-body">
                    这里写你的个人信息的代码
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">修改密码</div>
                <div class="layui-card-body">
                    这里写你的修改密码代码
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
