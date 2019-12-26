<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/6/25
  Time: 10:30
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
    <div class="table">
        <div class="t_users">
            <span class="title">修改教材信息</span>
            <form id="bi_form">
                <!-- id -->
                <input type="hidden" class="form-control" name="id" value="${book.id}"><br/>
                <span class="help">书名</span>
                <input type="text" class="form-control" name="bookname" value="${book.bookname}"><br/>
                <span class="help">图片</span>
                <img src="${book.imgpath}" alt="">
<%--                <input type="button"  value="上传图片" name="imgpath" ><br/>--%>
                <!-- author--><br/>
                <span class="help">作者</span>
                <input type="text" class="form-control" name="author" value="${book.author}"><br/>
                <span class="help">数量</span>
                <input type="text"  class="form-control" name="number" value="${book.number}"><br/>
                <span class="help">价格</span>
                <input type="text" class="form-control"  id="price" name="price" value="${book.price}"><br/>

                <span class="help">出版社</span>
                <input type="text" readonly="readonly" class="form-control" id="tags"  name="press" value="${book.press}"><br/>
                <span class="help">出版日期</span>
                <input type="text" readonly="readonly" class="form-control" name="pressdate" value="${book.pressdate}"><br/>
                <span class="help">入库人</span>
                <input type="text" readonly="readonly" class="form-control" name="inputname" value="${book.inputname}"><br/>

                <span class="help">入库日期</span>
                <input type="text" readonly="readonly" class="form-control" name="inputdate" value="${book.inputdate}"><br/>

                <span class="help">内容</span><br/>
                <textarea name="content" style="width:400px;height: 200px" value="${book.content}"></textarea><br/>
                <input  class="btn btn-default" id="bi_btn" type="submit"   value="提交" />
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

</body>
</html>
