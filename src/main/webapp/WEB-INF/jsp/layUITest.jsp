<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" charset="UTF-8">
    <title>非模块化方式使用layui</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layui.css">
</head>
<body>

<div class="layui-btn layui-btn-primary layer-demolist" id="test1">我下面会出现一个弹层</div>


<script src="${pageContext.request.contextPath}/resources/js/layui.all.js"></script>
<script>
    layui.use('layer', function () {
        var layer = layui.layer;

        layer.tips('上', '#test1', {  // 表示在id=test1的地方显示弹层
            tips: 3,    // 1/2/3/4分别表示从：上/右/下/左显示弹层
            time: 0,    // 设置为0表示不消失
        });
    });

</script>
</body>
</html>