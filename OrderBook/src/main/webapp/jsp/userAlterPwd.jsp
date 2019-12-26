<%--
  Created by IntelliJ IDEA.
  User: 王镜
  Date: 2019/6/24 0024
  Time: 16:00
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
    <title>Book</title>
</head>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="style/readerMain.css">
<link rel="stylesheet" type="text/css" href="style/readerAlterPaswd.css">
<script type="text/javascript" src="script/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
    $(function(){
        var Lis=$(".menu ul li").eq(2);
        Lis.css('border-bottom', '7px solid #419EDC');
        Lis.css('margin-top', '-7px');
        Lis.css('color', '#419EDC');
    })
</script>
<body>
<div class="header">
    <div class="header">
        <div class="home_logo"><a  href="jsp/main.jsp"><i class="fa fa-home">首页</i></a></div>
        <div class="page_title">个人中心</div>
        <div class="out_page"><a  href="jsp/login.jsp">退出</a></div>
    </div>
</div>
<!--用户头像-->
<div class="book_logo">
    <img src="${userInfo.img}">
</div>
<div class="reader_name">${userInfo.username}</div>
<div class="menu">
    <ul>
        <a href="users/getUserInfo"><li class="first_li">基本资料</li></a>
        <a href="users/alterData"><li class="other_li">修改资料</li></a>
        <a href="users/userAlterPwd"><li class="other_li">修改密码</li></a>
        <a href="users/userBuyCart"><li class="other_li">购物车信息</li></a>
        <a href="users/userOrders"><li class="other_li">所有订单信息</li></a>
    </ul>
    <div class="clear"></div>
</div>
<!-- class="content"的div中是个人中心的切换部分 -->
<div class="content">
    <form id="alterPwd" action="users/alterPwd" method="post">
    <div class="data"><label>原密码</label><input type="password" name="oldpwd" /></div>
    <div class="data"><label>新密码</label><input   type="password" name="newpwd" /></div>
    <div class="data"><label>确认新密码</label><input  type="password" name="password"/></div>
        <div class="add_btn"> <button class="btn btn-default" type="submit" id="submit">确认修改
        </button></div>
    </form>
</div>
<div class="footer">
    <br/>
    <p>@Copyright教材订购系统</p>
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
