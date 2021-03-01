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
    <title>eleTest</title>
    <script src="${pageContext.request.contextPath}/resources/js/axios.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/qs.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/element-ui/lib/theme-chalk/index.css">
    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/element-ui/lib/index.js"></script>
</head>
<body>
<div id="app">
    <el-row class="tac">
        <el-col :span="3">
            <h5>默认颜色</h5>
            <el-menu
                    default-active="2"
                    class="el-menu-vertical-demo">
                <el-menu-item index="1" @Click="window.location.href='eleTest'">
                    <i class="el-icon-menu"></i>
                    <span slot="title">导航1</span>
                </el-menu-item>
                <el-menu-item index="2" @Click="window.location.href='eleTest2'">
                    <i class="el-icon-menu"></i>
                    <span slot="title">导航2</span>
                </el-menu-item>
            </el-menu>
        </el-col>
        <el-col :span="21" style="background: blue">
             页面2
        </el-col>
    </el-row>
</div>
<script>
    new Vue({
        el: '#app',
        data: {
            info: 'nullinfo',
            activeIndex: '1',
            activeIndex2: '1'
        },
        created()
        {
            // this.getHello()
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