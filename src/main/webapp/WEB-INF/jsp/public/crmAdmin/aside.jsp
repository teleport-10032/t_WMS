<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<el-aside width="200px" id="elAside">
    <el-menu background-color="#333744"
             text-color="#fff"  class="el-menu-vertical-demo">
        <el-menu-item index="6" style="width: 220px" @Click="jumpToCrmAdmin">
            <i class="el-icon-s-custom"  id="crmAdminIco"></i>
            <span slot="title"  id="crmAdmin">crm管理</span>
        </el-menu-item>

    </el-menu>
</el-aside>