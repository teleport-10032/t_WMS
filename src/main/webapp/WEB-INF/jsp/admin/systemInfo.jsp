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
            <%@ include file="../public/admin/aside.jsp" %>
            <el-main id="elMain">
                <div>
                    <el-card>
                        <el-tag  effect="dark" size="small" type="warning">基本信息</el-tag>
                        <el-tooltip class="item" effect="dark" content="打开帮助信息" placement="top-start">
                            <el-button @click="dialogTableVisible = true" icon="el-icon-question" type="text"></el-button>
                        </el-tooltip>
                        <el-dialog title="关于" :visible.sync="dialogTableVisible">
                            <el-card class="box-card" style="width: 100%;margin: 0 auto;align-self: center">
                                <div slot="header" class="clearfix">
                                    <span style="text-align: left !important;">About / Q&A</span>
                                </div>
                                <div class="text item" style="width: 100%;">
                                    <el-collapse  style="width: 100%;align-self: center;margin-top:15px" v-model="activeNames">
                                        <el-collapse-item title="该系统如何管控用户权限？" name="1">
                                            <p>&nbsp;&nbsp;&nbsp;&nbsp;
                                                该系统一共有三种权限，分别为admin(超级管理员)、admin(管理员)、whAdmin(仓库管理员)、crmAdmin(crm管理员)。
                                                <br>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                您是admin用户，同时拥有仓库管理员和crm管理员的权限，并可对用户账户进行管理。
                                            </p>
                                        </el-collapse-item>
                                    </el-collapse>
                                </div>
                                <br>
                            </el-card>
                        </el-dialog>
                        <br><br>
                        <el-tag effect="plain" size="mini">已录入的员工数量</el-tag>
                        <el-tag effect="plain" size="mini">{{staffNum}}</el-tag>
                        <br><br>
                        <el-tag effect="plain" size="mini">已录入的产品数量</el-tag>
                        <el-tag effect="plain" size="mini">{{productNum}}</el-tag>
                    </el-card>
                    <br><br>
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
                staffNum:'',
                productNum:'',
                activeNames:['1'],
                dialogTableVisible:false
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
                <%@ include file="../public/admin/roleJudge.jsp" %>
                document.getElementById("systemInfo").style.color = "#409EFF";
                document.getElementById("systemInfoIco").style.color = "#409EFF"
                this.getStaffNum()
                this.getProductNum()
            },
            <%@ include file="../public/admin/setJump.jsp" %>
            async getStaffNum() {
                axios.get('/getStaffNum', {
                    params: {
                        token:window.localStorage.getItem("token")
                    }
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        this.staffNum = res.data.staffNum
                    }
                    else
                    {
                        return this.$message.error('获取员工数量失败！')
                    }
                })
            },
            async getProductNum() {
                axios.get('/getProductNum', {
                    params: {
                        token:window.localStorage.getItem("token")
                    }
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        this.productNum = res.data.productNum
                    }
                    else
                    {
                        return this.$message.error('获取产品数量失败！')
                    }
                })
            },
            jumpToStaffAdmin()
            {
                window.location.href="/admin/staffAdmin";
            }
        }
    })
</script>
</body>
</html>
