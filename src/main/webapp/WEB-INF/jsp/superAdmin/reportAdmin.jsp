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
    <title>数据报表</title>
    <%@ include file="../public/include.jsp"%>
    <script src="${pageContext.request.contextPath}/resources/js/eCharts.js"></script>
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
                        <div id="chartMain1" style="width:1000px; height: 400px;"></div>
                        <br>
                        <div id="chartMain2" style="width:1000px; height: 400px;"></div>
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
            }

        }
        ,
        created() {
            this.init()
        },
        methods: {
            init()
            {
                <%@ include file="../public/setHeight.jsp" %>
                <%@ include file="../public/getUsername.jsp" %>
                <%@ include file="../public/superAdmin/roleJudge.jsp" %>
                document.getElementById("reportAdmin").style.color = "#409EFF";
                document.getElementById("reportAdminIco").style.color = "#409EFF"
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
            handleSizeChange(newSize) {
                this.queryInfo.pre = newSize
                this.getStockList()
            },
            handleCurrentChange(newPage) {
                this.queryInfo.page = newPage
                this.getStockList()
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
<script type="text/javascript">
    let option1 = {
        title:{
            text:'年度出库报表'
        },
        tooltip:{},
        legend:{
            data:['出库量']
        },
        xAxis:{
            data:["第一季度","第二季度","第三季度","第四季度"]
        },
        yAxis:{

        },
        series:[{
            name:'出库量',
            type:'line',
            data:[300,100,120,150,10,10]
        }]
    };
    let option2 = {
        title:{
            text:'年度客户报表'
        },
        tooltip:{},
        legend:{
            data:['客户量']
        },
        xAxis:{
            data:["第一季度","第二季度","第三季度","第四季度"]
        },
        yAxis:{

        },
        series:[{
            name:'客户量',
            type:'line',
            data:[100,300,150,150,400,410]
        }]
    };
    let myChart1 = echarts.init(document.getElementById('chartMain1'));
    myChart1.setOption(option1);
    let myChart2 = echarts.init(document.getElementById('chartMain2'));
    myChart2.setOption(option2);
</script>
</body>
</html>
