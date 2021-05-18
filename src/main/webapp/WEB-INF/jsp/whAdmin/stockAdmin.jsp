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
    <title>库存信息</title>
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
                            <el-col :span="4">
                                <el-select v-model="queryInfo.typeId" placeholder="请选择种类" @change="getStockList">
                                    <el-option
                                            v-for="item in typeOptions"
                                            :key="item.value"
                                            :label="item.label"
                                            :value="item.value">
                                    </el-option>
                                </el-select>
                            </el-col>
                            <el-col :span="8">
                                <el-input placeholder="按产品名查找" v-model="queryInfo.key" clearable @clear="getStockList"
                                          @keyup.enter.native="getStockList">
                                    <el-button slot="append" icon="el-icon-search" @Click="getStockList"></el-button>
                                </el-input>
                            </el-col>
                        </el-row>
                        <br>
                        <el-table :data="stockList" border stripe v-loading="loading"
                                  :header-cell-style="{'text-align':'center','font-size':'14px'}"
                                  :cell-style="{'text-align':'center','font-size':'14px'}">

                            <el-table-column width="80px" >
                                <template slot-scope="scope">
                                    <el-tooltip class="item" effect="dark" content="商品库存不足，请及时补充" placement="top-start"  v-if="scope.row.alert === true">
                                        <el-tag class="el-icon-warning" type="danger"></el-tag>
                                    </el-tooltip>
                                    <el-tooltip class="item" effect="dark" content="商品库存充足" placement="top-start" v-else>
                                        <el-tag class="el-icon-check" type="success"></el-tag>
                                    </el-tooltip>
                                </template>
                            </el-table-column>
                            </template>
                            <el-table-column label="Id" prop="id" min-width="5%"></el-table-column>
                            <el-table-column label="产品名" prop="productName" min-width="5%"></el-table-column>
                            <el-table-column label="类别" prop="typeName" min-width="5%"></el-table-column>
                            <el-table-column label="数量" prop="num" min-width="5%"></el-table-column>
                            <el-table-column label="报警数量" prop="alertNum" min-width="5%"></el-table-column>
                            <el-table-column label="操作" width="80px">
                                <template slot-scope="scope">
                                    <el-tooltip effect="dark" content="设置最低报警数量" placement="top" :enterable="false">
                                        <el-button type="warning" icon="el-icon-s-tools" size="mini" @click="setAlertNum(scope.row.productId)"></el-button>
                                    </el-tooltip>
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

                    <el-dialog title="设置最低报警值" :visible.sync="setDialogVisible" width="50%" @close="setDialogClosed"
                               @submit.native.prevent>
                        <el-form label-width="90px">
                            <el-form-item label="最低报警值">
                                <el-input v-model="alertNum" @keyup.enter.native="setAlertNumSubmit"></el-input>
                            </el-form-item>
                        </el-form>
                        <!-- 底部区域 -->
                        <span slot="footer" class="dialog-footer">
                            <el-button @click="setDialogVisible = false">取 消</el-button>
                            <el-button type="primary" @click="setAlertNumSubmit">确 定</el-button>
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
                    typeId:-1,
                    token:""
                },
                stockList:[],
                total: 0,
                typeOptions:[],
                setDialogVisible:false,
                alertNum:-1,
                currentProductId:0
            }

        }
        ,
        created() {
            this.getStockList()
            this.init()
            this.getTypeIdAndName()
            this.queryInfo.typeId = -1
        },
        methods: {
            init()
            {
                <%@ include file="../public/setHeight.jsp" %>
                <%@ include file="../public/getUsername.jsp" %>
                <%@ include file="../public/admin/roleJudge.jsp" %>
                document.getElementById("stockAdmin").style.color = "#409EFF";
                document.getElementById("stockAdminIco").style.color = "#409EFF"
            },
            <%@ include file="../public/admin/setJump.jsp" %>
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
                        this.total = res.data.len
                    }
                    else
                    {
                        return this.$message.error('获取数据失败！')
                    }
                }).catch(err => {
                })
            },
            setAlertNum(id){
                this.currentProductId = id
                this.setDialogVisible = true
                let url =  '/getAlertNumById';
                axios.get(url, {
                    params: {
                        id:id,
                        token:window.localStorage.getItem("token")
                    }
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        this.alertNum = res.data.data
                    }
                    else
                    {
                        return this.$message.error('获取数据失败！')
                    }
                }).catch(err => {
                })
            },
            setAlertNumSubmit(){
                let result =  axios({
                    method: 'put',
                    url: '/setAlertNumById',
                    headers: { 'content-type': 'application/x-www-form-urlencoded'},
                    data: Qs.stringify({
                        id:this.currentProductId,
                        alertNum:this.alertNum,
                        token:window.localStorage.getItem("token")
                    })
                });
                result.then(res=>{
                    if(res.data.error === "0")
                    {
                        this.getStockList()
                        this.setDialogClosed()
                        this.$message.success("操作成功")
                    }
                })
            },
            setDialogClosed() {
                this.alertNum= -1
                this.setDialogVisible = false
            },
            async getTypeIdAndName()
            {
                let url =  '/getTypeIdAndName';
                axios.get(url, {
                    params:{token:window.localStorage.getItem("token")}
                }).then(res => {
                    if(res.data.error === "0")
                    {
                        let len = res.data.data.length
                        let len2 = this.typeOptions.length
                        if(len2 === 0)
                        {
                            this.typeOptions.push(
                                {
                                    label:'全部',
                                    value:-1,
                                }
                            )
                            for(let i = 0 ; i < len ; i ++)
                            {
                                this.typeOptions.push(
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
                        return this.$message.error('获取类型数据失败！')
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
            back()
            {
                window.location.href="/admin/basicInfoAdmin";
            },
        }
    })
</script>
</body>
</html>
