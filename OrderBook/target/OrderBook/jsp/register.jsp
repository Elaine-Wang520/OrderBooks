<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/25 0025
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>注册 | BookTextOrder</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">
</head>

<body>
<div class="container" id="main">
    <form class="form-signin" id="form"  action="users/register" method="post">
        <a href="jsp/main.jsp">
            <h2 class="form-signin-heading">BookTextOrder</h2>
        </a>
        <div class="form-group has-feedback">
            <input type="text" class="form-control" name="username" placeholder="账号">

        </div>
        <div class="form-group has-feedback">
            <input type="text" class="form-control"  name="truthname" placeholder="真实姓名">

        </div>
        <div class="form-group has-feedback">
            <input type="text" class="form-control"  name="email" placeholder="邮箱">

        </div>
        <div class="form-group has-feedback">
            <input type="text" class="form-control"  name="phonenum" placeholder="电话">

        </div>
        <div class="form-group has-feedback">
            <input type="text" class="form-control"  name="address" placeholder="地址">

        </div>
        <div class="form-group has-feedback">
            <input type="password" class="form-control"  name="password" placeholder="密码">

        </div>
        <input type="hidden" name="entertime" value="2019-01-01">
        <input type="hidden" name="img" value="img/header.jpg">

        <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">注册
        </button>

    </form>
</div>
</body>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/layer/layer.js"></script>

<script type="text/javascript">
    if("${msg}"!=""){
        layer.msg("${msg}",{
            icon: 5,
            time:2000,
        });
    }
</script>
</html>
