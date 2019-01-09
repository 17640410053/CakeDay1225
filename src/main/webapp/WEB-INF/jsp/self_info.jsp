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
            <div class="layui-card" style="width: 800px;">
                <div class="layui-card-header">地址管理</div>
                <div class="layui-card-body">
                    <%--这里写你的地址管理代码--%>

                    <table class="layui-table"
                           lay-data="{height:315, url:'/address/findAllAddressByUserId/', page:true, id:'test'}"
                           lay-filter="test">
                        <thead>
                        <tr>
                            <th lay-data="{field:'address_id', width:80, sort: true}">ID</th>
                            <th lay-data="{field:'name', width:80}">用户名</th>
                            <th lay-data="{field:'username', width:80, sort: true}">性别</th>
                            <th lay-data="{field:'city'}">城市</th>
                            <th lay-data="{field:'sign'}">签名</th>
                            <th lay-data="{field:'experience', sort: true}">积分</th>
                            <th lay-data="{field:'score', sort: true}">评分</th>
                            <th lay-data="{field:'classify'}">职业</th>
                            <th lay-data="{field:'wealth', sort: true}">财富</th>
                        </tr>
                        </thead>
                    </table>
                    <table class="layui-table">
                        <colgroup>
                            <col width="150">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>联系人</th>
                            <th>手机号</th>
                            <th>地址</th>
                        </tr>
                        </thead>
                        <tbody id="tBody">
                        <c:forEach items="${addressList}" var="a">
                            <tr>
                                <td>${a.username}</td>
                                <td>${a.phone}</td>
                                <td>${a.name}</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    <br>
                    <p>地址添加</p>
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">联系人</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" required lay-verify="required" placeholder="请输入联系人"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-block">
                                <input type="text" name="phone" required lay-verify="phone" placeholder="请输入手机号"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <%--
                        bilibili丶教主 2019/1/9 15:48:41
                        思路是这样的，先查省，然后他选了省，你就有了省的id，触发一个change方法，
                        调用ajax去查市，然后选市触发一个change方法，你就有了市的id，
                        调用ajax方法去查县，然后他选县
                        最好的就是，市县的选择框县hidden，然后选了省，加载完成后，才显示市的选择框，
                        这样就不会造成加载慢空数据的情况

                        select * from tp_tree where pid = id（前台给的省id） 查市
                        select * from tp_tree where pid = id（前台给的市id） 查县
                        select * from tp_tree where type = 1 查省
                        --%>
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-inline">
                                <select name="province" lay-filter="test1" id="province" lay-verify="required">
                                    <option value="">请选择省份</option>
                                    <%--         <option value="1">上海</option>
                                             <option value="2">江苏</option>
                                             <option value="3">湖南</option>
                                             <option value="4">四川</option>--%>
                                </select>
                            </div>
                            <div class="layui-input-inline" id="city1" style="display: none">
                                <select name="city" id="city" lay-filter="test2" lay-verify="required">
                                    <option value="">请选择城市</option>
                                </select>
                            </div>
                            <div class="layui-input-inline" id="country1" style="display: none">
                                <select name="country" lay-verify="required"> <%--你这没有id，怎么能用id选择器呢--%>
                                    <option value="">请选择县/城镇</option>
                                </select>
                            </div>
                            <%--<div class="layui-input-block">--%>
                            <%--<textarea name="name" placeholder="请输入地址" required class="layui-textarea"></textarea>--%>
                            <%--</div>--%>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formDemoAddress">立即添加</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>

                    <script>
                        //Demo
                        layui.use(['form', 'jquery', 'table'], function () {
                            var form = layui.form;
                            var $ = layui.$;
                            var table = layui.table;
                            var provinceItem, cityItem, countryItem;

                            $.post('/address/findProvince', function (msg) {
                                var provinceList = $("[name='province']"), item = "";
                                //首先拿到值首先要做的是清空，不然以前的数据都还在，这里，我们用html直接替换掉
                                console.log(msg.data);
                                //这里拿到数据，赋值给全局的变量
                                //从这里开始完全都是jq，跟ajax没有任何关系
                                if (msg.data !== null) { //如果传入的数据不是空的就进行渲染
                                    provinceItem = msg.data;
                                    item += "<option value=\"\">请选择省份</option>"; //先添加一条基本的
                                    //然后循环遍历,city是msg.data里面的就是相当于foreach的var吗?------对呢
                                    $.each(msg.data, function (index, province) { //这里我用each循环，msg.data是你的list，index是第几个，city是你的对象
                                        item += "<option value=\"" + province.id + "\">" + province.name + "</option>"; //继续拼接就好了
                                    });
                                    //--那个传到后台的数据要是string哟，因为你数据库存的是地址，不是外键哦
                                    //--也就是说要用cityname来传值
                                    //--差不多哟
                                    // bilibili丶教主 2019/1/9 17:33:29
                                    //而且要把他拼成一串
                                    // 循环完了就渲染
                                    provinceList.html(item);
                                }
                                //layui的select还必须由layui自己重新加载一次，这是layui特有的
                                form.render('select'); //刷新select选择框渲染
                            });

                            form.on('select(test1)', function (data) {

                                $('#city1').hide();
                                $('#country1').hide();
                                console.log(data);
                                console.log(data.elem); //得到select原始DOM对象
                                console.log(data.value); //得到被选中的值
                                console.log(data.othis); //得到美化后的DOM对象

                                // $.ajax({
                                //     url: "/address/findCity",
                                //     dataType: "json",
                                //     data: {pid: data.value},
                                //     success: function () {
                                //
                                //     }
                                // });

                                $.post("/address/findCityOrCountry", {pid: data.value}, function (msg) {
                                    var cityList = $('#city'), item = "";
                                    //首先拿到值首先要做的是清空，不然以前的数据都还在，这里，我们用html直接替换掉
                                    console.log(msg.data);
                                    //这里拿到数据，赋值给全局的变量
                                    cityItem = msg.data;
                                    //从这里开始完全都是jq，跟ajax没有任何关系
                                    if (msg.data !== null) { //如果传入的数据不是空的就进行渲染
                                        item += "<option value=\"\">请选择城市</option>"; //先添加一条基本的
                                        //然后循环遍历,city是msg.data里面的就是相当于foreach的var吗?------对呢
                                        $.each(msg.data, function (index, city) { //这里我用each循环，msg.data是你的list，index是第几个，city是你的对象
                                            item += "<option value=\"" + city.id + "\">" + city.name + "</option>"; //继续拼接就好了
                                        });
                                        //--那个传到后台的数据要是string哟，因为你数据库存的是地址，不是外键哦
                                        //--也就是说要用cityname来传值
                                        //--差不多哟
                                        // bilibili丶教主 2019/1/9 17:33:29
                                        //而且要把他拼成一串
                                        // 循环完了就渲染
                                        cityList.html(item);
                                    }
                                    //layui的select还必须由layui自己重新加载一次，这是layui特有的
                                    form.render('select'); //刷新select选择框渲染
                                    $('#city1').show();//你知道怎么去除那个隐藏的属性吗 --直接.show吖
                                    //.hidden是隐藏
                                    // $('#country1').css("display","none");

                                })
                            });

                            //有bug的，怎么改
                            form.on('select(test2)', function (data) {
                                console.log(data.value);
                                $.post("/address/findCityOrCountry", {pid: data.value}, function (msg) {
                                    var countryList = $("[name = 'country']"), item = "";
                                    if (msg.data !== null) {
                                        countryItem = msg.data;
                                        item += "<option value=\"\">请选择县/城镇</option>";

                                        $.each(msg.data, function (index, country) {
                                            item += "<option value=\"" + country.id + "\">" + country.name + "</option>";
                                        });
                                        countryList.html(item);
                                    }
                                    form.render("select");
                                    $("#country1").show();


                                })
                            });


                            //监听提交
                            form.on('submit(formDemoAddress)', function (data) {
                                //你想一下怎么取拿值，就是string类型的
                                //拿不到，我们就想其他办法，又不是只有这一个方法
                                //首先你前台是有数据的，不过是局部的，那么我改成全局的不就好了
                                // console.log(data.field); //有id去遍历找
                                // console.log(countryItem);
                                var provinceName = "";
                                $.each(provinceItem, function (index, province) {
                                    if (province.id == data.field['province']) {
                                        provinceName += province.name;
                                    }
                                });
                                var cityName = "";
                                $.each(cityItem, function (index, city) {
                                    if (city.id == data.field['city']) {
                                        //用表单里面的数据id去与获得的cityList比较
                                        /*{username: "123", phone: "13342235110", province: "3", city: "38", country: "417"}
                                           city: "38"
                                           country: "417"
                                           phone: "13342235110"
                                           province: "3"
                                           username: "123"
                                          */
                                        cityName += city.name;
                                    }
                                });
                                var countryName = "";
                                $.each(countryItem, function (index, country) {
                                    if (country.id == data.field['country']) {
                                        countryName += country.name;
                                    }
                                });
                                var address = provinceName + "-" + cityName + "-" + countryName;
                                console.log(address);
                                data.field['name'] = address;
                                //ajax请求
                                $.post("/address/addAddress", data.field, function (res) {
                                    layer.msg(res.msg);
                                    table.reload();
                                })
                                return false;
                            });
                        });
                    </script>

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
