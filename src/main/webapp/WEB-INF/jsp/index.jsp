<%--
  Created by IntelliJ IDEA.
  User: teleport
  Date: 2021/2/3
  Time: 8:02 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Vue.js test</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/iview.css">
    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/iview.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/axios.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/qs.min.js"></script>
</head>
<body>
Hello JSP.
<div id="app">
    <i-button @click="show">Click me!</i-button>
    <Modal v-model="visible" title="Welcome">Welcome to ViewUI</Modal>
</div>
<script>
    new Vue({
        el: '#app',
        data: {
            visible: false
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