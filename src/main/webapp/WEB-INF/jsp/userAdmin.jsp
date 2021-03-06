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
                                <el-button type="primary" @click="addDialogOpen">新建员工</el-button>
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
                    <el-dialog title="新建员工" :visible.sync="addDialogVisible" width="50%" @close="addDialogClosed"
                               @submit.native.prevent>
                        <!-- 内容主体区域 -->
                        <el-form :model="addForm" :rules="addFormRules" ref="addFormRef" label-width="70px">
                            <el-form-item label="姓名" prop="name">
                                <el-input v-model="addForm.name"></el-input>
                            </el-form-item>
                            <el-form-item label="登录名" prop="username">
                                <el-input v-model="addForm.username"></el-input>
                            </el-form-item>
                            <el-form-item label="性别" prop="sex">
                                <template>
                                    <el-select v-model="sexValue" placeholder="请选择">
                                        <el-option
                                                v-for="item in sexOptions"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </el-form-item>
                            <el-form-item label="年龄" prop="age">
                                <el-input v-model="addForm.age"></el-input>
                            </el-form-item>
                            <el-form-item label="类型" prop="type">
                                <template>
                                    <el-select v-model="typeValue" placeholder="请选择">
                                        <el-option
                                                v-for="item in typeOptions"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </el-form-item>
                            <el-form-item label="手机" prop="phone">
                                <el-input v-model="addForm.phone"></el-input>
                            </el-form-item>
                            <el-form-item label="邮箱" prop="email">
                                <el-input v-model="addForm.email"></el-input>
                            </el-form-item>
                        </el-form>
                        <!-- 底部区域 -->
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="addDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="addStaff">确 定</el-button>
                          </span>
                    </el-dialog>

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
        data()
        {
            isAge = (rule, value, callback) => {
                let reg=/^(?:[1-9][0-9]?|1[01][0-9]|120)$/;
                if(value == undefined){
                    callback([new Error('帐号输入不合法')]);
                }else{
                    if (value && value.length > 0) {
                        if(!reg.test(value)){
                            callback([new Error('请输入正确的年龄')]);
                        }else{
                            callback();
                        }
                    } else if(value.length == 0){
                        callback();
                    }else {
                        callback(new Error('请输入正确的年龄'));
                    }
                }
            }
            return{
                loading:true,
                queryInfo: {
                    page: 1,
                    pre: 5,
                    key:""
                },
                staffList:[],
                total: 0,
                addDialogVisible: false,
                sexOptions: [{
                    value: '男',
                    label: '男'
                }, {
                    value: '女',
                    label: '女'
                }],
                sexValue:"",
                typeOptions: [{
                    value: '员工',
                    label: '员工'
                }, {
                    value: '管理员',
                    label: '管理员'
                }],
                typeValue:"",
                addForm: {
                    name:'',
                    username:'',
                    sex:'',
                    age:'',
                    type:'',
                    phone:'',
                    email:''
                },
                addFormRules: {
                    name: [
                        { required: true, message: '请输入姓名', trigger: 'blur' }
                    ],
                    username: [
                        { required: true, message: '请输入登录名', trigger: 'blur' }
                    ],
                    age: [
                        { required: true, message: '请输入年龄', trigger: 'blur' }
                    ],
                    phone: [
                        {
                            validator: function(rule, value, callback) {
                                if (/^1[34578]\d{9}$/.test(value) == false) {
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
                                    ) == false
                                ) {
                                    callback(new Error("请输入正确的邮箱"));
                                } else {
                                    callback();
                                }
                            },
                            trigger: "blur"
                        }],
                    age: [
                        { required: true, message: '请输入正确的年龄', trigger: 'blur' },
                        { validator: isAge, trigger: 'blur'}
                    ],
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
                let url =  'getStaffList';
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
            handleSizeChange(newSize) {
                this.queryInfo.pre = newSize
                this.getStaffList()
            },
            handleCurrentChange(newPage) {
                this.queryInfo.page = newPage
                this.getStaffList()
            },
            addDialogOpen()
            {
                this.addDialogVisible = true
                this.sexValue = "男"
                this.typeValue = "员工"
            },
            addDialogClosed() {
                this.sexValue = ""
                this.typeValue = ""
                this.$refs.addFormRef.resetFields()
                this.addDialogVisible = false
            },
            addStaff() {
                // 预验证
                this.$refs.addFormRef.validate(async valid => {
                    if (!valid) return
                    let url = "/addStaff";

                    let result =  axios({
                        method: 'post',
                        url: 'addStaff',
                        headers: { 'content-type': 'application/x-www-form-urlencoded'},
                        data: Qs.stringify({
                            name:this.addForm.name,
                            username:this.addForm.username,
                            age:this.addForm.age,
                            phone:this.addForm.phone,
                            email:this.addForm.email,
                            type:this.typeValue,
                            sex:this.sexValue
                        })
                    });
                    result.then(res=>{
                        if(res.data.error === "0")
                        {
                            this.getStaffList()
                            this.addDialogClosed()
                            this.$message.success("success")
                        }
                    })
                })
            },
            // 展示编辑对话框
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
