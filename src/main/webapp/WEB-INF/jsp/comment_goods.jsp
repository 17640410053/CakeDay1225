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
                           value="${goods.goods_id}" autocomplete="off"
                           class="layui-input" readonly>
                    <input id="imgName" type="hidden" name="img"
                           value="" readonly>

                    <input type="text" required lay-verify="required"
                           value="${goods.name}" autocomplete="off"
                           class="layui-input" readonly>


                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品</label>
                <div class="layui-input-block">
                    <img src="/cakeImg/${goods.img}" alt="" style="height: 100px;width: 100px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">描述相符</label>
                <div class="layui-input-block">
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <%--<a href=""><span style="margin-right: -100px;margin-top: -30px;float: right">添加收货地址</span></a>--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">物流服务</label>
                <div class="layui-input-block">
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <%--<a href=""><span style="margin-right: -100px;margin-top: -30px;float: right">添加收货地址</span></a>--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">服务态度</label>
                <div class="layui-input-block">
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <i class="layui-icon layui-icon-rate" style="font-size: 30px; color: #FF5722;"></i>
                    <%--<a href=""><span style="margin-right: -100px;margin-top: -30px;float: right">添加收货地址</span></a>--%>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">发表评论</label>
                <div class="layui-input-block">
                    <textarea name="content" placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>

            <%--  <div class="layui-form-item">
                  <label class="layui-form-label">几颗星</label>
                  <div class="layui-input-block">
                      <input type="text" required lay-verify="required"
                             name="star" placeholder="请输入几颗星" autocomplete="off"
                             class="layui-input">
                  </div>
              </div>--%>
            <div class="layui-form-item">
                <label class="layui-form-label">几颗星</label>
                <div class="layui-input-block">
                    <input type="radio" name="star" value="1" title="一颗星">
                    <input type="radio" name="star" value="2" title="两颗星">
                    <input type="radio" name="star" value="3" title="三颗星">
                    <input type="radio" name="star" value="4" title="四颗星">
                    <input type="radio" name="star" value="5" title="五颗星" checked>
                </div>
            </div>

            <%--</form>--%>

            <button class="layui-btn test" lay-data="{url: '/upload/'}">上传图片</button>
            <button class="layui-btn test" lay-data="{url: '/upload/', accept: 'file'}">上传文件</button>

            <button type="button" class="layui-btn" id="test1">
                <i class="layui-icon">&#xe67c;</i>上传图片
            </button>

            <button onclick="location.replace(document.referrer)" type="button" class="layui-btn layui-btn-primary">
                &nbsp;返回 &nbsp;
            </button>
            <%--<button type="button" class="layui-btn layui-btn-normal" id="sele_imgs">选择文件</button>--%>
            <%--<button type="button" class="layui-btn" id="upload_imgs" disabled>开始上传</button>--%>

            <%--<button type="button" class="layui-btn layui-btn-danger" id="dele_imgs">删除选中图片</button>--%>
            <script>
                layui.use('upload', function () {
                    var upload = layui.upload;

                    //执行实例
                    var uploadInst = upload.render({
                        elem: '#test1' //绑定元素
                        , url: '/upload/' //上传接口
                        , done: function (res) {
                            //上传完毕回调
                            alert(res.msg)
                        }
                        , error: function () {
                            // alert(res.msg)
                            //请求异常回调
                        }
                    });

                    upload.render({
                        elem: '.test'
                        , done: function (res, index, upload) {
                            //获取当前触发上传的元素，一般用于 elem 绑定 class 的情况，注意：此乃 layui 2.1.0 新增
                            var item = this.item;
                        }
                    })
                });
            </script>


            <div class="layui-upload ">

                <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                    预览图：
                    <div class="layui-upload-list" id="imgs">
                    </div>
                </blockquote>
                <%--   <div class="mark_button">
                       <button type="button" class="layui-btn layui-btn-normal" id="sele_imgs">选择文件</button>
                       <button type="button" class="layui-btn" id="upload_imgs" disabled>开始上传</button>

                       <button type="button" class="layui-btn layui-btn-danger" id="dele_imgs">删除选中图片</button>
                   </div>--%>

            </div>
            <button type="button" class="layui-btn layui-btn-normal" id="sele_imgs">选择文件</button>
            <button type="button" class="layui-btn" id="upload_imgs" disabled>开始上传</button>

            <button type="button" class="layui-btn layui-btn-danger" id="dele_imgs">删除选中图片</button>
            <script id="img_template" type="text/html">
                <div class="upload-img" filename="{{ d.index }}">
                    <input type="checkbox" name="" lay-skin="primary">
                    <img src="{{  d.result }}" alt="{{ d.name }}" class="layui-upload-img">
                </div>
            </script>
            <br>
            <br>
            <br>
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>

        </form>
        <script>
            var filename = "";
            // ajax里面，filename = filename + 你返回的名字 + ","
            layui.use(['upload', 'laytpl', 'form'], function () {
                var $ = layui.jquery
                    , upload = layui.upload
                    , laytpl = layui.laytpl
                    , form = layui.form;

                //批量删除 单击事件
                $('#dele_imgs').click(function () {
                    $('input:checked').each(function (index, value) {
                        var filename = $(this).parent().attr("filename");
                        delete imgFiles[filename];
                        $(this).parent().remove()
                    });
                });


                var imgFiles;

                //多图片上传
                var uploadInst = upload.render({
                    elem: '#sele_imgs'  //开始
                    , acceptMime: 'image/*'
                    , url: '/fileUploadFiles/'
                    , auto: false
                    , bindAction: '#upload_imgs'
                    , multiple: true
                    , size: 1024 * 12
                    , data: {goods_id:${goods.goods_id}}
                    , choose: function (obj) {  //选择图片后事件
                        var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                        imgFiles = files;

                        $('#upload_imgs').prop('disabled', false);

                        //预读本地文件示例，不支持ie8
                        obj.preview(function (index, file, result) {
                            var data = {
                                index: index,
                                name: file.name,
                                result: result
                            };

                            //将预览html 追加
                            laytpl(img_template.innerHTML).render(data, function (html) {
                                $('#imgs').append(html);
                            });

                            //绑定单击事件
                            $('#imgs div:last-child>img').click(function () {
                                var isChecked = $(this).siblings("input").prop("checked");
                                $(this).siblings("input").prop("checked", !isChecked);
                                return false;
                            });

                        });
                    }
                    , before: function (obj) { //上传前回函数
                        layer.load(); //上传loading
                    }
                    , done: function (res, index, upload) {    //上传完毕后事件

                        layer.closeAll('loading'); //关闭loading
                        //上传完毕

                        $('#imgs').html("");//清空操作

                        // top.layer.msg("上传成功！");

                        filename = filename + res.data + ",";

                        $('#imgName').val(filename);
                        // alert(res.data);
                        top.layer.msg(res.msg);


                        return delete imgFiles[index]; //删除文件队列已经上传成功的文件

                    }
                    , error: function (index, upload) {

                        layer.closeAll('loading'); //关闭loading
                        top.layer.msg("上传失败！");


                    }
                });

            });
        </script>
        <script>

            //Demo
            layui.use('form', function () {
                var form = layui.form;
                form.render();
                //监听提交
                form.on('submit(formDemo)', function (data) {
                    $.post('/submit_comment', data.field, function (msg) {
                        if (msg.code === 0) {
                            layer.msg(msg.msg);
                            /**
                             * 在这儿写成功登陆的话去主页
                             * */
                            location.href = "/test_success?comm_id=" + msg.data;
                        } else {
                            layer.msg(msg.msg);
                        }
                    });

                    layer.msg(JSON.stringify(data.field));
                    return false;
                });


            });
        </script>


        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">

              
            <legend>图片信息</legend>

        </fieldset>
         
         
        <div class="layui-upload">
             
            <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button>
             
             
            <div class="layui-upload-list">
                   
                <table class="layui-table">
                         
                    <thead>
                           
                    <tr>
                        <th>文件名</th>
                               
                        <th>大小</th>
                               
                        <th>状态</th>
                               
                        <th>操作</th>
                             
                    </tr>
                    </thead>
                         
                    <tbody id="demoList"></tbody>
                       
                </table>
                 
            </div>
             
            <button type="button" class="layui-btn" id="testListAction">开始上传</button>
             
            <button type="button" class="layui-btn" id="back">返回</button>
        </div>

        <script>

            layui.use('upload', function () {
                var $ = layui.jquery
                    , upload = layui.upload;
                // var id = $("#agendaId").val();
                //多文件列表示例
                var demoListView = $('#demoList')
                    , uploadListIns = upload.render({
                    elem: '#testList'
                    , url: '/fileUploadFiles/'
                    , accept: 'file'
                    , data: {}   //可放扩展数据  key-value
                    , multiple: true
                    , auto: false
                    , bindAction: '#testListAction'
                    , choose: function (obj) {
                        var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                        //读取本地文件
                        obj.preview(function (index, file, result) {
                            var tr = $(['<tr id="upload-' + index + '">'
                                , '<td>' + file.name + '</td>'
                                , '<td>' + (file.size / 1014).toFixed(1) + 'kb</td>'
                                , '<td>等待上传</td>'
                                , '<td>'
                                , '<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
                                , '<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
                                , '</td>'
                                , '</tr>'].join(''));

                            //单个重传
                            tr.find('.demo-reload').on('click', function () {
                                obj.upload(index, file);
                            });

                            //删除
                            tr.find('.demo-delete').on('click', function () {
                                delete files[index]; //删除对应的文件
                                tr.remove();
                                uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                            });

                            demoListView.append(tr);
                        });
                    }
                    , done: function (res, index, upload) {
                        if (res.code === 0) {
                            alert(res.data);
                        } //上传成功
                        var tr = demoListView.find('tr#upload-' + index)
                            , tds = tr.children();
                        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                        tds.eq(3).html(''); //清空操作
                        return delete this.files[index]; //删除文件队列已经上传成功的文件

                    } //code为后台传回来的数据，具体多少自己定，

                    //后台只能传回json格式数据，不然会走error函数；

                    , error: function (index, upload) {

                    }
                });
            })
        </script>


    </div>

</div>
<script type="text/javascript">
    layui.config({
        base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'jquery', 'element', 'car'], function () {
        var mm = layui.mm, $ = layui.$, element = layui.element, car = layui.car;


    })
    ;

</script>
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<%--<script>
    /**
     *
     * @param id
     * @param price 价格
     * @param goodsNum 商品数量：用于来判断是否还剩一个之后
     * @param num   用于复用的符号：1+, 2-, 3移除
     * */
    function addCart(id, price, goodsNum, num) {
        //那你在这里提醒就好了，这就好了，还有，那就分开写，你在哪判断的，等于2是啥，减，后面还有一个参数是用于最后一个移除返回的操作提示
        //返回json的时候500了，没有返回数据，肯定不执行啊
        //这个总价还要处理下
        switch (num) {
            case 1:
                $.post("/addGoodsToCart", {goods_id: id, money: price, num: num}, function (data) {
                    if (num === 1 && data.code === 1010) {
                        $('.Quantity-input').val(10)
                        layer.alert(data.msg);
                    }
                });
                break;
            case 2:
                $.post("/addGoodsToCart", {goods_id: id, money: price, num: num}, function (data) {
                    if (num === 2 && data.code === 101) {
                        if (data.count === 0) {
                            $('.pieces-total').html("￥0.00");
                        } else {
                            $('.pieces-total').html(data.count)
                        }
                        if (data.data === 0) {
                            $('.Selected-pieces').html("0");
                        } else {
                            $('.Selected-pieces').html(data.data);
                        }
                        $('#cart-list-' + id).remove();
                    } else {
                        layer.alert(data.msg);
                    }
                });
                break;
            case 3:
                if (confirm("确认要删除吗?")) {
                    $.post("/addGoodsToCart", {goods_id: id, money: price, num: num}, function (data) {
                        if (data.code === 0) {
                            if (data.count === 0) {
                                $('.pieces-total').html("￥0.00");

                            } else {
                                $('.pieces-total').html(data.count)
                            }
                            if (data.data === 0) {
                                $('.Selected-pieces').html("0");
                            } else {
                                $('.Selected-pieces').html(data.data);
                            }
                            $('#cart-list-' + id).remove();
                        } else {
                            layer.alert(data.msg);
                        }
                    });
                }


                /*  layer.confirm('你确定要删除吗', {
                      yes: function (index, layero) {
                          layer.close(index);
                          $.post("/addGoodsToCart", {goods_id: id, money: price, num: num}, function (data) {
                              layer.alert(data.msg);
                              $('#cart-list-' + id).remove();
                          })
                      }
                  });*/
                break;
        }
    }

    /*提示信息还没出现就删了
    **/
    /* function deleteAllGoods() {
         $.post("/deleteAllGoods", {}, function (data) {
             layer.alert(data.msg)
         })
     }*/

    function goOrder() {

    }

</script>--%>

<jsp:include page="footer.jsp"/>