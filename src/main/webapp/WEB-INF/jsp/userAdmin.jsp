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
    <title>原料与产品信息管理</title>
    <script src="${pageContext.request.contextPath}/resources/js/axios.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/qs.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/public.css">
    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/element-ui/lib/index.js"></script>
</head>
<body>

<div id="app" v-cloak>
    <el-container>
        <%@ include file="public/header.jsp" %>
        <el-container>
            <%@ include file="public/aside.jsp" %>
            <el-main id="elMain">
                <div>
                    <!-- 卡片 -->
                    <el-card>
                        <!-- 搜索 -->
                        <el-row :gutter="20">
                            <el-col :span="8">
                                <el-input placeholder="查找用户名或姓名" v-model="queryInfo.key" clearable @clear="getStaffList"
                                          @keyup.enter.native="getStaffList">
                                    <el-button slot="append" icon="el-icon-search"></el-button>
                                </el-input>
                            </el-col>
                            <el-col :span="4">
                                <el-button type="primary" @click="addDialogVisible = true">创建公告</el-button>
                            </el-col>
                        </el-row>
                        <br>
                        <%--                        id,username,name,sex,age,type--%>
                        <el-table :data="staffList" border stripe v-loading="loading"
                                  :header-cell-style="{'text-align':'center','font-size':'14px'}"
                                  :cell-style="{'text-align':'center','font-size':'14px'}">
                            <el-table-column label="ID" prop="id" min-width="5%"></el-table-column>
                            <el-table-column label="姓名" prop="name" min-width="10%"></el-table-column>
                            <el-table-column label="登录名" prop="username" min-width="10%"></el-table-column>
                            <el-table-column label="性别" prop="sex" min-width="5%"></el-table-column>
                            <el-table-column label="年龄" prop="age" min-width="5%"></el-table-column>
                            <el-table-column label="类型" prop="type" min-width="5%"></el-table-column>
                            <el-table-column label="操作" width="125px">
                                <template slot-scope="scope">
                                    <el-tooltip effect="dark" content="编辑" placement="top" :enterable="false">
                                        <el-button type="primary" icon="el-icon-edit" size="mini"
<%--                                                   @click="editAnn(scope.row.id)"--%>
                                        ></el-button>
                                    </el-tooltip>
                                    <!-- 删除按钮 -->
                                    <el-tooltip effect="dark" content="删除" placement="top" :enterable="false">
                                        <el-button type="danger" icon="el-icon-delete" size="mini"
<%--                                                   @click="removeAnnById(scope.row.id)"--%>
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
<%--                    <el-dialog title="创建新的用户" :visible.sync="addDialogVisible" width="50%" @close="addDialogClosed"--%>
<%--                               @submit.native.prevent>--%>
<%--                        <!-- 内容主体区域 -->--%>
<%--                        <el-form :model="addForm" :rules="addFormRules" ref="addFormRef" label-width="70px">--%>
<%--                            <el-form-item label="标题" prop="title">--%>
<%--                                <el-input v-model="addForm.title" @keyup.enter.native="createAnn"></el-input>--%>
<%--                            </el-form-item>--%>
<%--                            <el-form-item label="内容" prop="content">--%>
<%--                                <el-input v-model="addForm.content" type="textarea" :rows="8"></el-input>--%>
<%--                            </el-form-item>--%>
<%--                        </el-form>--%>
<%--                        <!-- 底部区域 -->--%>
<%--                        <span slot="footer" class="dialog-footer">--%>
<%--                            <el-button @click="addDialogVisible = false">取 消</el-button>--%>
<%--                            <el-button type="primary" @click="createAnn">确 定</el-button>--%>
<%--                          </span>--%>
<%--                    </el-dialog>--%>

                    <!-- 修改对话框 -->
<%--                    <el-dialog title="修改公告" :visible.sync="editDialogVisible" width="500px" @close="editDialogClosed"--%>
<%--                               @submit.native.prevent>--%>
<%--                        <el-form :model="editForm" :rules="editFormRules" ref="editFormRef" label-width="70px">--%>
<%--                            <el-form-item label="id" prop="id">--%>
<%--                                <el-input v-model="editForm.id" disabled></el-input>--%>
<%--                            </el-form-item>--%>
<%--                            <el-form-item label="标题" prop="title">--%>
<%--                                <el-input v-model="editForm.title"--%>
<%--                                          @keyup.enter.native="editAnnSubmit"></el-input>--%>
<%--                            </el-form-item>--%>
<%--                            <el-form-item label="内容" prop="content">--%>
<%--                                <el-input v-model="editForm.content"--%>
<%--                                          type="textarea" :rows="8">--%>
<%--                                </el-input>--%>
<%--                            </el-form-item>--%>
<%--                        </el-form>--%>
<%--                        <span slot="footer" class="dialog-footer">--%>
<%--                            <el-button @click="editDialogVisible = false">取 消</el-button>--%>
<%--                            <el-button type="primary" @click="editAnnSubmit">确 定</el-button>--%>
<%--                        </span>--%>
<%--                    </el-dialog>--%>
                </div>
            </el-main>
        </el-container>
    </el-container>
</div>

<script>
    new Vue({
        el: '#app',
        data: {
            loading:true,
            queryInfo: {
                page: 1,
                pre: 5,
                key:""
            },
            staffList:[],
            total: 0,
            addDialogVisible: false,
            addForm: {
                title:"",
                content:""
            },
            addFormRules: {
                title: [
                    { required: true, message: '请输入标题', trigger: 'blur' }
                ],
                content: [
                    { required: true, message: '请输入内容', trigger: 'blur' },
                ]
            },
            editDialogVisible: false,
            editForm: {
                id:0,
                title:"",
                content:""
            },
            editFormRules: {
                title: [
                    { required: true, message: '请输入标题', trigger: 'blur' }
                ],
                content: [
                    { required: true, message: '请输入内容', trigger: 'blur' },
                ]
            },
        }
        ,
        created() {
            this.getStaffList()
            this.init()
        },
        methods: {
            init()
            {
                <%@ include file="public/setHeight.jsp" %>
                document.getElementById("staffAdmin").style.color = "#409EFF";
                document.getElementById("staffAdminIco").style.color = "#409EFF"
            },
            async getStaffList() {
                this.loading = true;
                let url = "http://localhost:8080/getStaffList";
                axios.get(url, {
                    params: this.queryInfo
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        this.loading = false;
                        this.staffList = res.data.data;
                        this.total = res.data.total;
                        // this.$message.success("success")
                    }
                }).catch(err => {
                    console.log(err);
                })
            },
            // 监听 pagesize 改变的事件
            handleSizeChange(newSize) {
                // console.log(newSize)
                this.queryInfo.pre = newSize
                this.getStaffList()
            },
            // 监听 页码值 改变的事件
            handleCurrentChange(newPage) {
                // console.log(newPage)
                this.queryInfo.page = newPage
                this.getStaffList()
            },
            // 监听 switch 开关状态的改变
            async changeAnnVisible(id) {

                let result =  this.$axios({
                    method: 'put',
                    url: '/changeAnnVisibleById',
                    headers: { 'content-type': 'application/x-www-form-urlencoded'},
                    data: qs.stringify({
                        id:id,
                        token: window.localStorage.getItem("token")
                    })
                });
                result.then(res=>{
                    var error = res.data.error;
                    if(error === '0')
                    {
                        this.$message.success('更改可用性成功')
                    }
                    else
                        this.$message.warning('越权操作')
                    this.getStaffList()
                })
            },
            // 监听添加用户对话框的关闭事件 重置表单
            addDialogClosed() {
                this.$refs.addFormRef.resetFields()
            },
            // 点击按钮，创建新公告
            createAnn() {
                //预验证
                // this.$refs.addFormRef.validate(async valid => {
                //     //未通过则return
                //     if (!valid) return
                //     //通过
                //     let result =  this.$axios({
                //         method: 'post',
                //         url: '/createAnn',
                //         headers: { 'content-type': 'application/x-www-form-urlencoded'},
                //         data: qs.stringify({
                //             title:this.addForm.title,
                //             content:this.addForm.content,
                //             token:window.localStorage.getItem("token")
                //         })
                //     });
                //     result.then(res=>{
                //         var error = res.data.error;
                //         if(error === '0')
                //         {
                //             this.$message.success('创建公告成功')
                //             this.$refs.addFormRef.resetFields()
                //             this.addDialogVisible = false
                //         }
                //         else
                //             this.$message.warning('创建公告失败')
                //         this.getStaffList()
                //
                //     })
                // })
            },
            // 展示编辑公告对话框
            async editAnn(id) {
                this.editForm.id = id
                this.editDialogVisible = true
                // console.log(id)
                // const { data: res } = await this.$http.get('/getAnnDetailByIdAdmin'
                //     ,{params:{id:id,token:window.localStorage.getItem("token")}})
                // if (res.error !== "0") {
                //     return this.$message.error('获取数据失败！')
                // }
                // this.editForm.title = res.data.title
                // this.editForm.content = res.data.content
                this.editAnnDialogVisible = true
            },
            // 监听修改对话框的关闭事件
            editDialogClosed() {
                this.editForm.passwd = ""
            },
            // 修改信息并提交
            editAnnSubmit() {
                // this.$refs.editFormRef.validate(async valid => {
                //     if (!valid) return
                //
                //     let result =  this.$axios({
                //         method: 'put',
                //         url: '/updateAnn',
                //         headers: { 'content-type': 'application/x-www-form-urlencoded'},
                //         data: qs.stringify({
                //             token:window.localStorage.getItem("token"),
                //             id:this.editForm.id,
                //             title:this.editForm.title,
                //             content:this.editForm.content
                //         })
                //     });
                //     result.then(res=>{
                //         var error = res.data.error;
                //         if(error === '0')
                //         {
                //             this.$message.success('修改成功')
                //             this.editDialogVisible = false
                //         }
                //         else
                //             this.$message.warning('修改失败')
                //         this.getStaffList()
                //     })
                // })
            },
            // 根据Id删除公告
            async removeAnnById(id) {
                // const confirmResult = await this.$confirm(
                //     '此操作将永久删除该公告, 是否继续?',
                //     '提示',
                //     {
                //         confirmButtonText: '确定',
                //         cancelButtonText: '取消',
                //         type: 'warning'
                //     }
                // ).catch(err => err)
                // if (confirmResult !== 'confirm') {
                //     return this.$message.info('已取消删除')
                // }
                //
                // const {data: res} = await this.$http.delete('deleteAnnById',
                //     {
                //         params: {
                //             id: id,
                //             token: window.localStorage.getItem("token")
                //         }
                //     })
                // if (res.error !== "0") {
                //     return this.$message.error('删除公告失败！')
                // }
                // this.$message.success('删除公告成功！')
                // this.getStaffList()
            }
        }
    })
</script>
</body>
</html>
