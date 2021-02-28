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
    <script src="${pageContext.request.contextPath}/resources/js/axios.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/qs.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/element-ui/lib/theme-chalk/index.css">
    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/element-ui/lib/index.js"></script>
</head>
<body>
<div id="app">
    <p>{{ info }}</p>
    <br>
    <el-tag>tag</el-tag>
</div>
<script>
    new Vue({
        el: '#app',
        data: {
            info: 'nullinfo'
        },
        created()
        {
            this.getHello()
        },
        methods: {
            async getHello()
            {
                let url = "http://localhost:8080/hello";
                let params ={
                    id:"{*}测试"
                }
                axios.get(url, {
                    params: {
                        id:"111"
                    }
                }).then(res=>{
                    this.info = res.data;
                    this.$message.success("success")
                }).catch(err=>{
                    console.log(err);
                })
            },
        }
    })
</script>
</body>
</html>