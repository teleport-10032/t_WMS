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
    <title>库存管理</title>
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
                                <el-input placeholder="按订单号查找" v-model="queryInfo.key" clearable @clear="getStockList"
                                          @keyup.enter.native="getStockList">
                                    <el-button slot="append" icon="el-icon-search" @Click="getStockList"></el-button>
                                </el-input>
                            </el-col>
                            <el-col :span="4">
                                <el-button type="primary" @click="addDialogOpen">添加入库信息</el-button>
                            </el-col>
                        </el-row>
                        <br>
                        <el-table :data="stockList" border stripe v-loading="loading"
                                  :header-cell-style="{'text-align':'center','font-size':'14px'}"
                                  :cell-style="{'text-align':'center','font-size':'14px'}">
                            <el-table-column label="Id" prop="id" min-width="5%"></el-table-column>
                            <el-table-column label="产品名" prop="productName" min-width="5%"></el-table-column>
                            <el-table-column label="数量" prop="num" min-width="5%"></el-table-column>
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
                total: 0,
                addDialogVisible: false,
                addForm: {
                    orderId:'',
                    productId:'',
                    supplierId:'',
                    productNum:'',
                    info:'',
                },
                supplierOptions: [],
                productOptions: [],
                addFormRules: {
                    orderId: [
                        { required: true, message: '请输入订单号', trigger: 'blur' }
                    ],
                    productId: [
                        { required: true, message: '请输入产品名', trigger: 'blur' }
                    ],
                    supplierId: [
                        { required: true, message: '请输入供应商', trigger: 'blur' }
                    ],
                    productNum: [
                        { required: true, message: '请输入数量(件)', trigger: 'blur' }
                    ],
                    info: [
                        { required: true, message: '请输入备注', trigger: 'blur' }
                    ],
                },
                editDialogVisible: false,
                editForm: {
                    id:'',
                    orderId:'',
                    productId:'',
                    supplierId:'',
                    productNum:'',
                    info:'',
                },
            }

        }
        ,
        created() {
            this.getStockList()
            this.init()
            this.getSupplierIdAndName()
            this.getProductIdAndName()
        },
        methods: {
            init()
            {
                <%@ include file="../public/setHeight.jsp" %>
                <%@ include file="../public/getUsername.jsp" %>
                <%@ include file="../public/superAdmin/roleJudge.jsp" %>
                document.getElementById("stockAdmin").style.color = "#409EFF";
                document.getElementById("stockAdminIco").style.color = "#409EFF"
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
            async getSupplierIdAndName()
            {
                let url =  '/getSupplierIdAndName';
                axios.get(url, {
                    params:{token:window.localStorage.getItem("token")}
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        let len = res.data.data.length
                        let len2 = this.supplierOptions.length
                        if(len2 === 0)
                        {
                            for(let i = 0 ; i < len ; i ++)
                            {
                                this.supplierOptions.push(
                                    {
                                        label:res.data.data[i]['name'],
                                        value:res.data.data[i]['id'],
                                    }
                                )
                            }
                        }
                    }
                    else
                    {
                        return this.$message.error('获取供应商数据失败！')
                    }
                }).catch(err => {
                })
            },
            async getProductIdAndName()
            {
                let url =  '/getProductIdAndName';
                axios.get(url, {
                    params:{token:window.localStorage.getItem("token")}
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        let len = res.data.data.length
                        let len2 = this.productOptions.length
                        // console.log(len2)
                        if(len2 === 0)
                        {
                            for(let i = 0 ; i < len ; i ++)
                            {
                                this.productOptions.push(
                                    {
                                        label:res.data.data[i]['name'],
                                        value:res.data.data[i]['id'],
                                    }
                                )
                            }
                        }
                    }
                    else
                    {
                        return this.$message.error('获取产品数据失败！')
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
            addDialogOpen()
            {
                this.addDialogVisible = true
            },
            addDialogClosed() {
                this.$refs.addFormRef.resetFields()
                this.addDialogVisible = false
            },
            addInn() {
                this.$refs.addFormRef.validate(async valid => {
                    if (!valid) return
                    let result =  axios({
                        method: 'post',
                        url: '/addInn',
                        headers: { 'content-type': 'application/x-www-form-urlencoded'},
                        data: Qs.stringify({
                            orderId:this.addForm.orderId,
                            productId:this.addForm.productId,
                            supplierId:this.addForm.supplierId,
                            productNum:this.addForm.productNum,
                            info:this.addForm.info,
                            token:window.localStorage.getItem("token")
                        })
                    });
                    result.then(res=>{
                        if(res.data.error === "0")
                        {
                            this.getStockList()
                            this.addDialogClosed()
                            this.$message.success("操作成功")
                        }
                    })
                })
            },
            async editInn(id){
                this.editForm.id = id
                this.editDialogVisible = true
                // console.log(id)
                const { data: res } = await axios.get('/getInnById'
                    ,{params:{id:id,token:window.localStorage.getItem("token")}})
                if (res.error !== "0") {
                    return this.$message.error('获取数据失败！')
                }
                this.editForm.id = id;
                this.editForm.orderId = res.data.orderId
                this.editForm.productId = res.data.productId
                this.editForm.supplierId = res.data.supplierId
                this.editForm.productNum = res.data.productNum
                this.editForm.createdDate = res.data.createdDate
                this.editForm.lastModifyDate = res.data.lastModifyDate
                this.editForm.info = res.data.info
            },
            // 监听修改对话框的关闭事件
            editDialogClosed() {
                this.sexValue = ""
                this.typeValue = ""
                this.$refs.editFormRef.resetFields()
                this.editDialogVisible = false
            },
            // 修改信息并提交
            editInnSubmit() {
                this.$refs.editFormRef.validate(async valid => {
                    if (!valid) return
                    let result =  axios({
                        method: 'put',
                        url: '/updateInnById',
                        headers: { 'content-type': 'application/x-www-form-urlencoded'},
                        data: Qs.stringify({
                            id:this.editForm.id,
                            orderId:this.editForm.orderId,
                            productId:this.editForm.productId,
                            supplierId:this.editForm.supplierId,
                            productNum:this.editForm.productNum,
                            info:this.editForm.info,
                            token:window.localStorage.getItem("token")
                        })
                    });
                    result.then(res=>{
                        if(res.data.error === "0")
                        {
                            this.getStockList()
                            this.editDialogClosed()
                            this.$message.success("操作成功")
                        }
                    })
                })
            },
            // 根据Id删除
            async deleteInnById(id) {
                const confirmResult = await this.$confirm(
                    '此操作将永久删除该种类, 是否继续?',
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

                const {data: res} = await axios.delete('/deleteInnById',
                    {
                        params: {
                            id: id,
                            token: window.localStorage.getItem("token")
                        }
                    })
                if (res.error !== "0") {
                    return this.$message.error('操作失败')
                }
                this.$message.success('操作成功')
                await this.getStockList()
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