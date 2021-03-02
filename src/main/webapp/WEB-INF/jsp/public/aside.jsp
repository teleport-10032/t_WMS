<%--
  Created by IntelliJ IDEA.
  User: teleport
  Date: 2021/3/2
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% out.print("<el-aside width=\"220px\" id=\"elAside\">\n" +
        "                <el-menu background-color=\"#333744\"\n" +
        "                         text-color=\"#fff\" active-text-color=\"#409EFF\"\n" +
        "                         default-active=\"1\" class=\"el-menu-vertical-demo\">\n" +
        "                    <el-menu-item index=\"1\" style=\"width: 220px\">\n" +
        "                        <i class=\"el-icon-user-solid\"></i>\n" +
        "                        <span slot=\"title\">用户管理</span>\n" +
        "                    </el-menu-item>\n" +
        "                    <el-menu-item index=\"2\" style=\"width: 220px\">\n" +
        "                        <i class=\"el-icon-s-goods\"></i>\n" +
        "                        <span slot=\"title\">原料与产品信息管理</span>\n" +
        "                    </el-menu-item>\n" +
        "                    <el-menu-item index=\"3\" style=\"width: 220px\">\n" +
        "                        <i class=\"el-icon-help\"></i>\n" +
        "                        <span slot=\"title\">采购入库信息管理</span>\n" +
        "                    </el-menu-item>\n" +
        "                    <el-menu-item index=\"4\" style=\"width: 220px\">\n" +
        "                        <i class=\"el-icon-s-shop\"></i>\n" +
        "                        <span slot=\"title\">生产销售出库信息管理</span>\n" +
        "                    </el-menu-item>\n" +
        "                    <el-menu-item index=\"5\" style=\"width: 220px\">\n" +
        "                        <i class=\"el-icon-s-order\"></i>\n" +
        "                        <span slot=\"title\">库存信息管理</span>\n" +
        "                    </el-menu-item>\n" +
        "                    <el-menu-item index=\"6\" style=\"width: 220px\">\n" +
        "                        <i class=\"el-icon-menu\"></i>\n" +
        "                        <span slot=\"title\">基本CRM管理</span>\n" +
        "                    </el-menu-item>\n" +
        "                </el-menu>\n" +
        "            </el-aside>");%>