<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/9
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="layui-table"
       lay-data="{method:'post',url:'/goods/pageAll', page:true, id:'goodsList'}"
       lay-filter="goodsList">
    <thead>
    <tr>
        <th lay-data="{field:'checkbox', type:'checkbox'}"></th>
        <th lay-data="{field:'id', sort: true}">商品编号</th>
        <th lay-data="{field:'name'}">商品名称</th>
        <th lay-data="{templet:'<div>￥ {{d.price}}</div>'}">商品价格</th>
        <th lay-data="{field:'star'}">商品评分</th>
        <th lay-data="{templet:'<div>{{d.tbGoodsTypeByTypeid.name}}</div>'}">商品类别</th>
        <th lay-data="{fixed:'right', toolbar: '.barDemo'}">操作</th>
    </tr>
    </thead>
</table>
</body>
</html>
