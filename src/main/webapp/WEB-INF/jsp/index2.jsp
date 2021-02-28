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
<%--    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">--%>
<%--    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>--%>
<%--    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>--%>
<%--    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>--%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row" style="height: 100px">
        <div class="col-sm-1" style="background: black"></div>
        <div class="col-sm-2" style="background: blue"></div>
        <div class="col-sm-3" style="background: green"></div>
    </div>
    <button type="button" class="btn btn-primary">主要按钮</button>

</div>
<br>
Hello JSP2.
<br>
${user.getUsername()}
</body>
</html>
