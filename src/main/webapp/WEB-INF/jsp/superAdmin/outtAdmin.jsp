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
    <title>出库管理</title>
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
                                <el-input placeholder="按订单号查找" v-model="queryInfo.key" clearable @clear="getOutList"
                                          @keyup.enter.native="getOutList">
                                    <el-button slot="append" icon="el-icon-search" @Click="getOutList"></el-button>
                                </el-input>
                            </el-col>
                            <el-col :span="4">
                                <el-button type="primary" @click="addDialogOpen">添加出库信息</el-button>
                            </el-col>
                        </el-row>
                        <br>
                        <el-table :data="outList" border stripe v-loading="loading"
                                  :header-cell-style="{'text-align':'center','font-size':'14px'}"
                                  :cell-style="{'text-align':'center','font-size':'14px'}">
                            <el-table-column label="Id" prop="id" min-width="5%"></el-table-column>
                            <el-table-column label="订单号" prop="orderId" min-width="5%"></el-table-column>
                            <el-table-column label="产品名" prop="productName" min-width="5%"></el-table-column>
                            <el-table-column label="客户" prop="customerName" min-width="5%"></el-table-column>
                            <el-table-column label="数量(件)" prop="productNum" min-width="5%"></el-table-column>
                            <el-table-column label="创建日期" prop="createdDate" min-width="5%"></el-table-column>
                            <el-table-column label="最后修改日期" prop="lastModifyDate" min-width="5%"></el-table-column>
                            <el-table-column label="备注" prop="info" min-width="5%"></el-table-column>
                            <el-table-column label="操作" width="90px">
                                <template slot-scope="scope">
<%--                                    <el-tooltip effect="dark" content="编辑" placement="top" :enterable="false">--%>
<%--                                        <el-button type="primary" icon="el-icon-edit" size="mini"--%>
<%--                                                   @click="editOutt(scope.row.id)"></el-button>--%>
<%--                                    </el-tooltip>--%>
                                    <el-tooltip effect="dark" content="删除" placement="top" :enterable="false">
                                        <el-button type="danger" icon="el-icon-delete" size="mini"
                                                   @click="deleteOuttById(scope.row.id)">
                                        </el-button>
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

                    <!-- 创建对话框 -->
                    <el-dialog title="添加入库信息" :visible.sync="addDialogVisible" width="50%" @close="addDialogClosed"
                               @submit.native.prevent>
                        <!-- 内容主体区域 -->
                        <el-form :model="addForm" :rules="addFormRules" ref="addFormRef" label-width="70px">
                            <el-form-item label="订单号" prop="orderId">
                                <el-input v-model="addForm.orderId" @keyup.enter.native="addOutt"></el-input>
                            </el-form-item>
                            <el-form-item label="产品" prop="productId">
                                <template>
                                    <el-select v-model="addForm.productId" placeholder="请选择">
                                        <el-option
                                                v-for="item in productOptions"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </el-form-item>
                            <el-form-item label="客户" prop="customerId">
                                <template>
                                    <el-select v-model="addForm.customerId" placeholder="请选择">
                                        <el-option
                                                v-for="item in customerOptions"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </el-form-item>
                            <el-form-item label="数量" prop="productNum">
                                <el-input v-model="addForm.productNum" @keyup.enter.native="addOutt"></el-input>
                            </el-form-item>
                            <el-form-item label="备注" prop="info">
                                <el-input v-model="addForm.info" @keyup.enter.native="addOutt"></el-input>
                            </el-form-item>
                        </el-form>
                        <!-- 底部区域 -->
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="addDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="addOutt">确 定</el-button>
                          </span>
                    </el-dialog>

                    <!-- 修改对话框 -->
                    <el-dialog title="编辑入库信息" :visible.sync="editDialogVisible" width="500px" @close="editDialogClosed"
                               @submit.native.prevent>
                        <el-form :model="editForm" :rules="addFormRules"  ref="editFormRef" label-width="70px">
                            <el-form-item label="Id" prop="id">
                                <el-input v-model="editForm.id" @keyup.enter.native="editOuttSubmit" disabled></el-input>
                            </el-form-item>
                            <el-form-item label="订单号" prop="orderId">
                                <el-input v-model="editForm.orderId" @keyup.enter.native="editOuttSubmit"></el-input>
                            </el-form-item>

                            <el-form-item label="产品"  prop="productId">
                                <template>
                                    <el-select v-model="editForm.productId" placeholder="请选择">
                                        <el-option
                                                v-for="item in productOptions"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </el-form-item>
                            <el-form-item label="客户"  prop="customerId">
                                <template>
                                    <el-select v-model="editForm.customerId" placeholder="请选择">
                                        <el-option
                                                v-for="item in customerOptions"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </el-form-item>
                            <el-form-item label="数量" prop="productNum">
                                <el-input v-model="editForm.productNum" @keyup.enter.native="editOuttSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="备注" prop="info">
                                <el-input v-model="editForm.info" @keyup.enter.native="editOuttSubmit"></el-input>
                            </el-form-item>
                        </el-form>
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="editDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="editOuttSubmit">确 定</el-button>
                        </span>
                    </el-dialog>

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
                outList:[],
                total: 0,
                addDialogVisible: false,
                addForm: {
                    orderId:'',
                    productId:'',
                    customerId:'',
                    productNum:'',
                    info:'',
                },
                customerOptions: [],
                productOptions: [],
                addFormRules: {
                    orderId: [
                        { required: true, message: '请输入订单号', trigger: 'blur' }
                    ],
                    productId: [
                        { required: true, message: '请输入产品名', trigger: 'blur' }
                    ],
                    customerId: [
                        { required: true, message: '请输入客户', trigger: 'blur' }
                    ],
                    productNum: [
                        { required: true, message: '请输入数量(件)', trigger: 'blur' },
                        {
                            type: 'number',
                            message: '请输入正整数',
                            trigger: 'blur',
                            transform(value) {
                                if(value !== null && value !== '') {
                                    if (String(value).trim() === '' || Number(value) <= 0) {
                                        return false
                                    }else if (String(value).indexOf('.') !== -1 || String(value).indexOf('-') !== -1) {
                                        return false
                                    }else{
                                        return Number(value)
                                    }
                                }else {
                                    return null
                                }
                            }
                        }
                    ]
                },
                editDialogVisible: false,
                editForm: {
                    id:'',
                    orderId:'',
                    productId:'',
                    customerId:'',
                    productNum:'',
                    info:'',
                },
            }

        }
        ,
        created() {
            this.getOutList()
            this.init()
            this.getCustomerIdAndName()
            this.getProductIdAndName()
        },
        methods: {
            init()
            {
                <%@ include file="../public/setHeight.jsp" %>
                <%@ include file="../public/getUsername.jsp" %>
                <%@ include file="../public/superAdmin/roleJudge.jsp" %>
                document.getElementById("outtAdmin").style.color = "#409EFF";
                document.getElementById("outtAdminIco").style.color = "#409EFF"
            },
            <%@ include file="../public/superAdmin/setJump.jsp" %>
            getOuttNumber() {
                let code = '';
                let codeLength = 4;
                let random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
                for (let i = 0; i < codeLength; i++) {
                    let index = Math.floor(Math.random() * 9);
                    code += random[index];
                }
                this.addForm.orderId = 'Out' + new Date().getTime() + code
            },
            async getOutList() {
                this.queryInfo.token = window.localStorage.getItem("token")
                this.loading = true;
                let url =  '/getOuttList';
                axios.get(url, {
                    params: this.queryInfo
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        this.loading = false;
                        this.outList = res.data.data;
                        this.total = res.data.total;
                    }
                    else
                    {
                        return this.$message.error('获取数据失败！')
                    }
                }).catch(err => {
                })
            },
            async getCustomerIdAndName()
            {
                let url =  '/getCustomerIdAndName';
                axios.get(url, {
                    params:{token:window.localStorage.getItem("token")}
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        let len = res.data.data.length
                        let len2 = this.customerOptions.length
                        // console.log(len2)
                        if(len2 === 0)
                        {
                            for(let i = 0 ; i < len ; i ++)
                            {
                                this.customerOptions.push(
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
                        return this.$message.error('获取客户数据失败！')
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
                this.getOutList()
            },
            handleCurrentChange(newPage) {
                this.queryInfo.page = newPage
                this.getOutList()
            },
            addDialogOpen()
            {
                this.addDialogVisible = true
                this.getOuttNumber()
            },
            addDialogClosed() {
                this.$refs.addFormRef.resetFields()
                this.addDialogVisible = false
            },
            addOutt() {
                this.$refs.addFormRef.validate(async valid => {
                    if (!valid) return
                    let result =  axios({
                        method: 'post',
                        url: '/addOutt',
                        headers: { 'content-type': 'application/x-www-form-urlencoded'},
                        data: Qs.stringify({
                            orderId:this.addForm.orderId,
                            productId:this.addForm.productId,
                            customerId:this.addForm.customerId,
                            productNum:this.addForm.productNum,
                            info:this.addForm.info,
                            token:window.localStorage.getItem("token")
                        })
                    });
                    result.then(res=>{
                        if(res.data.error === "0")
                        {
                            this.getOutList()
                            this.addDialogClosed()
                            this.$message.success("操作成功")
                        }
                        else if(res.data.error === "-3")
                            this.$message.error("操作失败，因为增加该记录后库存为负数")
                        else
                            this.$message.error("操作失败")
                    })
                })
            },
            async editOutt(id){
                this.editForm.id = id
                this.editDialogVisible = true
                // console.log(id)
                const { data: res } = await axios.get('/getOuttById'
                    ,{params:{id:id,token:window.localStorage.getItem("token")}})
                if (res.error !== "0") {
                    return this.$message.error('获取数据失败！')
                }
                this.editForm.id = id;
                this.editForm.orderId = res.data.orderId
                this.editForm.productId = res.data.productId
                this.editForm.customerId = res.data.customerId
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
            editOuttSubmit() {
                this.$refs.editFormRef.validate(async valid => {
                    if (!valid) return
                    let result =  axios({
                        method: 'put',
                        url: '/updateOuttById',
                        headers: { 'content-type': 'application/x-www-form-urlencoded'},
                        data: Qs.stringify({
                            id:this.editForm.id,
                            orderId:this.editForm.orderId,
                            productId:this.editForm.productId,
                            customerId:this.editForm.customerId,
                            productNum:this.editForm.productNum,
                            info:this.editForm.info,
                            token:window.localStorage.getItem("token")
                        })
                    });
                    result.then(res=>{
                        if(res.data.error === "0")
                        {
                            this.getOutList()
                            this.editDialogClosed()
                            this.$message.success("操作成功")
                        }
                    })
                })
            },
            // 根据Id删除
            async deleteOuttById(id) {
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

                const {data: res} = await axios.delete('/deleteOuttById',
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
                await this.getOutList()
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
