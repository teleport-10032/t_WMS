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
    <title>员工信息管理</title>
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
                        <el-tag effect="plain" size="mini">员工数量:</el-tag>
                        <el-tag effect="plain" size="mini">{{staffNum}}</el-tag>
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
                username:'',
                staffNum:''
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
                document.getElementById("systemInfo").style.color = "#409EFF";
                document.getElementById("systemInfoIco").style.color = "#409EFF"
                this.getStaffNum()
            },
            <%@ include file="../public/superAdmin/setJump.jsp" %>
            async getStaffNum() {
                axios.get('/getStaffNum', {
                    params: {
                        token:window.localStorage.getItem("token")
                    }
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        this.staffNum = res.data.staffNum
                        // this.$message.success("success")
                    }
                    else
                    {
                        return this.$message.error('获取员工数量失败！')
                    }
                })
            },
        }
    })
</script>
</body>
</html>
