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
    <title>仓库管理</title>
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
                            <el-col :span="2">
                                <el-button type="primary" @click="back()" size="middle">返回</el-button>
                            </el-col>
                            <el-col :span="8">
                                <el-input placeholder="按仓库名查找" v-model="queryInfo.key" clearable @clear="getWarehouseList"
                                          @keyup.enter.native="getWarehouseList">
                                    <el-button slot="append" icon="el-icon-search" @Click="getWarehouseList"></el-button>
                                </el-input>
                            </el-col>
                            <el-col :span="2">
                                <el-button type="primary" @click="addDialogOpen">新建仓库信息</el-button>
                            </el-col>
                        </el-row>
                        <br>
                        <el-table :data="warehouseList" border stripe v-loading="loading"
                                  :header-cell-style="{'text-align':'center','font-size':'14px'}"
                                  :cell-style="{'text-align':'center','font-size':'14px'}">
                            <el-table-column label="ID" prop="id" min-width="10%"></el-table-column>
                            <el-table-column label="仓库名" prop="name" min-width="20%"></el-table-column>
                            <el-table-column label="所在地" prop="position" mind-width="20%"></el-table-column>
                            <el-table-column label="备注" prop="info" min-width="20%"></el-table-column>
                            <el-table-column label="操作" width="187px">
                                <template slot-scope="scope">
                                    <el-tooltip effect="dark" content="编辑" placement="top" :enterable="false">
                                        <el-button type="primary" icon="el-icon-edit" size="mini"
                                                   @click="editWarehouse(scope.row.id)"></el-button>
                                    </el-tooltip>
                                    <el-tooltip effect="dark" content="删除" placement="top" :enterable="false">
                                        <el-button type="danger" icon="el-icon-delete" size="mini"
                                                   @click="deleteWarehouseById(scope.row.id)"
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
                    <el-dialog title="新建仓库" :visible.sync="addDialogVisible" width="50%" @close="addDialogClosed"
                               @submit.native.prevent>
                        <!-- 内容主体区域 -->
                        <el-form :model="addForm" :rules="addFormRules" ref="addFormRef" label-width="70px">
                            <el-form-item label="仓库名" prop="name">
                                <el-input v-model="addForm.name" @keyup.enter.native="addWarehouse"></el-input>
                            </el-form-item>
                            <el-form-item label="所在地" prop="position">
                                <el-input v-model="addForm.position" @keyup.enter.native="addWarehouse"></el-input>
                            </el-form-item>
                            <el-form-item label="备注" prop="info">
                                <el-input v-model="addForm.info" @keyup.enter.native="addWarehouse"></el-input>
                            </el-form-item>
                        </el-form>
                        <!-- 底部区域 -->
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="addDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="addWarehouse">确 定</el-button>
                          </span>
                    </el-dialog>

                    <!-- 修改对话框 -->
                    <el-dialog title="编辑仓库信息" :visible.sync="editDialogVisible" width="500px" @close="editDialogClosed"
                               @submit.native.prevent>
                        <el-form :model="editForm" :rules="addFormRules"  ref="editFormRef" label-width="70px">
                            <el-form-item label="id" prop="id" >
                                <el-input v-model="editForm.id" disabled></el-input>
                            </el-form-item>
                            <el-form-item label="仓库名" prop="name">
                                <el-input v-model="editForm.name" @keyup.enter.native="editWarehouseSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="所在地" prop="position">
                                <el-input v-model="editForm.position" @keyup.enter.native="editWarehouseSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="备注" prop="info">
                                <el-input v-model="editForm.info" @keyup.enter.native="editWarehouseSubmit"></el-input>
                            </el-form-item>
                        </el-form>
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="editDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="editWarehouseSubmit">确 定</el-button>
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
                warehouseList:[],
                total: 0,
                addDialogVisible: false,
                addForm: {
                    name:'',
                    position:'',
                    info:''
                },
                addFormRules: {
                    name: [
                        { required: true, message: '请输入仓库名', trigger: 'blur' }
                    ],
                    position: [
                        { required: true, message: '请输入所在地', trigger: 'blur' }
                    ],
                    info: [
                        { required: true, message: '请输入备注', trigger: 'blur' }
                    ],
                },
                editDialogVisible: false,
                editForm: {
                    id:'',
                    name:'',
                    position:'',
                    info:''
                }
            }

        }
        ,
        created() {
            this.getWarehouseList()
            this.init()
        },
        methods: {
            init()
            {
                <%@ include file="../public/setHeight.jsp" %>
                <%@ include file="../public/getUsername.jsp" %>
                <%@ include file="../public/superAdmin/roleJudge.jsp" %>
                document.getElementById("basicInfoAdmin").style.color = "#409EFF";
                document.getElementById("basicInfoAdminIco").style.color = "#409EFF"
            },
            <%@ include file="../public/superAdmin/setJump.jsp" %>
            async getWarehouseList() {
                this.queryInfo.token = window.localStorage.getItem("token")
                this.loading = true;
                let url =  '/getWarehouseList';
                axios.get(url, {
                    params: this.queryInfo
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        this.loading = false;
                        this.warehouseList = res.data.data;
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
                this.getWarehouseList()
            },
            handleCurrentChange(newPage) {
                this.queryInfo.page = newPage
                this.getWarehouseList()
            },
            addDialogOpen()
            {
                this.addDialogVisible = true
            },
            addDialogClosed() {
                this.$refs.addFormRef.resetFields()
                this.addDialogVisible = false
            },
            addWarehouse() {
                this.$refs.addFormRef.validate(async valid => {
                    if (!valid) return
                    let result =  axios({
                        method: 'post',
                        url: '/addWarehouse',
                        headers: { 'content-type': 'application/x-www-form-urlencoded'},
                        data: Qs.stringify({
                            name:this.addForm.name,
                            position:this.addForm.position,
                            info:this.addForm.info,
                            token: window.localStorage.getItem("token")

                        })
                    });
                    result.then(res=>{
                        if(res.data.error === "0")
                        {
                            this.getWarehouseList()
                            this.addDialogClosed()
                            this.$message.success("操作成功")
                        }
                    })
                })
            },
            async editWarehouse(id){
                this.editForm.id = id
                this.editDialogVisible = true
                // console.log(id)
                const { data: res } = await axios.get('/getWarehouseById'
                    ,{params:{id:id,token:window.localStorage.getItem("token")}})
                if (res.error !== "0") {
                    return this.$message.error('获取数据失败！')
                }
                this.editForm.id = id;
                this.editForm.name = res.data.name
                this.editForm.position = res.data.position
                this.editForm.info = res.data.info
            },
            // 监听修改对话框的关闭事件
            editDialogClosed() {
                this.$refs.editFormRef.resetFields()
                this.editDialogVisible = false
            },
            // 修改信息并提交
            editWarehouseSubmit() {
                this.$refs.editFormRef.validate(async valid => {
                    if (!valid) return
                    let result =  axios({
                        method: 'put',
                        url: '/updateWarehouseById',
                        headers: { 'content-type': 'application/x-www-form-urlencoded'},
                        data: Qs.stringify({
                            id:this.editForm.id,
                            name:this.editForm.name,
                            position:this.editForm.position,
                            info:this.editForm.info,
                            token: window.localStorage.getItem("token")
                        })
                    });
                    result.then(res=>{
                        if(res.data.error === "0")
                        {
                            this.getWarehouseList()
                            this.editDialogClosed()
                            this.$message.success("操作成功")
                        }
                    })
                })
            },
            // 根据Id删除
            async deleteWarehouseById(id) {
                const confirmResult = await this.$confirm(
                    '此操作将永久删除该仓库, 是否继续?',
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

                const {data: res} = await axios.delete('/deleteWarehouseById',
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
                await this.getWarehouseList()
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
