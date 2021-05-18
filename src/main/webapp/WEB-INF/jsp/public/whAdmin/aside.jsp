<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<el-aside width="200px" id="elAside">
    <el-menu background-color="#333744"
             text-color="#fff"  class="el-menu-vertical-demo">
        <el-menu-item index="1" style="width: 220px" @Click="jumpToInnAdmin">
            <i class="el-icon-s-home"  id="innAdminIco"></i>
            <span slot="title"  id="innAdmin">入库管理</span>
        </el-menu-item>
        <el-menu-item index="2" style="width: 220px" @Click="jumpToOuttAdmin">
            <i class="el-icon-s-shop"  id="outtAdminIco"></i>
            <span slot="title"  id="outtAdmin">出库管理</span>
        </el-menu-item>
        <el-menu-item index="3" style="width: 220px" @Click="jumpToStockAdmin">
            <i class="el-icon-s-grid"  id="stockAdminIco"></i>
            <span slot="title"  id="stockAdmin">库存信息</span>
        </el-menu-item>
        <el-menu-item index="4" style="width: 220px" @Click="jumpToReportAdmin">
            <i class="el-icon-s-marketing"  id="reportAdminIco"></i>
            <span slot="title"  id="reportAdmin">数据报表</span>
        </el-menu-item>
    </el-menu>
</el-aside>