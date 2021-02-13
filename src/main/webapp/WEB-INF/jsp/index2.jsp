<%--
  Created by IntelliJ IDEA.
  User: teleport
  Date: 2021/2/3
  Time: 8:02 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="resources/css/bootstrap.min.css" />
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row" style="height: 100px">
        <div class="col-sm-1" style="background: black"></div>
        <div class="col-sm-2" style="background: blue"></div>
        <div class="col-sm-3" style="background: green"></div>
    </div>
</div>
<br>
Hello JSP2.
<br>
${user.getUsername()}
</body>
</html>
