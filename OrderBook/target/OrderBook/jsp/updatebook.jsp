<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/6/24
  Time: 13:12
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
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
        <div class="table">
            <div class="t_users">
                <span class="title">教材查看与修改</span>
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
                        <th>图书名称</th>
                        <th>作者</th>
                        <th>图书简介</th>
                        <th>剩余数量</th>
                        <th>入库时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="b" items="${books_list}">
                        <tr>
                            <td>${b.bookname}</td>
                            <td>${b.author}</td>
                            <td>${b.content}</td>
                            <td>${b.number}</td>
                            <td>${b.inputdate}</td>
                            <td>
                                <c:if test="${b.number<=10 }">
                                    <a href="admins/buybooks?id=${b.id}"><span class="btn btn-default" >待购</span></a>
                                </c:if>
                                <br/>
                                <a href="admins/updatebookinfo?id=${b.id}"><span class="btn btn-default">修改</span></a><br/>
                                <span class="btn btn-default" style="color:red;" onclick="deleteBook(this,${b.id})">删除</span>
                            </td>
                                <%--                        <a href="articles/getById?id=${article.id}">阅读全文</a>--%>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="page" align="center" style="font-size: 15px">
                    <c:if test="${currentPage>1 }">
                        <a href="admins/updatebook?page=${currentPage-1}">上一页</a>
                    </c:if>
                    <a href="admins/updatebook?page=${1}">首页</a>
                    <c:forEach begin="1" end="${totalPage }" step="1" var="i">
                        <c:if test="${currentPage==i }">
                            <a href="admins/updatebook?page=${i}"></a>
                        </c:if>
                        <c:if test="${currentPage!=i }">
                            <a href="admins/updatebook?page=${i}">${i}</a>
                        </c:if>
                    </c:forEach>
                    <a href="admins/updatebook?page=${totalPage}">末页</a>
                    <c:if test="${currentPage<totalPage }">
                        <a href="admins/updatebook?page=${currentPage+1}">下一页</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <div class="footer" align="center">
        <p>教材每次订购200本</p>
    </div>
</div>

</body>
<script src="js/admin.js"></script>

<script src="js/layer/layer.js"></script>
<script src="js/layui/layui.all.js"></script>
<script src="js/layui/layui.js"></script>
</html>
