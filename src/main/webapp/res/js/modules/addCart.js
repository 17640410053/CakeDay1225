layui.define(['layer', 'button'], function (exports) {
    var layer = layui.layer
        , button = layui.button;

    layer.msg('Hello World');

    exports('addCart', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});