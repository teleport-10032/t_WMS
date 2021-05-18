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
                                <el-input placeholder="按客户名查找" v-model="queryInfo.key" clearable @clear="getCustomerList"
                                          @keyup.enter.native="getCustomerList">
                                    <el-button slot="append" icon="el-icon-search" @Click="getCustomerList"></el-button>
                                </el-input>
                            </el-col>
                        </el-row>
                        <br>
                        <el-table :data="CustomerList" border stripe v-loading="loading"
                                  :header-cell-style="{'text-align':'center','font-size':'14px'}"
                                  :cell-style="{'text-align':'center','font-size':'14px'}">
                            <el-table-column label="客户Id" prop="customerId" min-width="5%"></el-table-column>
                            <el-table-column label="客户名称" prop="customerName" min-width="5%"></el-table-column>
                            <el-table-column label="负责人" prop="staffName" min-width="5%"></el-table-column>
                            <el-table-column label="成交单数" prop="orderNum" min-width="5%"></el-table-column>
                            <el-table-column label="回访次数" prop="visitNum" min-width="5%"></el-table-column>
                            <el-table-column label="欠款(元)" prop="debts" min-width="5%"></el-table-column>
                            <el-table-column label="操作" width="80px">
                                <template slot-scope="scope">
                                    <el-tooltip effect="dark" content="查看回访详情" placement="top" :enterable="false">
                                        <el-button type="warning" icon="el-icon-search" size="mini"
                                                   @click="viewVisitList(scope.row.customerId)"></el-button>
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

                <el-dialog title="回访详情" :visible.sync="dialogVisible" width="50%" @submit.native.prevent>
                    <el-button type="primary" @click="addDialogVisible=true">添加回访记录</el-button>
                    <div style="height: 10px"></div>
                    <el-table :data="visitList" border stripe v-loading="loading"
                              :header-cell-style="{'text-align':'center','font-size':'14px'}"
                              :cell-style="{'text-align':'center','font-size':'14px'}">
                        <el-table-column label="Id" prop="id" min-width="5%"></el-table-column>
                        <el-table-column label="时间" prop="time" min-width="5%"></el-table-column>
                        <el-table-column label="备注" prop="info" min-width="5%"></el-table-column>
                        <el-table-column label="操作" width="80px">
                            <template slot-scope="scope">
                                <el-tooltip effect="dark" content="删除" placement="top" :enterable="false">
                                    <el-button type="danger" icon="el-icon-delete" size="mini"
                                               @click="deleteVisitById(scope.row.id)"
                                    ></el-button>
                                </el-tooltip>
                            </template>
                        </el-table-column>
                    </el-table>
                    <span slot="footer" class="dialog-footer">
                            <el-button @click="dialogVisible = false">取 消</el-button>
                            <el-button type="primary">确 定</el-button>
                    </span>
                </el-dialog>
                <el-dialog title="新增回访记录" :visible.sync="addDialogVisible" width="50%" @submit.native.prevent>
                    <el-form :model="addForm" ref="addFormRef" label-width="70px">
                        <el-form-item label="时间" prop="date">
                            <el-date-picker
                                    value-format="yyyy-MM-dd HH:mm:ss"
                                    default-time="12:00:00"
                                    v-model="addForm.date"
                                    type="datetime"
                                    placeholder="选择日期时间">
                            </el-date-picker>
                        </el-form-item>
                        <el-form-item label="备注" prop="info">
                            <el-input v-model="addForm.info" @keyup.enter.native=""></el-input>
                        </el-form-item>
                    </el-form>
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="addDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="addVisit">确 定</el-button>
                        </span>
                </el-dialog>
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
                CustomerList:[],
                total: 0,
                dialogVisible:false,
                visitList:[],
                currentCustomerId:0,
                addDialogVisible:false,
                addForm:{
                    info:'',
                    date:''
                }
            }
        },
        created() {
            this.getCustomerList()
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
            viewVisitList(customerId){
                this.dialogVisible = true
                this.currentCustomerId = customerId
                // getVisitListByCustomerId
                // console.log(customerId)
                let url =  '/getVisitListByCustomerId';
                axios.get(url, {
                    params: {
                        customerId:customerId,
                        token:window.localStorage.getItem("token")
                    }
                }).then(res => {
                    // console.log(res)
                    if(res.data.error === "0")
                    {
                        this.visitList = res.data.data
                    }
                    else
                    {
                        return this.$message.error('获取数据失败！')
                    }
                }).catch(err => {
                })
            },
            addVisit(){
                let result =  axios({
                    method: 'post',
                    url: '/addVisit',
                    headers: { 'content-type': 'application/x-www-form-urlencoded'},
                    data: Qs.stringify({
                        customerId:this.currentCustomerId,
                        date:this.addForm.date,
                        info:this.addForm.info,
                        token:window.localStorage.getItem("token")
                    })
                });
                result.then(res=>{
                    if(res.data.error === "0")
                    {
                        this.$message.success("操作成功")
                        this.addDialogVisible = false
                        this.viewVisitList(this.currentCustomerId)
                    }
                    else{
                        this.$message.error("操作失败")
                    }
                })
            },
            async deleteVisitById(id){
                const confirmResult = await this.$confirm(
                    '此操作将永久删除该记录, 是否继续?',
                    '提示',
                    {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }
                ).catch(err => err)
                if (confirmResult !== 'confirm') {
                    return this.$message.info('已取消删除')
                }
                const {data: res} = await axios.delete('/deleteVisitById',
                    {
                        params: {
                            id: id,
                            token: window.localStorage.getItem("token")
                        }
                    })
                if (res.error === "0") {
                    this.$message.success('操作成功')
                }
                else{
                    this.$message.error('操作失败')
                }
                await this.viewVisitList(this.currentCustomerId)

            },
            async getCustomerList() {
                this.queryInfo.token = window.localStorage.getItem("token")
                this.loading = true;
                let url =  '/getCustomerCrmList';
                axios.get(url, {
                    params: this.queryInfo
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        this.loading = false;
                        this.CustomerList = res.data.data;
                        this.total = res.data.data.length
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
                this.getCustomerList()
            },
            handleCurrentChange(newPage) {
                this.queryInfo.page = newPage
                this.getCustomerList()
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
