<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<el-aside width="220px" id="elAside">
    <el-menu background-color="#333744"
             text-color="#fff"  class="el-menu-vertical-demo">
        <el-menu-item index="1" style="width: 220px" @Click="jumpToSystemInfo">
            <i class="el-icon-info"  id="systemInfoIco"></i>
            <span slot="title"  id="systemInfo">系统信息</span>
        </el-menu-item>
        <el-menu-item index="1" style="width: 220px" @Click="jumpToBasicInfoAdmin">
            <i class="el-icon-s-grid"  id="basicInfoAdminIco"></i>
            <span slot="title"  id="basicInfoAdmin">基本信息录入</span>
        </el-menu-item>

    </el-menu>
</el-aside>