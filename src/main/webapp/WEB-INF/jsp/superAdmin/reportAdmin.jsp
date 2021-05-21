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
                        <el-row>
                            <span style="font-size: 15px"> 选择年份</span>
                            <el-select v-model="year" placeholder="请选择" @change="updateData">
                                <el-option
                                        v-for="item in yearOptions"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>
                            </el-select>
                            <span style="font-size: 15px"> 选择产品</span>
                            <el-select v-model="product" placeholder="请选择" @change="updateData">
                                <el-option
                                        v-for="item in productOptions"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>
                            </el-select>
                        </el-row>
                        <div style="height: 20px"></div>
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
                yearOptions:[],
                productOptions:[],
                year: -1,
                product:-1
            }

        }
        ,
        created() {
            this.init()
            this.getInnReportData()
            this.getOuttReportData()
            this.getYearList()
            this.getProductIdAndName()
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
            updateData(){
                this.getInnReportData()
                this.getOuttReportData()
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
                            this.productOptions.push(
                                {
                                    label:'全部',
                                    value:-1,
                                }
                            )
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
            getYearList(){
                let url =  '/getYearList';
                axios.get(url, {
                    params:{}
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        let len = res.data.data.length
                        let len2 = this.yearOptions.length
                        // console.log(res.data.data)
                        if(len2 === 0)
                        {
                            this.yearOptions.push(
                                {
                                    label:'全部',
                                    value:-1,
                                }
                            )
                            for(let i = 0 ; i < len ; i ++)
                            {
                                // console.log(res.data.data[i])
                                this.yearOptions.push(
                                    {
                                        label:res.data.data[i],
                                        value:res.data.data[i],
                                    }
                                )
                            }
                        }
                    }
                    else
                    {
                        return this.$message.error('获取类型数据失败！')
                    }
                }).catch(err => {
                })
            },
            // getInnReportData
            async getInnReportData(){
                const { data: res } = await axios.get('/getInnReportData', {
                    params:{year:this.year,productId:this.product}
                })
                if (res.error !== "0") {
                    return this.$message.error('获取数据失败！')
                }else{
                    let option1 = {
                        title:{
                            text:'年度入库报表'
                        },
                        tooltip:{},
                        legend:{
                            data:['入库量']
                        },
                        xAxis:{
                            data:["第一季度","第二季度","第三季度","第四季度"]
                        },
                        yAxis:{

                        },
                        series:[{
                            name:'入库量',
                            type:'line',
                            // data:[300,100,120,150,10,10]
                            data:res.data
                        }]
                    };

                    let myChart1 = echarts.init(document.getElementById('chartMain1'));
                    myChart1.setOption(option1);
                }
            },
            async getOuttReportData() {
                const {data: res} = await axios.get('/getOuttReportData', {
                    params:{year:this.year,productId:this.product}
                })
                if (res.error !== "0") {
                    return this.$message.error('获取数据失败！')
                } else {
                    let option2 = {
                        title: {
                            text: '年度出库报表'
                        },
                        tooltip: {},
                        legend: {
                            data: ['出库量']
                        },
                        xAxis: {
                            data: ["第一季度", "第二季度", "第三季度", "第四季度"]
                        },
                        yAxis: {},
                        series: [{
                            name: '出库量',
                            type: 'line',
                            // data:[300,100,120,150,10,10]
                            data: res.data
                        }]
                    };

                    let myChart2 = echarts.init(document.getElementById('chartMain2'));
                    myChart2.setOption(option2);
                }
            }
        }
    })
</script>
<script type="text/javascript">
    // let option1 = {
    //     title:{
    //         text:'年度出库报表'
    //     },
    //     tooltip:{},
    //     legend:{
    //         data:['出库量']
    //     },
    //     xAxis:{
    //         data:["第一季度","第二季度","第三季度","第四季度"]
    //     },
    //     yAxis:{
    //
    //     },
    //     series:[{
    //         name:'出库量',
    //         type:'line',
    //         // data:[300,100,120,150,10,10]
    //         data:[]
    //     }]
    // };
    let option2 = {
        title:{
            text:'入库报表'
        },
        tooltip:{},
        legend:{
            data:['入库量']
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
    let myChart2 = echarts.init(document.getElementById('chartMain2'));
    myChart2.setOption(option2);
</script>
</body>
</html>
