<%@ page contentType="text/html;charset=UTF-8" language="java" %>
jumpToSystemInfo()
{
    window.location.href="/whAdmin/systemInfo";
},
jumpToBasicInfoAdmin()
{
    window.location.href="/whAdmin/basicInfoAdmin";
},
jumpToInnAdmin()
{
    window.location.href="/whAdmin/innAdmin";
},
jumpToOuttAdmin()
{
    window.location.href="/whAdmin/outtAdmin";
},
jumpToStockAdmin()
{
    window.location.href="/whAdmin/stockAdmin";
},
jumpToReportAdmin()
{
    window.location.href="/whAdmin/reportAdmin";
},
jumpToCrmAdmin()
{
    window.location.href="/whAdmin/crmAdmin";
},
logout()
{
    window.localStorage.clear()
    this.$message.success('退出成功')
    window.location.href="/";
},