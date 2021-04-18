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
                        <el-tag  effect="dark" size="small" type="warning">基本信息设置</el-tag>
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
                                        <el-collapse-item title="如何完成一套出入库流程？" name="1">
                                            <p>&nbsp;&nbsp;&nbsp;&nbsp;
                                                1.点击该页面的"仓库管理",新增一个仓库。
                                                <br>&nbsp;&nbsp;&nbsp;&nbsp;
                                                2.点击该页面的"类型管理"，新增一个产品类型；再次点击"产品管理"，新增一种产品并选择所属类型。
                                                <br>&nbsp;&nbsp;&nbsp;&nbsp;
                                                3.点击该页面的"客户管理"或"供应商管理"，新增客户或供应商信息。
                                                <br>&nbsp;&nbsp;&nbsp;&nbsp;
                                                4.点击侧边栏的"入库"或"出库"，选择产品和客户/供应商，进行出/入库操作。
                                            </p>
                                        </el-collapse-item>
                                    </el-collapse>
                                </div>
                                <br>
                            </el-card>
                        </el-dialog>
                        <br><br>
                        <el-row>
                            <el-tag effect="dark" size="mini">仓库</el-tag>
                            &nbsp;
                            <el-button type="primary" size="mini" plain @click="jumpToWarehouseAdmin">仓库管理</el-button>
                        </el-row>
                        <el-row style="height: 10px"></el-row>
                        <el-row>
                            <el-tag effect="dark" size="mini">产品</el-tag>
                            &nbsp;
                            <el-button type="primary" size="mini" plain>类型管理</el-button>
                            <el-button type="primary" size="mini" plain>产品管理</el-button>
                        </el-row>
                        <el-row style="height: 10px"></el-row>
                        <el-row>
                            <el-tag effect="dark" size="mini">人员</el-tag>
                            &nbsp;
                            <el-button type="primary" size="mini" plain>客户管理</el-button>
                            <el-button type="primary" size="mini" plain>供应商管理</el-button>
                            <el-button type="primary" size="mini" plain @click="jumpToStaffAdmin">员工管理</el-button>
                        </el-row>
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
                <%@ include file="../public/superAdmin/roleJudge.jsp" %>
                document.getElementById("basicInfoAdmin").style.color = "#409EFF";
                document.getElementById("basicInfoAdminIco").style.color = "#409EFF"
            },
            <%@ include file="../public/superAdmin/setJump.jsp" %>
            jumpToStaffAdmin()
            {
                window.location.href="/superAdmin/staffAdmin";
            },
            jumpToWarehouseAdmin()
            {
                window.location.href="/superAdmin/warehouseAdmin";
            },
        }
    })
</script>
</body>
</html>
