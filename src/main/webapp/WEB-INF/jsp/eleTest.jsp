<%--
  Created by IntelliJ IDEA.
  User: teleport
  Date: 2021/2/3
  Time: 8:02 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>eleTest</title>
    <script src="${pageContext.request.contextPath}/resources/js/axios.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/qs.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/element-ui/lib/theme-chalk/index.css">
    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/element-ui/lib/index.js"></script>
</head>
<body>
<div id="app">
    <el-container>
        <el-header>
            <div>
                <p style="font-size: 16px;padding-left: 10px">企业仓库管理系统 * Login as
                    <el-tag effect="dark" size="mini" style="margin-left: 3px">teleport</el-tag>
                </p>
            </div>
            <el-button type="success">退出</el-button>
        </el-header>
        <el-container>
            <el-aside width="220px" :style="asideStyle">
                <el-menu background-color="#333744"
                         text-color="#fff" active-text-color="#409EFF"
                         default-active="1" class="el-menu-vertical-demo">
                    <el-menu-item index="1" style="width: 220px">
                        <i class="el-icon-user-solid"></i>
                        <span slot="title">用户管理</span>
                    </el-menu-item>
                    <el-menu-item index="2" style="width: 220px">
                        <i class="el-icon-s-goods"></i>
                        <span slot="title">原料与产品信息管理</span>
                    </el-menu-item>
                    <el-menu-item index="3" style="width: 220px">
                        <i class="el-icon-help"></i>
                        <span slot="title">采购入库信息管理</span>
                    </el-menu-item>
                    <el-menu-item index="4" style="width: 220px">
                        <i class="el-icon-s-shop"></i>
                        <span slot="title">生产销售出库信息管理</span>
                    </el-menu-item>
                    <el-menu-item index="5" style="width: 220px">
                        <i class="el-icon-s-order"></i>
                        <span slot="title">库存信息管理</span>
                    </el-menu-item>
                    <el-menu-item index="6" style="width: 220px">
                        <i class="el-icon-menu"></i>
                        <span slot="title">基本CRM管理</span>
                    </el-menu-item>
                </el-menu>
            </el-aside>
            <el-main :style="mainStyle">
                <div>
                    <!-- 卡片视图区域 -->
                    <el-card>
                        <!-- 搜索与添加区域 -->
                        <el-row :gutter="20">
                            <el-col :span="8">
                                <el-input placeholder="请输入内容" v-model="queryInfo.key" clearable @clear="getAnnList"
                                          @keyup.enter.native="getAnnList">
                                    <el-button slot="append" icon="el-icon-search"></el-button>
                                </el-input>
                            </el-col>
                            <el-col :span="4">
                                <el-button type="primary" @click="addDialogVisible = true">创建公告</el-button>
                            </el-col>
                        </el-row>
                        <br>
                        <!-- 列表区域 stripe 斑马-->
                        <el-table :data="userlist" border stripe v-loading="loading"
                                  :header-cell-style="{'text-align':'center','font-size':'14px'}"
                                  :cell-style="{'text-align':'center','font-size':'14px'}">
                            <!--                索引列-->
                            <el-table-column label="ID" prop="id" min-width="10%"></el-table-column>
                            <el-table-column label="标题" prop="title" min-width="10%"></el-table-column>
                            <el-table-column label="创建时间" prop="date" min-width="20%"></el-table-column>
                            <el-table-column label="可见性" width="70px">
                                <template slot-scope="scope">
                                    <el-switch v-model="scope.row.visible" @change="changeAnnVisible(scope.row.id)">
                                    </el-switch>
                                </template>
                            </el-table-column>
                            <el-table-column label="作者" prop="authorName" min-width="20%"></el-table-column>
                            <el-table-column label="操作" width="125px">
                                <template slot-scope="scope">
                                    <!-- 编辑按钮 -->
                                    <!--enterable=false表示鼠标进入tooltip区域自动隐藏-->
                                    <el-tooltip effect="dark" content="编辑" placement="top" :enterable="false">
                                        <el-button type="primary" icon="el-icon-edit" size="mini"
                                                   @click="editAnn(scope.row.id)"></el-button>
                                    </el-tooltip>
                                    <!-- 删除按钮 -->
                                    <el-tooltip effect="dark" content="删除" placement="top" :enterable="false">
                                        <el-button type="danger" icon="el-icon-delete" size="mini"
                                                   @click="removeAnnById(scope.row.id)"></el-button>
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
                    <!-- 创建的对话框 -->
                    <el-dialog title="创建公告" :visible.sync="addDialogVisible" width="50%" @close="addDialogClosed"
                               @submit.native.prevent>
                        <!-- 内容主体区域 -->
                        <el-form :model="addForm" :rules="addFormRules" ref="addFormRef" label-width="70px">
                            <el-form-item label="标题" prop="title">
                                <el-input v-model="addForm.title" @keyup.enter.native="createAnn"></el-input>
                            </el-form-item>
                            <el-form-item label="内容" prop="content">
                                <el-input v-model="addForm.content" type="textarea" :rows="8"></el-input>
                            </el-form-item>
                        </el-form>
                        <!-- 底部区域 -->
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="addDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="createAnn">确 定</el-button>
                          </span>
                    </el-dialog>

                    <!-- 修改公告的对话框 -->
                    <el-dialog title="修改公告" :visible.sync="editDialogVisible" width="500px" @close="editDialogClosed"
                               @submit.native.prevent>
                        <el-form :model="editForm" :rules="editFormRules" ref="editFormRef" label-width="70px">
                            <el-form-item label="id" prop="id">
                                <el-input v-model="editForm.id" disabled></el-input>
                            </el-form-item>
                            <el-form-item label="标题" prop="title">
                                <el-input v-model="editForm.title"
                                          @keyup.enter.native="editAnnSubmit"></el-input>
                            </el-form-item>
                            <el-form-item label="内容" prop="content">
                                <el-input v-model="editForm.content"
                                          type="textarea" :rows="8">
                                </el-input>
                            </el-form-item>
                        </el-form>
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="editDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="editAnnSubmit">确 定</el-button>
                        </span>
                    </el-dialog>
                </div>
            </el-main>
        </el-container>
    </el-container>
</div>
<style>
    body {
        margin: 0;
        padding: 0;
    }
    .el-header {
        background-color: #333744;
        display: flex;
        justify-content: space-between;
        padding-left: 0;
        align-items: center;
        color: #fff;
        font-size: 20px;
    }
</style>
<script>
    new Vue({
        el: '#app',
        data: {
            activeIndex: '1',
            activeIndex2: '1',
            height: 100,
            asideStyle: 'background:#333744;' + 'height:'
                + document.documentElement.clientHeight + 'px',
                // +';padding:0;margin:0',
            mainStyle: 'background:#eaedf1;' + 'height:'
                + document.documentElement.clientHeight + 'px',
            loading:true,
            // 获取用户列表的参数对象
            queryInfo: {
                // 当前的页数
                page: 1,
                // 当前每页显示多少条数据
                pre: 5,
                token: "",
                key:""
            },
            userlist:[
                {id:1,title:"title1",date:"2020-1-4",visible:true,authorName:"user1"},
                {id:2,title:"title2",date:"2020-1-4",visible:false,authorName:"user2"},
                {id:3,title:"title2",date:"2020-1-4",visible:false,authorName:"user2"},
                {id:4,title:"title2",date:"2020-1-4",visible:false,authorName:"user2"},
                {id:5,title:"title2",date:"2020-1-4",visible:false,authorName:"user2"},
                // {id:6,title:"title2",date:"2020-1-4",visible:false,authorName:"user2"},
                // {id:7,title:"title2",date:"2020-1-4",visible:false,authorName:"user2"},
                // {id:8,title:"title2",date:"2020-1-4",visible:false,authorName:"user2"},
                // {id:9,title:"title2",date:"2020-1-4",visible:false,authorName:"user2"},
                // {id:10,title:"title2",date:"2020-1-4",visible:false,authorName:"user2"},
                // {id:11,title:"title2",date:"2020-1-4",visible:false,authorName:"user2"},
                // {id:12,title:"title2",date:"2020-1-4",visible:false,authorName:"user2"}
            ],
            total: 12,
            // 控制添加用户对话框的显示与隐藏
            addDialogVisible: false,
            // 添加用户的表单数据
            addForm: {
                title:"",
                content:""
            },
            // 添加表单的验证规则对象
            addFormRules: {
                title: [
                    { required: true, message: '请输入标题', trigger: 'blur' }
                ],
                content: [
                    { required: true, message: '请输入内容', trigger: 'blur' },
                ]
            },
            // 控制修改用户对话框的显示与隐藏
            editDialogVisible: false,
            // 下面是编辑用户
            // 查询到的用户信息对象
            editForm: {
                id:0,
                title:"",
                content:""
            },
            // 修改表单的验证规则对象
            editFormRules: {
                title: [
                    { required: true, message: '请输入标题', trigger: 'blur' }
                ],
                content: [
                    { required: true, message: '请输入内容', trigger: 'blur' },
                ]
            },
            // 控制分配角色对话框的显示与隐藏
            editAnnDialogVisible: false
        }
        ,
        created() {
            this.getAnnList()
        },
        methods: {
            async getHello() {
                let url = "http://localhost:8080/hello";
                let params = {
                    id: "{*}测试"
                }
                axios.get(url, {
                    params: {
                        id: "111"
                    }
                }).then(res => {
                    this.info = res.data;
                    this.$message.success("success")
                }).catch(err => {
                    console.log(err);
                })
            },
            async getAnnList() {
                this.loading = false;
            },
            // 监听 pagesize 改变的事件
            handleSizeChange(newSize) {
                // console.log(newSize)
                this.queryInfo.pre = newSize
                this.getAnnList()
            },
            // 监听 页码值 改变的事件
            handleCurrentChange(newPage) {
                // console.log(newPage)
                this.queryInfo.page = newPage
                this.getAnnList()
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
                    this.getAnnList()
                })
            },
            // 监听添加用户对话框的关闭事件 重置表单
            addDialogClosed() {
                this.$refs.addFormRef.resetFields()
            },
            // 点击按钮，创建新公告
            createAnn() {
                //预验证
                this.$refs.addFormRef.validate(async valid => {
                    //未通过则return
                    if (!valid) return
                    //通过
                    let result =  this.$axios({
                        method: 'post',
                        url: '/createAnn',
                        headers: { 'content-type': 'application/x-www-form-urlencoded'},
                        data: qs.stringify({
                            title:this.addForm.title,
                            content:this.addForm.content,
                            token:window.localStorage.getItem("token")
                        })
                    });
                    result.then(res=>{
                        var error = res.data.error;
                        if(error === '0')
                        {
                            this.$message.success('创建公告成功')
                            this.$refs.addFormRef.resetFields()
                            this.addDialogVisible = false
                        }
                        else
                            this.$message.warning('创建公告失败')
                        this.getAnnList()

                    })
                })
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
                //         this.getAnnList()
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
                // this.getAnnList()
            }
        }
    })
</script>
</body>
</html>