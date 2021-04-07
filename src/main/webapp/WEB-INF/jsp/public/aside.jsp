<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<el-aside width="220px" id="elAside">
    <el-menu background-color="#333744"
             text-color="#fff"  class="el-menu-vertical-demo">
        <el-menu-item index="1" style="width: 220px" @Click="jumpToStaffAdmin">
            <i class="el-icon-user-solid"  id="staffAdminIco"></i>
            <span slot="title"  id="staffAdmin">员工信息管理</span>
        </el-menu-item>
        <el-menu-item index="2" style="width: 220px" @Click="jumpToTypeAdmin">
            <i class="el-icon-s-goods" id="typeAdminIco"></i>
            <span slot="title" id="typeAdmin">产品类别管理</span>
        </el-menu-item>
        <el-menu-item index="3" style="width: 220px" @Click="jumpToGoodsAdmin">
            <i class="el-icon-s-goods" id="goodsAdminIco"></i>
            <span slot="title" id="goodsAdmin">原料与产品信息管理</span>
        </el-menu-item>
        <el-menu-item index="4" style="width: 220px" @Click="jumpToInAdmin">
            <i class="el-icon-help" id="inAdminIco"></i>
            <span slot="title" id="inAdmin">入库管理</span>
        </el-menu-item>
        <el-menu-item index="5" style="width: 220px" @Click="jumpToOutAdmin">
            <i class="el-icon-s-shop" id="outAdminIco"></i>
            <span slot="title" id="outAdmin">出库管理</span>
        </el-menu-item>
        <el-menu-item index="6" style="width: 220px" @Click="jumpToInventoryAdmin">
            <i class="el-icon-s-order" id="inventoryAdminIco"></i>
            <span slot="title" id="inventoryAdmin">库存信息管理</span>
        </el-menu-item>
        <el-menu-item index="7" style="width: 220px" @Click="jumpToCrmAdmin">
            <i class="el-icon-menu" id="crmAdminIco"></i>
            <span slot="title" id="crmAdmin">CRM管理</span>
        </el-menu-item>
    </el-menu>
</el-aside>