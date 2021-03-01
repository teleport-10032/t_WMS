<%--
  Created by IntelliJ IDEA.
  User: teleport
  Date: 2021/3/1
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>iViewTest</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/iview.css">
    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/iview.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/axios.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/qs.min.js"></script>
</head>
<body>
<div id="app">
    <i-button @click="show">Click me!</i-button>
    <Modal v-model="visible" title="Welcome">Welcome to ViewUI</Modal>
    <i-menu mode="horizontal" :theme="theme1" active-name="1">
        <MenuItem name="1">
            <Icon type="ios-paper" />
            内容管理
        </MenuItem>
        <MenuItem name="2">
            <Icon type="ios-people" />
            用户管理
        </MenuItem>
        <Submenu name="3">
            <template slot="title">
                <Icon type="ios-stats" />
                统计分析
            </template>
            <MenuGroup title="使用">
                <MenuItem name="3-1">新增和启动</MenuItem>
                <MenuItem name="3-2">活跃分析</MenuItem>
                <MenuItem name="3-3">时段分析</MenuItem>
            </MenuGroup>
            <MenuGroup title="留存">
                <MenuItem name="3-4">用户留存</MenuItem>
                <MenuItem name="3-5">流失用户</MenuItem>
            </MenuGroup>
        </Submenu>
        <MenuItem name="4">
            <Icon type="ios-construct" />
            综合设置
        </MenuItem>
    </i-menu>
</div>
<script>
    new Vue({
        el: '#app',
        data: {
            visible: false,
            theme1: 'light'
        },
        methods: {
            show: function () {
                this.visible = true;
            }
        }
    })
</script>
</body>
</html>
