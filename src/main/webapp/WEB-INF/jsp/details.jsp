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
<style>
    .test {
        line-height: 42px;
        width: 100px;
        text-align: center;
        font-size: 18px;
        cursor: pointer;
        color: #888888;
    }

    .test3 {
        margin-top: -9px;
    }

    .test2 {
        height: 2402px;
        width: 800px;
    }
</style>

<div class="content content-nav-base datails-content">
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
    <div class="data-cont-wrap w1200">
        <div class="crumb">
            <a href="javascript:;">首页</a>
            <span>></span>
            <a href="javascript:;">所有商品</a>
            <span>></span>
            <a href="javascript:;">产品详情</a>
        </div>
        <div class="product-intro layui-clear">
            <div class="preview-wrap">
                <a href="<c:url value="/details?goods_id=${goods.goods_id}"/>"><img
                        src="<c:url value="/cakeImg/${goods.img}"/>"
                        style="height: 402px;width: 402px"></a>
            </div>
            <div class="itemInfo-wrap">
                <div class="itemInfo">
                    <div class="title">
                        <h4>${goods.name}</h4>
                        <span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
                    </div>
                    <div class="summary">
                        <p class="reference"><span>参考价</span>
                            <del>￥299.00</del>
                        </p>
                        <p class="activity"><span>活动价</span><strong class="price"><i>￥</i>${goods.price}</strong></p>
                        <p class="address-box"><span>送&nbsp;&nbsp;&nbsp;&nbsp;至</span><strong
                                class="address">
                            <c:if test="${address==null}">
                                江西&nbsp;&nbsp;南昌&nbsp;&nbsp;东湖区
                            </c:if>
                            <c:if test="${address!=null}">
                                ${address.name.split(",")[0]}&nbsp;&nbsp;${address.name.split(",")[1]}&nbsp;&nbsp;${address.name.split(",")[2]}
                            </c:if>
                        </strong>
                        </p>
                    </div>
                    <div class="choose-attrs">
                        <div class="color layui-clear"><span class="title">颜&nbsp;&nbsp;&nbsp;&nbsp;色</span>
                            <div class="color-cont"><span class="btn">白色</span> <span class="btn active">粉丝</span></div>
                        </div>
                        <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span>
                            <div class="number-cont"><span class="cut btn">-</span><input
                                    onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                    maxlength="4" type="" name="" value="1"><span class="add btn">+</span></div>
                        </div>
                    </div>
                    <div class="choose-btns">
                        <a href="<c:url value="/ordertable?goods_id=${goods.goods_id}"/>">
                            <button class="layui-btn layui-btn-primary purchase-btn">立刻购买</button>
                        </a>
                        <button class="layui-btn  layui-btn-danger car-btn"><i
                                class="layui-icon layui-icon-cart-simple"></i>加入购物车
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-clear">
            <div class="aside">
                <h4>热销推荐</h4>
                <div class="item-list">
                    <c:forEach items="${byStar}" var="star" begin="0" end="5">
                        <div class="item">
                            <a href="<c:url value="/details?goods_id=${star.goods_id}"/>">
                                <img src="<c:url value="/cakeImg/${star.img}"/>"
                                     style="width: 280px;height: 280px;">
                                <p><span>${star.name}</span><span class="pric">￥${star.price}</span></p></a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="detail test3">



                <div class="layui-tab">
                    <ul class="layui-tab-title">
                        <li class="layui-this test"><h4 style="border-bottom: none">详情</h4></li>
                        <li class="test"><h4 style="border-bottom: none">用户评价</h4></li>
                        <li class="test"><h4 style="border-bottom: none">占位中</h4></li>
                    </ul>
                    <div class="layui-tab-content item" style="border-top:none;">
                        <div class="layui-tab-item layui-show">
                            <div class="item test2">
                                <img src="<c:url value="/cakeImg/pc1.jpg"/>" style="height: 1878px;width: 800px;"
                                     alt="">
                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div class="item test2">
                                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                                    <ul class="layui-tab-title">
                                        <li class="layui-this">全部评论</li>
                                        <li>好评</li>
                                        <li>中评</li>
                                        <li>差评</li>
                                        <li>晒图</li>
                                    </ul>
                                    <div class="layui-tab-content">

                                        <div class="layui-tab-item layui-show">
                                            <c:forEach items="${commentVoList}" var="commentVo">
                                                <div class="layui-row layui-col-space10"
                                                     style="margin-top: 10px;border-bottom: 1px solid #ddd;;">
                                                    <div class="layui-col-md2">
                                                        <p style="text-align: center">
                                                            <img src="<c:url value="/img/userImg/${commentVo.users.image}"/>"
                                                                 width="50"
                                                                 alt=""
                                                                 style="border-radius: 50%"></p>
                                                        <p style="text-align: center;margin-top: 10px">${commentVo.users.username}</p>
                                                    </div>
                                                    <div class="layui-col-md7">
                                                        <p class="comment-img">
                                                            <c:forEach items="${commentVo.img}" var="commImg">
                                                                <img src="<c:url value="/upload/${commImg}"/>"
                                                                     height="60"
                                                                     alt="" style="margin-left: 10px">
                                                            </c:forEach>
                                                        </p>
                                                        <div style="height: 100%;margin-top: 15px">人生就像是一场修行
                                                            <p>${commentVo.content}</p>
                                                        </div>
                                                    </div>
                                                    <div class="layui-col-md3">
                                                        <span style="font-size:12px;color: #999 ">${commentVo.createTime}</span>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                        <div class="layui-tab-item">

                                            <c:forEach items="${goodCommentVoList}" var="commentVo">
                                                <div class="layui-row layui-col-space10"
                                                     style="margin-top: 10px;border-bottom: 1px solid #ddd;;">
                                                    <div class="layui-col-md2">
                                                        <p style="text-align: center">

                                                            <img src="<c:url value="/img/userImg/${commentVo.users.image}"/>"
                                                                 width="50"
                                                                 alt=""
                                                                 style="border-radius: 50%"></p>
                                                        <p style="text-align: center;margin-top: 10px">${commentVo.users.username}</p>
                                                    </div>
                                                    <div class="layui-col-md7">
                                                        <p class="comment-img">
                                                            <c:forEach items="${commentVo.img}" var="commImg">
                                                                <img src="<c:url value="/upload/${commImg}"/>"
                                                                     height="60"
                                                                     alt="" style="margin-left: 10px">
                                                            </c:forEach>
                                                        </p>
                                                        <div style="height: 100%;margin-top: 15px">人生就像是一场修行
                                                            <p>${commentVo.content}</p>
                                                        </div>
                                                    </div>
                                                    <div class="layui-col-md3">
                                                        <span style="font-size:12px;color: #999 ">${commentVo.createTime}</span>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                        <div class="layui-tab-item">
                                            <c:forEach items="${midCommentVoList}" var="commentVo">
                                                <div class="layui-row layui-col-space10"
                                                     style="margin-top: 10px;border-bottom: 1px solid #ddd;;">
                                                    <div class="layui-col-md2">
                                                        <p style="text-align: center"><img
                                                                src="<c:url value="/img/userImg/${commentVo.users.image}"/>"
                                                                width="50"
                                                                alt=""
                                                                style="border-radius: 50%"></p>
                                                        <p style="text-align: center;margin-top: 10px">${commentVo.users.username}</p>
                                                    </div>
                                                    <div class="layui-col-md7">
                                                        <p class="comment-img">
                                                            <c:forEach items="${commentVo.img}" var="commImg">
                                                                <img src="<c:url value="/upload/${commImg}"/>"
                                                                     height="60"
                                                                     alt="" style="margin-left: 10px">
                                                            </c:forEach>
                                                        </p>
                                                        <div style="height: 100%;margin-top: 15px">人生就像是一场修行
                                                            <p>${commentVo.content}</p>
                                                        </div>
                                                    </div>
                                                    <div class="layui-col-md3">
                                                        <span style="font-size:12px;color: #999 ">${commentVo.createTime}</span>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="layui-tab-item">
                                            <c:forEach items="${badCommentVoList}" var="commentVo">
                                                <div class="layui-row layui-col-space10"
                                                     style="margin-top: 10px;border-bottom: 1px solid #ddd;;">
                                                    <div class="layui-col-md2">
                                                        <p style="text-align: center"><img
                                                                src="<c:url value="/img/userImg/${commentVo.users.image}"/>"
                                                                width="50"
                                                                alt=""
                                                                style="border-radius: 50%"></p>
                                                        <p style="text-align: center;margin-top: 10px">${commentVo.users.username}</p>
                                                    </div>
                                                    <div class="layui-col-md7">
                                                        <p class="comment-img">
                                                            <c:forEach items="${commentVo.img}" var="commImg">
                                                                <img src="<c:url value="/upload/${commImg}"/>"
                                                                     height="60"
                                                                     alt="" style="margin-left: 10px">
                                                            </c:forEach>
                                                        </p>
                                                        <div style="height: 100%;margin-top: 15px">人生就像是一场修行
                                                            <p>${commentVo.content}</p>
                                                        </div>
                                                    </div>
                                                    <div class="layui-col-md3">
                                                        <span style="font-size:12px;color: #999 ">${commentVo.createTime}</span>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="layui-tab-item">
                                            <c:forEach items="${imgCommentVoList}"
                                                       var="commentVo">
                                                <div class="layui-row layui-col-space10"
                                                     style="margin-top: 10px;border-bottom: 1px solid #ddd;;">
                                                    <div class="layui-col-md2">
                                                        <p style="text-align: center"><img
                                                                src="<c:url value="/img/userImg/${commentVo.users.image}"/>"
                                                                width="50"
                                                                alt=""
                                                                style="border-radius: 50%"></p>
                                                        <p style="text-align: center;margin-top: 10px">${commentVo.users.username}</p>
                                                    </div>
                                                    <div class="layui-col-md7">
                                                        <p class="comment-img">
                                                            <c:forEach items="${commentVo.img}" var="commImg">
                                                                <img src="<c:url value="/upload/${commImg}"/>"
                                                                     height="60"
                                                                     alt="" style="margin-left: 10px">
                                                            </c:forEach>
                                                        </p>
                                                        <div style="height: 100%;margin-top: 15px">人生就像是一场修行
                                                            <p>${commentVo.content}</p>
                                                        </div>
                                                    </div>
                                                    <div class="layui-col-md3">
                                                        <span style="font-size:12px;color: #999 ">${commentVo.createTime}</span>
                                                    </div>
                                                </div>
                                            </c:forEach></div>
                                    </div>
                                </div>
                                <script>
                                    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
                                    layui.use('element', function () {
                                        var element = layui.element;

                                        //…
                                    });
                                </script>

                            </div>
                        </div>
                        <div class="layui-tab-item">
                            <div class="item test2">
                                3
                            </div>
                        </div>

                    </div>
                </div>

            </div>


        </div>
    </div>
</div>
<%--<script type="text/javascript" src="<c:url value="/res/layui/layui.all.js"/>"></script>--%>
<%--注意用element元素就可以把上面的all.js省略--%>
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script type="text/javascript">
    layui.config({
        base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录 这是一个入口，下面有一个入口，可能layer冲突
    }).use(['mm', 'jquery', 'layer', 'element'], function () {
        var mm = layui.mm,
            $ = layui.$;
        var cur = $('.number-cont input').val();
        $('.number-cont .btn').on('click', function () {
            if ($(this).hasClass('add')) {
                cur++;
            } else {
                if (cur > 1) {
                    cur--;
                }
            }
            $('.number-cont input').val(cur)
        });
        $('.car-btn').click(function () {
            layer.alert("啦啦啦");
        }, function () {
            $.post("/addCart", {goods_id:${goods.goods_id}, money:${goods.price}}, function (data) {
                // layer.alert("啦啦啦");
                layer.msg(data.msg);
            })
        });
        /**
         * 点击图片加载大图功能
         */
        $('.comment-img > img').each(function () {
            $(this).click(function () {
                var url = $(this).attr('src'), height, width;
                // 这个的意思是，在内存地址里面创建一个<img>元素,就是在内存地址里面创建的，只不过不在页面显示而已
                $("<img/>").attr("src", url).load(function () {
                    height = this.height;
                    width = this.width;
                    layer.open({
                        type: 2,
                        content: url,
                        area: [width + "px", height + 42.99 + "px"]
                    });
                });
                // layer.open({
                //     type: 2,
                //     content: '/img_show?url=' + url,
                //     area: ["600px", "600px"]
                // });
            });
        });

        function getImgArea(url) {
            var img = new Image();
            img.src = url;
            ;//每次都重新加载，不要缓存呢，这不是我要缓存，缓存是浏览器的机制，除非把浏览器缓存关了，但是你不能保证用户的浏览器缓存都是关闭的，嘿嘿
            // 如果图片被缓存，则直接返回缓存数据
            if (img.complete) {
                return {width: img.width, height: img.height}
            } else {
                // 完全加载完毕的事件
                img.onload = function () {
                    return {width: img.width, height: img.height}
                }
            }
        }
    });
</script>
<script>
    // layui.use(['element', 'layer'], function () {
    //     var element = layui.element, $ = layui.$, layer = layui.layer;
    //     $(".car-btn").click(function () {
    //         console.log(123);
    //         layer.msg('酷毙了');//是哪个按钮
    //     })
    // });
    /*   $(function () {

       })*/
</script>



<jsp:include page="footer.jsp"/>
