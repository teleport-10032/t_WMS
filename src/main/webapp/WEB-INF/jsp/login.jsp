<%--
  Created by IntelliJ IDEA.
  User: teleport
  Date: 2021/3/29
  Time: 下午12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html>
<head>
    <title>仓库管理系统-用户登录</title>
    <%@ include file="public/include.jsp"%>
</head>
<body>
<div id="app" v-cloak>
    <el-card style="width: 500px;position: absolute;
                top:30%;left:50%;transform: translate(-50%,-50%)">
        <div slot="header" class="clearfix">
            <span>仓库管理系统-用户登录</span>
            <el-button style="float: right; padding: 3px 0" type="text"
                       @click="resetForm">清空表单</el-button>
        </div>
        <el-form ref="formRef" :model="form"  :rules="formRules" label-width="100px">
            <el-form-item label="身份" prop="type">
                <el-select v-model="form.type" placeholder="请选择">
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="用户名" prop="username">
                <el-input v-model="form.username" placeholder="用户名" @keyup.enter.native="login">
                </el-input>
            </el-form-item>
            <el-form-item label="密码" prop="password">
                <el-input v-model="form.password" placeholder="密码" type="password" @keyup.enter.native="login">
                </el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="login">登录</el-button>
            </el-form-item>
        </el-form>
    </el-card>
</div>
<script>
    new Vue({
        el: '#app',
        data()
        {
            return{
                message:"",
                form: {
                    username:'',
                    password:'',
                    type:'',
                },
                options: [{
                    value: 'superAdmin',
                    label: '超级管理员'
                }, {
                    value: 'crmAdmin',
                    label: 'crm管理员'
                }, {
                    value: 'whAdmin',
                    label: '仓库管理员'
                },],
                formRules: {
                    username: [
                        { required: true, message: '请输入用户名', trigger: 'blur' },
                        { min: 2, max: 15, message: '长度在 2 到 15 个字符', trigger: 'blur' }
                    ],
                    password: [
                        { required: true, message: '请输入密码', trigger: 'blur' },
                        { min: 2, max: 15, message: '长度在 2 到 15 个字符', trigger: 'blur' }
                    ],
                    type: [
                        { required: true, message: '请选择类型', trigger: 'blur' },
                        { min: 2, max: 15, message: '长度在 2 到 15 个字符', trigger: 'blur' }
                    ]
                },
            }
        }
        ,
        created() {
            this.form.type = 'superAdmin'
            //get user type
            let result = axios({
                method: 'post',
                url: '/getStaffTypeByToken',
                headers: { 'content-type': 'application/x-www-form-urlencoded'},
                data: Qs.stringify({
                    token: window.localStorage.getItem("token")
                })
            });
            result.then(res=>{
                console.log(res)
                if(res.data.type === 'superAdmin')
                {
                    return window.location.href="/superAdmin/systemInfo";
                }
            })

        },
        methods: {
            login() {
                this.$refs.formRef.validate(async valid => {
                    if (!valid) return
                    let result =  axios({
                        method: 'post',
                        url: '/login',
                        headers: { 'content-type': 'application/x-www-form-urlencoded'},
                        data: Qs.stringify({
                            username:this.form.username,
                            password:md5(this.form.password),
                            type:this.form.type
                        })
                    });
                    result.then(res=>{
                        console.log(res)
                        if(res.data.error === "0")
                        {
                            this.$message.success("登录成功")
                            window.localStorage.setItem('token',res.data.token);
                            window.location.href="/superAdmin/systemInfo";

                        }
                        else
                            this.$message.error("用户名或密码不正确")
                    })
                })
            },
            resetForm()
            {
                this.$refs.formRef.resetFields()
            }
        }
    })
</script>
</body>
</html>
