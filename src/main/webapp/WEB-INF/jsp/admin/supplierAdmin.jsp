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
    <title>供应商管理</title>
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
                        <el-row :gutter="20">
                            <el-col :span="2">
                                <el-button type="primary" @click="back()" size="middle">返回</el-button>
                            </el-col>
                            <el-col :span="8">
                                <el-input placeholder="按供应商名查找" v-model="queryInfo.key" clearable @clear="getSupplierList"
                                          @keyup.enter.native="getSupplierList">
                                    <el-button slot="append" icon="el-icon-search" @Click="getSupplierList"></el-button>
                                </el-input>
                            </el-col>
                            <el-col :span="2">
                                <el-button type="primary" @click="addDialogOpen">新建供应商</el-button>
                            </el-col>
                        </el-row>
                        <br>
<%--                        id,name,companyName,address,telephone, email,site, bank,bankAccount,bankName,taxNumber,debts,info,token--%>
                        <el-table :data="supplierList" border stripe v-loading="loading"
                                  :header-cell-style="{'text-align':'center','font-size':'14px'}"
                                  :cell-style="{'text-align':'center','font-size':'14px'}">
                            <el-table-column label="Id" prop="id" min-width="5%"></el-table-column>
                            <el-table-column label="供应商名" prop="name" min-width="5%"></el-table-column>
                            <el-table-column label="负责人" prop="staffName" min-width="5%"></el-table-column>
                            <el-table-column label="所在公司" prop="companyName" min-width="5%"></el-table-column>
                            <el-table-column label="地址" prop="address" min-width="5%"></el-table-column>
                            <el-table-column label="手机" prop="telephone" min-width="5%"></el-table-column>
                            <el-table-column label="邮箱" prop="email" min-width="5%"></el-table-column>
                            <el-table-column label="网站" prop="site" min-width="5%"></el-table-column>
                            <el-table-column label="开户行" prop="bank" min-width="5%"></el-table-column>
                            <el-table-column label="银行账户" prop="bankAccount" min-width="5%"></el-table-column>
                            <el-table-column label="开户名" prop="bankName" min-width="5%"></el-table-column>
                            <el-table-column label="税号" prop="taxNumber" min-width="5%"></el-table-column>
<%--                            <el-table-column label="欠款(元)" prop="debts" min-width="5%"></el-table-column>--%>
                            <el-table-column label="备注" prop="info" min-width="5%"></el-table-column>
                            <el-table-column label="操作" width="187px">
                                <template slot-scope="scope">
                                    <el-tooltip effect="dark" content="编辑" placement="top" :enterable="false">
                                        <el-button type="primary" icon="el-icon-edit" size="mini"
                                                   @click="editSupplier(scope.row.id)"></el-button>
                                    </el-tooltip>
                                    <el-tooltip effect="dark" content="删除" placement="top" :enterable="false">
                                        <el-button type="danger" icon="el-icon-delete" size="mini"
                                                   @click="deleteSupplierById(scope.row.id)"
                                        ></el-button>
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
                    <el-dialog title="新建供应商" :visible.sync="addDialogVisible" width="50%" @close="addDialogClosed"
                               @submit.native.prevent>
                        <!-- 内容主体区域 -->
                        <el-form :model="addForm" :rules="addFormRules" ref="addFormRef" label-width="70px">
                            <el-form-item label="供应商名" prop="name">
                                <el-input v-model="addForm.name" @keyup.enter.native="addSupplier"></el-input>
                            </el-form-item>
                            <el-form-item label="所在公司" prop="companyName">
                                <el-input v-model="addForm.companyName" @keyup.enter.native="addSupplier"></el-input>
                            </el-form-item>
                            <el-form-item label="地址" prop="address">
                                <el-input v-model="addForm.address" @keyup.enter.native="addSupplier"></el-input>
                            </el-form-item>
                            <el-form-item label="手机" prop="telephone">
                                <el-input v-model="addForm.telephone" @keyup.enter.native="addSupplier"></el-input>
                            </el-form-item>
                            <el-form-item label="邮箱" prop="email" @keyup.enter.native="addSupplier">
                                <el-input v-model="addForm.email"></el-input>
                            </el-form-item>
                            <el-form-item label="网站" prop="site">
                                <el-input v-model="addForm.site" @keyup.enter.native="addSupplier"></el-input>
                            </el-form-item>
                            <el-form-item label="开户行" prop="bank">
                                <el-input v-model="addForm.bank" @keyup.enter.native="addSupplier"></el-input>
                            </el-form-item>
                            <el-form-item label="银行账户" prop="bankAccount">
                                <el-input v-model="addForm.bankAccount" @keyup.enter.native="addSupplier"></el-input>
                            </el-form-item>
                            <el-form-item label="开户名" prop="bankName">
                                <el-input v-model="addForm.bankName" @keyup.enter.native="addSupplier"></el-input>
                            </el-form-item>
                            <el-form-item label="税号" prop="taxNumber">
                                <el-input v-model="addForm.taxNumber" @keyup.enter.native="addSupplier"></el-input>
                            </el-form-item>
<%--                            <el-form-item label="欠款" prop="debts">--%>
<%--                                <el-input v-model="addForm.debts"> @keyup.enter.native="addSupplier"</el-input>--%>
<%--                            </el-form-item>--%>
                            <el-form-item label="备注" prop="info">
                                <el-input v-model="addForm.info" @keyup.enter.native="addSupplier"></el-input>
                            </el-form-item>
                        </el-form>
                        <!-- 底部区域 -->
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="addDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="addSupplier">确 定</el-button>
                          </span>
                    </el-dialog>

                    <!-- 修改对话框 -->
                    <el-dialog title="编辑类型信息" :visible.sync="editDialogVisible" width="500px" @close="editDialogClosed"
                               @submit.native.prevent>
                        <el-form :model="editForm" :rules="addFormRules"  ref="editFormRef" label-width="70px">
                            <el-form-item label="id" prop="id" >
                                <el-input v-model="editForm.id" disabled></el-input>
                            </el-form-item>
                            <el-form-item label="供应商名" prop="name">
                                <el-input v-model="editForm.name" @keyup.enter.native="editSupplierSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="负责人">
                                <template>
                                    <el-select v-model="editForm.staffId" placeholder="请选择">
                                        <el-option
                                                v-for="item in staffOption"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </el-form-item>
                            <el-form-item label="所在公司" prop="companyName">
                                <el-input v-model="editForm.companyName" @keyup.enter.native="editSupplierSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="地址" prop="address">
                                <el-input v-model="editForm.address" @keyup.enter.native="editSupplierSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="手机" prop="telephone">
                                <el-input v-model="editForm.telephone" @keyup.enter.native="editSupplierSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="邮箱" prop="email">
                                <el-input v-model="editForm.email" @keyup.enter.native="editSupplierSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="网站" prop="site">
                                <el-input v-model="editForm.site" @keyup.enter.native="editSupplierSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="开户行" prop="bank">
                                <el-input v-model="editForm.bank" @keyup.enter.native="editSupplierSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="银行账户" prop="bankAccount">
                                <el-input v-model="editForm.bankAccount" @keyup.enter.native="editSupplierSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="开户名" prop="bankName">
                                <el-input v-model="editForm.bankName" @keyup.enter.native="editSupplierSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="税号" prop="taxNumber">
                                <el-input v-model="editForm.taxNumber" @keyup.enter.native="editSupplierSubmit"></el-input>
                            </el-form-item>
<%--                            <el-form-item label="欠款" prop="debts">--%>
<%--                                <el-input v-model="editForm.debts" @keyup.enter.native="editSupplierSubmit"></el-input>--%>
<%--                            </el-form-item>--%>
                            <el-form-item label="备注" prop="info">
                                <el-input v-model="editForm.info" @keyup.enter.native="editSupplierSubmit"></el-input>
                            </el-form-item>
                        </el-form>
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="editDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="editSupplierSubmit">确 定</el-button>
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
                supplierList:[],
                total: 0,
                addDialogVisible: false,
                addForm: {
                    name:'',
                    companyName:'',
                    address:'',
                    telephone:'',
                    email:'',
                    site:'',
                    bank:'',
                    bankAccount:'',
                    bankName:'',
                    taxNumber:'',
                    debts:0,
                    info:'',
                },
                addFormRules: {
                    name: [
                        { required: true, message: '请输入供应商名', trigger: 'blur' }
                    ],
                    companyName: [
                        { required: true, message: '请输入所在公司', trigger: 'blur' }
                    ],
                    address: [
                        { required: true, message: '请输入地址', trigger: 'blur' }
                    ],
                    telephone: [
                        {
                            validator: function(rule, value, callback) {
                                if (/^1[34578]\d{9}$/.test(value) == false && value != '') {
                                    callback(new Error("请输入正确的手机号"));
                                } else {
                                    callback();
                                }
                            },
                            trigger: "blur"
                        }
                    ],
                    email: [
                        {
                            validator: function(rule, value, callback) {
                                if (
                                    /^\w{1,64}@[a-z0-9\-]{1,256}(\.[a-z]{2,6}){1,2}$/i.test(
                                        value
                                    ) == false  && value != ''
                                ) {
                                    callback(new Error("请输入正确的邮箱"));
                                } else {
                                    callback();
                                }
                            },
                            trigger: "blur"
                        }
                    ],
                    site: [
                        { required: true, message: '请输入网站', trigger: 'blur' }
                    ],
                    bank: [
                        { required: true, message: '请输入开户行', trigger: 'blur' }
                    ],
                    bankAccount: [
                        { required: true, message: '请输入银行账户', trigger: 'blur' }
                    ],
                    bankName: [
                        { required: true, message: '请输入开户名', trigger: 'blur' }
                    ],
                    taxNumber: [
                        { required: true, message: '请输入税号', trigger: 'blur' }
                    ],
                    debts: [
                        { required: true, message: '请输入欠款', trigger: 'blur' }
                    ],
                    info: [
                        { required: true, message: '请输入备注', trigger: 'blur' }
                    ],
                },
                editDialogVisible: false,
                editForm: {
                    id:'',
                    name:'',
                    companyName:'',
                    address:'',
                    telephone:'',
                    email:'',
                    site:'',
                    bank:'',
                    bankAccount:'',
                    bankName:'',
                    taxNumber:'',
                    debts:0,
                    info:'',
                    staffId:1000
                },
                staffOption:[]
            }

        }
        ,
        created() {
            this.getSupplierList()
            this.init()
            this.getStaffIdAndName()
        },
        methods: {
            init()
            {
                <%@ include file="../public/setHeight.jsp" %>
                <%@ include file="../public/getUsername.jsp" %>
                <%@ include file="../public/admin/roleJudge.jsp" %>
                document.getElementById("basicInfoAdmin").style.color = "#409EFF";
                document.getElementById("basicInfoAdminIco").style.color = "#409EFF"
            },
            <%@ include file="../public/admin/setJump.jsp" %>
            async getSupplierList() {
                this.queryInfo.token = window.localStorage.getItem("token")
                this.loading = true;
                let url =  '/getSupplierList';
                axios.get(url, {
                    params: this.queryInfo
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        this.loading = false;
                        this.supplierList = res.data.data;
                        this.total = res.data.total;
                    }
                    else
                    {
                        return this.$message.error('获取数据失败！')
                    }
                }).catch(err => {
                })
            },
            getStaffIdAndName(){
                let url =  '/getStaffIdAndName';
                axios.get(url, {
                    params:{token:window.localStorage.getItem("token")}
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        let len = res.data.data.length
                        let len2 = this.staffOption.length
                        if(len2 === 0)
                        {
                            for(let i = 0 ; i < len ; i ++)
                            {
                                this.staffOption.push(
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
                        return this.$message.error('获取数据失败！')
                    }
                }).catch(err => {
                })
            },
            handleSizeChange(newSize) {
                this.queryInfo.pre = newSize
                this.getSupplierList()
            },
            handleCurrentChange(newPage) {
                this.queryInfo.page = newPage
                this.getSupplierList()
            },
            addDialogOpen()
            {
                this.addDialogVisible = true
            },
            addDialogClosed() {
                this.$refs.addFormRef.resetFields()
                this.addDialogVisible = false
            },
            addSupplier() {
                this.$refs.addFormRef.validate(async valid => {
                    if (!valid) return
                    let result =  axios({
                        method: 'post',
                        url: '/addSupplier',
                        headers: { 'content-type': 'application/x-www-form-urlencoded'},
                        data: Qs.stringify({
                            name:this.addForm.name,
                            companyName:this.addForm.companyName,
                            address:this.addForm.address,
                            telephone:this.addForm.telephone,
                            email:this.addForm.email,
                            site:this.addForm.site,
                            bank:this.addForm.bank,
                            bankAccount:this.addForm.bankAccount,
                            bankName:this.addForm.bankName,
                            taxNumber:this.addForm.taxNumber,
                            debts:this.addForm.debts,
                            info:this.addForm.info,
                            token: window.localStorage.getItem("token")
                        })
                    });
                    result.then(res=>{
                        if(res.data.error === "0")
                        {
                            this.getSupplierList()
                            this.addDialogClosed()
                            this.$message.success("操作成功")
                        }
                    })
                })
            },
            async editSupplier(id){
                this.editForm.id = id
                this.editDialogVisible = true
                // console.log(id)
                const { data: res } = await axios.get('/getSupplierById'
                    ,{params:{id:id,token:window.localStorage.getItem("token")}})
                if (res.error !== "0") {
                    return this.$message.error('获取数据失败！')
                }
                this.editForm.id = res.data.id
                this.editForm.name = res.data.name
                this.editForm.companyName = res.data.companyName
                this.editForm.address = res.data.address
                this.editForm.telephone = res.data.telephone
                this.editForm.email = res.data.email
                this.editForm.site = res.data.site
                this.editForm.bank = res.data.bank
                this.editForm.bankAccount = res.data.bankAccount
                this.editForm.bankName = res.data.bankName
                this.editForm.taxNumber = res.data.taxNumber
                this.editForm.debts = res.data.debts
                this.editForm.info = res.data.info
            },
            // 监听修改对话框的关闭事件
            editDialogClosed() {
                this.$refs.editFormRef.resetFields()
                this.editDialogVisible = false
            },
            // 修改信息并提交
            editSupplierSubmit() {
                this.$refs.editFormRef.validate(async valid => {
                    if (!valid) return
                    let result =  axios({
                        method: 'put',
                        url: '/updateSupplierById',
                        headers: { 'content-type': 'application/x-www-form-urlencoded'},
                        data: Qs.stringify({
                            id:this.editForm.id,
                            name:this.editForm.name,
                            companyName:this.editForm.companyName,
                            address:this.editForm.address,
                            telephone:this.editForm.telephone,
                            email:this.editForm.email,
                            site:this.editForm.site,
                            bank:this.editForm.bank,
                            bankAccount:this.editForm.bankAccount,
                            bankName:this.editForm.bankName,
                            taxNumber:this.editForm.taxNumber,
                            debts:this.editForm.debts,
                            info:this.editForm.info,
                            staffId:this.editForm.staffId,
                            token: window.localStorage.getItem("token")
                        })
                    });
                    result.then(res=>{
                        if(res.data.error === "0")
                        {
                            this.getSupplierList()
                            this.editDialogClosed()
                            this.$message.success("操作成功")
                        }
                    })
                })
            },
            // 根据Id删除
            async deleteSupplierById(id) {
                const confirmResult = await this.$confirm(
                    '此操作将永久删除该供应商, 是否继续?',
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

                const {data: res} = await axios.delete('/deleteSupplierById',
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
                await this.getSupplierList()
            },
            back()
            {
                window.location.href="/admin/basicInfoAdmin";
            },
        }
    })
</script>
</body>
</html>
