<%--
  Created by IntelliJ IDEA.
  User: teleport
  Date: 2021/3/2
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>基本信息管理</title>
    <%@ include file="../public/include.jsp"%>
</head>
<body>

<div id="app" v-cloak>
    <el-container>
        <%@ include file="../public/header.jsp" %>
        <el-container>
            <%@ include file="../public/superAdmin/aside.jsp" %>
            <el-main id="elMain">
                <div>
                    <el-card>
                        <el-tag  effect="plain" size="mini">SystemInfo</el-tag>
                        <br><br>
                        <el-tag effect="plain" size="mini">用户数量:</el-tag>
                        <el-tag effect="plain" size="mini">4</el-tag>
                        <br><br>
                        <el-tag effect="plain" size="mini">题目数量:</el-tag>
                        <el-tag effect="plain" size="mini">10</el-tag>
                    </el-card>
                </div>
            </el-main>
        </el-container>
    </el-container>
</div>

<script>
    new Vue({
        el: '#app',
        data() {
            return{
                username:''
            }
        }
        ,
        created() {
            this.init()
        },
        methods: {
            init() {
                <%@ include file="../public/setHeight.jsp" %>
                <%@ include file="../public/getUsername.jsp" %>
                <%@ include file="../public/superAdmin/roleJudge.jsp" %>
                document.getElementById("basicInfoAdmin").style.color = "#409EFF";
                document.getElementById("basicInfoAdminIco").style.color = "#409EFF"
            },
            <%@ include file="../public/superAdmin/setJump.jsp" %>
        }
    })
</script>
</body>
</html>
