<%--
  Created by IntelliJ IDEA.
  User: teleport
  Date: 2021/2/3
  Time: 8:02 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/axios.min.js";
%>
<html lang="en">
<head>
    <title>Vue.js test</title>
<%--    <script src="<%=basePath%>>"></script>--%>
    <script src="https://cdn.bootcdn.net/ajax/libs/axios/0.21.1/axios.js"></script>
    <script src="https://cdn.bootcss.com/qs/6.5.1/qs.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://cdn.bootcss.com/vue/2.6.11/vue.min.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body>
Hello JSP.
<div id="app">
    <p>{{ info }}</p>
    <br>
    <el-tag>ss</el-tag>

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
                let url = "http://localhost:8888/hello";
                let params ={
                    id:"2331111111123123"
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
