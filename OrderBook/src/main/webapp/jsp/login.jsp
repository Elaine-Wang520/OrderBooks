<%--
  Created by IntelliJ IDEA.
  User: linjunli
  Date: 2019/6/24 0024
  Time: 9:23
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
    <title>登录 | BookTextOrder</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">
</head>

<body>

<div class="container" id="main">
    <form class="form-signin" id="form"  action="users/login" method="post">
        <a href="jsp/main.jsp">
            <h2 class="form-signin-heading">用户登录</h2>
        </a>
        <div class="form-group has-feedback">
            <input type="text" class="form-control" name="username" placeholder="账号">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <input type="password" class="form-control"  name="password" placeholder="密码">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">登录
        </button>
        <a href="jsp/register.jsp">注册</a>
    </form>
</div>
<div id="footer">
    <div>
        <a href="https://github.com/LonelyXy">
            <img src="img/github.png" width="20px" height="20px"
                 class="img-circle">&nbsp;&nbsp;GitHub
        </a>
        &nbsp;|
        <a href="#">&nbsp;&nbsp;Sakura</a>
    </div>
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
