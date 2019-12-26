<%--
  Created by IntelliJ IDEA.
  User: 王镜
  Date: 2019/6/24
  Time: 16:02
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
<link rel="stylesheet" type="text/css" href="style/readerBorrowed.css">
<script type="text/javascript" src="script/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
    $(function(){
        var Lis=$(".menu ul li").eq(3);
        Lis.css('border-bottom', '7px solid #419EDC');
        Lis.css('margin-top', '-7px');
        Lis.css('color', '#419EDC');
        $(".table tbody tr:odd").css("backgroundColor","#F2F2D6");
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
<div class="book_logo">
    <img src="${user.img}">
</div>
<div class="reader_name">${user.username}</div>
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
    <div class="table_div">
        <table class="table">
            <thead>
            <th>图书名</th>
            <th>作者</th>
            <th>价格</th>
            <th>出版社</th>
            <th>出版日期</th>
            <th>需要购买数量</th>
            <th>收货人姓名</th>
            <th>收货人电话</th>
            <th>收货人地址</th>
            </thead>
            <tbody>
            <div class="buybook">
<c:forEach var="bookcart" items="${bookcart_list}">
       <tr>
        <td><a href="books/getById?id=${bookcart.bookid}">${bookcart.bookname}</a></td>
        <td>${bookcart.author}</td>
        <td>${bookcart.price}</td>
        <td>${bookcart.press}</td>
        <td>${bookcart.pressdate}</td>
        <td>${bookcart.numbers}</td>
        <td>${user.truthname}</td>
        <td>${user.phonenum}</td>
        <td>${user.address}</td>
           <c:if test="${sessionScope.user!=null}">
        <td class="btn btn-default" style="color:red;" onclick="deletecm(this,${bookcart.xid})">删除</td>
           </c:if>
           <c:if test="${sessionScope.user!=null}">
               <td class="btn btn-default" style="color:red;" onclick="buyOneBook(this,${bookcart.xid})">购买</td>
           </c:if>
    </tr>
</c:forEach>
            </tbody>
        </table>
        <h3 name="totalPrice">总价为：${buycart_money}</h3>
        <div class="add_btn"> <span class="btn btn-default" style="color:red;"
                                    onclick="buyallbooks()">确认购买</span></div>
    </div>
</div>
</div>
<div class="footer">
    <br/>
    <p>@Copyright教材订购系统</p>
</div>
</body>

<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/buycart.js"></script>
<script type="text/javascript">
</script>
</html>
