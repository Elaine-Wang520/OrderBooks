<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/6/26
  Time: 10:16
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
    <title>管理员界面</title>
    <link type="text/css" rel="stylesheet" href="js/layui/css/layui.css"/>
    <link type="text/css" rel="stylesheet" href="js/layui/css/layui.mobile.css"/>
    <link type="text/css" rel="stylesheet" href="css/admin.css">
    <script src="js/jquery-2.1.1.min.js"></script>
</head>

<body>
<div class="main">
    <div class="header">
        <img src="img/banner.jpg" alt="">
    </div>
    <div class="header">
        <a href="users/index" >退出</a>
    </div>
    <div class="content">
        <div class="menu">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="admins/initpage">注册用户管理</a></dd>
                        <dd><a href="admins/manageadmin">后台用户管理</a></dd>
                        <%--                    <dd><a href="">跳转</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">教材管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="jsp/addbook.jsp">添加新教材</a></dd>
                        <dd><a href="admins/updatebook">查看与修改</a></dd>
                        <dd><a href="jsp/bookorder.jsp">查看教材订单</a></dd>
                        <dd><a href="admins/financialrecord">查看财务记录</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="messages/initpage">信息管理</a></li>
                <%--            <li class="layui-nav-item"><a href="">大数据</a></li>--%>
            </ul>
        </div>
        <div class="record">
            <div align="center" class="title">财务记录</div>
            <table class="layui-table" lay-even lay-skin="nob">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                    <col width="200">
                </colgroup>
                <thead>
                <tr>
                    <th>记录号</th>
                    <th>图书名</th>
                    <th>数量</th>
                    <th>价格</th>
                    <th>总价</th>
                    <th>下单用户</th>
                    <th>入库时间</th>
                    <th>成交时间</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${empty record_list }">
                    <tr>
                        <td colspan="8" align="center">没有记录</td>
                    </tr>
                </c:if>
                <c:forEach var="rc" items="${record_list}">
                    <tr>
                        <td>${rc.id}</td>
                        <td>${rc.bookname}</td>
                        <td>${rc.number}</td>
                        <td>${rc.price}</td>
                        <td>${rc.moneytotal}</td>
                        <td>${rc.username}</td>
                        <td>${rc.inputdate}</td>
                        <td>${rc.buydate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="page" align="center" style="font-size: 15px">
                <c:if test="${currentPage>1 }">
                    <a href="admins/financialrecord?page=${currentPage-1}">上一页</a>
                </c:if>
                <a href="admins/financialrecord?page=${1}">首页</a>
                <c:forEach begin="1" end="${totalPage }" step="1" var="i">
                    <c:if test="${currentPage==i }">
                        <a href="admins/financialrecord?page=${i}"></a>
                    </c:if>
                    <c:if test="${currentPage!=i }">
                        <a href="admins/financialrecord?page=${i}">${i}</a>
                    </c:if>
                </c:forEach>
                <a href="admins/financialrecord?page=${totalPage}">末页</a>
                <c:if test="${currentPage<totalPage }">
                    <a href="admins/financialrecord?page=${currentPage+1}">下一页</a>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
<script src="js/admin.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/layui/layui.all.js"></script>
<script src="js/layui/layui.js"></script>
</html>
