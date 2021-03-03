<%--
  Created by IntelliJ IDEA.
  User: teleport
  Date: 2021/3/2
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: teleport
  Date: 2021/3/2
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
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
        <el-header>Header</el-header>
        <el-container>
            <el-aside width="200px" style="background: blue">Aside</el-aside>
            <el-container>
                <el-main style="background: yellow">Main</el-main>
                <el-footer style="background: red">Footer</el-footer>
            </el-container>
        </el-container>
    </el-container>
</div>

<script>
    new Vue({
        el: '#app',
        data: {
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
            this.init()
        },
        methods: {
            init()
            {
                <%@ include file="public/setHeight.jsp" %>
                document.getElementById("userAdmin").style.color = "#409EFF";
                document.getElementById("userAdminIco").style.color = "#409EFF";
            },
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
                //         this.getAnnList()
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

