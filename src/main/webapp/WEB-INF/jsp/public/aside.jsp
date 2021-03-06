<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<el-aside width="220px" id="elAside">
    <el-menu background-color="#333744"
             text-color="#fff"  class="el-menu-vertical-demo">
        <el-menu-item index="1" style="width: 220px">
            <i class="el-icon-user-solid"  id="staffAdminIco"></i>
            <span slot="title"  id="staffAdmin">员工管理</span>
        </el-menu-item>
        <el-menu-item index="2" style="width: 220px">
            <i class="el-icon-s-goods" id="goodsAdminIco"></i>
            <span slot="title" id="goodsAdmin">原料与产品信息管理</span>
        </el-menu-item>
        <el-menu-item index="3" style="width: 220px">
            <i class="el-icon-help" id="inAdminIco"></i>
            <span slot="title" id="inAdmin">采购入库信息管理</span>
        </el-menu-item>
        <el-menu-item index="4" style="width: 220px">
            <i class="el-icon-s-shop" id="outAdminIco"></i>
            <span slot="title" id="outAdmin">生产销售出库信息管理</span>
        </el-menu-item>
        <el-menu-item index="5" style="width: 220px">
            <i class="el-icon-s-order" id="inventoryAdminIco"></i>
            <span slot="title" id="inventoryAdmin">库存信息管理</span>
        </el-menu-item>
        <el-menu-item index="6" style="width: 220px">
            <i class="el-icon-menu" id="crmAdminIco"></i>
            <span slot="title" id="crmAdmin">基本CRM管理</span>
        </el-menu-item>
    </el-menu>
</el-aside>