<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/27
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="header.jsp" %>
<div class="content content-nav-base commodity-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="<c:url value="/commodity"/>" class="active">所有商品</a>
                    <a href="buytoday.html">今日团购</a>
                    <a href="information.html">母婴资讯</a>
                    <a href="about.html">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="commod-cont-wrap">
        <div class="commod-cont w1200 layui-clear">
            <div class="left-nav">
                <div class="title">所有分类</div>
                <div class="list-box">
                    <c:forEach items="${typeVoList}" var="typeVo">
                        <dl>
                            <dt>${typeVo.name}</dt>
                            <c:forEach items="${typeVo.typesList}" var="type">
                                <dd>

                                    <a href="<c:url value="/type/typeSearch?type_id=${type.type_id}"/>">${type.name}</a>

                                </dd>
                            </c:forEach>

                        </dl>
                    </c:forEach>

                </div>
            </div>
            <div class="right-cont-wrap">
                <div class="right-cont">
                    <div class="sort layui-clear">
                        <a class="active" href="javascript:;" event='volume'>销量</a>
                        <a href="javascript:;" event='price'>价格</a>
                        <a href="javascript:;" event='newprod'>新品</a>
                        <a href="javascript:;" event='collection'>收藏</a>
                    </div>
                    <div class="prod-number">
                        <span>200个</span>
                    </div>
                    <div class="cont-list layui-clear" id="list-cont">

                        <c:forEach items="${byStar}" var="star">
                            <c:forEach items="${star}" var="s">


                                <div class="item">
                                    <div class="img">
                                        <a href="">
                                                <%--<img src="<c:url value="/cakeImg/${star.img}"/>" style="width: 280px;height: 280px;">--%>
                                        </a>
                                    </div>
                                    <div class="text">
                                        <p class="title">${star.name}</p>
                                        <p class="price">
                                            <span class="pri">￥</span>
                                            <span class="nub">1266付款</span>
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:forEach>


                        <%--
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img2.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img3.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img1.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img2.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img3.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img1.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img2.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img3.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img1.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img2.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img3.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img1.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img2.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>
                               <div class="item">
                                   <div class="img">
                                       <a href="javascript:;"><img src="../res/static/img/paging_img3.jpg"></a>
                                   </div>
                                   <div class="text">
                                       <p class="title">森系小清新四件套</p>
                                       <p class="price">
                                           <span class="pri">￥200</span>
                                           <span class="nub">1266付款</span>
                                       </p>
                                   </div>
                               </div>--%>
                    </div>
                    <!-- 模版引擎导入 -->
                    <!-- <script type="text/html" id="demo">
                    {{# layui.each(d.menu.milk.content,function(index,item){}}
                    <div class="item">
                    <div class="img">
                    <a href="javascript:;"><img src="{{item.img}}"></a>
                    </div>
                    <div class="text">
                    <p class="title"></p>
                    <p class="price">
                    <span class="pri">{{item.pri}}</span>
                    <span class="nub">{{item.nub}}</span>
                    </p>
                    </div>
                    </div>
                    {{# }); }}
                    </script> -->
                    <div id="demo0" style="text-align: center;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    layui.config({
        base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['mm', 'laypage', 'jquery'], function () {
        var laypage = layui.laypage, $ = layui.$,
            mm = layui.mm;
        laypage.render({
            elem: 'demo0'
            , count: 100 //数据总数
        });


        // 模版引擎导入
        // var html = demo.innerHTML;
        // var listCont = document.getElementById('list-cont');
        // // console.log(layui.router("#/about.html"))
        // mm.request({
        // url: '../json/commodity.json',
        // success : function(res){
        // console.log(res)
        // listCont.innerHTML = mm.renderHtml(html,res)
        // },
        // error: function(res){
        // console.log(res);
        // }
        // })

        $('.sort a').on('click', function (obj) {
            $(this).addClass('active').siblings().removeClass('active');
            var event = obj.event;


        })
        $('.list-box dt').on('click', function () {
            if ($(this).attr('off')) {
                $(this).removeClass('active').siblings('dd').show()
                $(this).attr('off', '')
            } else {
                $(this).addClass('active').siblings('dd').hide()
                $(this).attr('off', true)
            }
        })

    });
</script>
<%@include file="footer.jsp" %>