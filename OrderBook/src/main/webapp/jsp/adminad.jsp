<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/6/24
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <base href="<%=basePath%>">
    <title>管理员界面</title>
    <link type="text/css" rel="stylesheet" href="js/layui/css/layui.css"/>
    <link type="text/css" rel="stylesheet" href="js/layui/css/layui.mobile.css"/>
    <link type="text/css" rel="stylesheet" href="css/admin.css">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.1.min.js"></script>

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
            <span class="title">后台用户管理</span>
            <table class="layui-table" lay-even lay-skin="nob">
                <colgroup>
                    <col width="200">
                    <col width="200">
                    <col width="200">
                </colgroup>
                <thead>
                <tr>
                    <th>管理员</th>
                    <th>密码</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="admin" items="${admins_list}">
                    <tr>
                        <td>${admin.name}</td>
                        <td>${admin.password}</td>

                        <td>
                            <c:if test="${sessionScope.admin!=null}">
                                <span class="btn btn-default" style="color:red;" onclick="deleteAd(this,${admin.id})">删除</span>
                                &nbsp;
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="add">
            <span class="title">后台用户添加</span>
            <form id="admin_form" >
                <span class="help">管理员</span>
                <input type="text"  name="name" >
                <span class="help">密码</span>
                <input type="text"   name="password" >
                <span class="help">电话</span>
                <input type="text"   name="phonenum" >
                <input  class="btn btn-default" id="add_btn" type="submit" value="添加" />
            </form>

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