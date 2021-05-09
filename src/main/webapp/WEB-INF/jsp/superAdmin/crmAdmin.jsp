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
    <title>crm管理</title>
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
                        <el-row :gutter="20">
                            <el-col :span="8">
                                <el-input placeholder="按客户名查找" v-model="queryInfo.key" clearable @clear="getStockList"
                                          @keyup.enter.native="getStockList">
                                    <el-button slot="append" icon="el-icon-search" @Click="getStockList"></el-button>
                                </el-input>
                            </el-col>
                        </el-row>
                        <br>
                        <el-table :data="crmList" border stripe v-loading="loading"
                                  :header-cell-style="{'text-align':'center','font-size':'14px'}"
                                  :cell-style="{'text-align':'center','font-size':'14px'}">
                            <el-table-column label="客户Id" prop="id" min-width="5%"></el-table-column>
                            <el-table-column label="客户名称" prop="customerName" min-width="5%"></el-table-column>
                            <el-table-column label="负责人" prop="orderNum" min-width="5%"></el-table-column>
                            <el-table-column label="成交订单数" prop="orderNum" min-width="5%"></el-table-column>
                            <el-table-column label="成交总额" prop="orderNum" min-width="5%"></el-table-column>
                            <el-table-column label="欠款" prop="orderNum" min-width="5%"></el-table-column>
                            <el-table-column label="回访次数" prop="orderNum" min-width="5%"></el-table-column>
                            <el-table-column label="近30天回访次数" prop="orderNum" min-width="5%"></el-table-column>
                            <el-table-column label="操作" width="80px">
                                <template slot-scope="scope">
                                    <el-tooltip effect="dark" content="查看回访详情" placement="top" :enterable="false">
                                        <el-button type="warning" icon="el-icon-search" size="mini"
                                                   @click=""></el-button>
                                    </el-tooltip>
                                </template>
                            </el-table-column>
                        </el-table>
                        <br>
                        <!-- 分页区域 -->
                        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                                       :current-page="queryInfo.page" :page-sizes="[5, 10]"
                                       :page-size="queryInfo.pre"
                                       layout="total, sizes, prev, pager, next, jumper" :total="total">
                        </el-pagination>
                    </el-card>
                </div>
            </el-main>
        </el-container>
    </el-container>
</div>

<script>
    new Vue({
        el: '#app',
        data()
        {
            return{
                username:'',
                loading:true,
                queryInfo: {
                    page: 1,
                    pre: 5,
                    key:"",
                    token:""
                },
                stockList:[],
                crmList:[
                    {id:1000,customerName:"徐三",orderNum:'30',oweNum:'0',visitNum:'3'},
                    {id:1000,customerName:"徐四",orderNum:'13',oweNum:'0',visitNum:'4'},
                    {id:1000,customerName:"徐五",orderNum:'14',oweNum:'0',visitNum:'5'},
                    {id:1000,customerName:"徐六",orderNum:'5',oweNum:'0',visitNum:'1'},
                    {id:1000,customerName:"徐七",orderNum:'11',oweNum:'0',visitNum:'2'},
                    ],
                total: 0,
            }
        },
        created() {
            this.getStockList()
            this.init()
        },
        methods: {
            init()
            {
                <%@ include file="../public/setHeight.jsp" %>
                <%@ include file="../public/getUsername.jsp" %>
                <%@ include file="../public/superAdmin/roleJudge.jsp" %>
                document.getElementById("crmAdmin").style.color = "#409EFF";
                document.getElementById("crmAdminIco").style.color = "#409EFF"
            },
            <%@ include file="../public/superAdmin/setJump.jsp" %>
            async getStockList() {
                this.queryInfo.token = window.localStorage.getItem("token")
                this.loading = true;
                let url =  '/getStockList';
                axios.get(url, {
                    params: this.queryInfo
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        this.loading = false;
                        this.stockList = res.data.data;
                        this.total = res.data.total;
                    }
                    else
                    {
                        return this.$message.error('获取数据失败！')
                    }
                }).catch(err => {
                })
            },
            handleSizeChange(newSize) {
                this.queryInfo.pre = newSize
                this.getStockList()
            },
            handleCurrentChange(newPage) {
                this.queryInfo.page = newPage
                this.getStockList()
            },
            // 监听修改对话框的关闭事件
            editDialogClosed() {
                this.sexValue = ""
                this.typeValue = ""
                this.$refs.editFormRef.resetFields()
                this.editDialogVisible = false
            },
            back()
            {
                window.location.href="/superAdmin/basicInfoAdmin";
            },
        }
    })
</script>
</body>
</html>
