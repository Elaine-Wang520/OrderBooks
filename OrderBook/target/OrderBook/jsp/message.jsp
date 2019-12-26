<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/6/24
  Time: 13:36
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
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="js/layui/css/layui.css"/>
    <link type="text/css" rel="stylesheet" href="js/layui/css/layui.mobile.css"/>

    <link type="text/css" rel="stylesheet" href="css/message.css" />
    <link type="text/css" rel="stylesheet" href="css/comment.css"/>
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
        <div class="showmess">
            <div class="comment">
            <!-- 加载公告 -->
            <c:if test="${messageup!=null}">
                <c:forEach var="comm" varStatus="status" items="${messageup}">
                    <div class="row">
                        <div>
                            <div class="f_div">
                                <img src="img/comment.jpg" height="50" width="50" class="img-circle"/>
                                &nbsp;&nbsp;
                                <span style="color: #428bca"> ${comm.messager}</span>
                                <span>&nbsp;&nbsp;${comm.date}</span>
                                <span>&nbsp;&nbsp;${comm.title}</span>
                            </div>
                            <div id="c_content" class="c_left">
                                <pre>${comm.content }</pre>
                            </div>
                        </div>
                        <div class="r_div">
                            <!-- admin here 删除公告-->
                            <c:if test="${sessionScope.admin!=null}">
                                <span class="btn btn-default" style="color:red;"
                                      onclick="deletecm(this,${comm.id})">删除</span>&nbsp;
                            </c:if>
                        </div>
<%--                        <div class="line"></div>--%>
                    </div>
                </c:forEach>
            </c:if>
        </div>

            <div class="contain">
            <div class="title"><h2>添加公告</h2></div>

            <form id="form" >
                <!-- content -->
                <span class="help">公告标题</span>
                <input style="width:30%" class="form-control" type="text" name="title" placeholder="新书上架"><br/>
                <span class="help">发布人</span>
                <input style="width:30%" class="form-control" type="text" name="messager" placeholder="lonely">
                <br/>
                <span class="help">内容</span><br/>
                <textarea name="content" style="width: 500px;height: 100px;"></textarea>

                <br/>
                <input  class="btn btn-default" id="btn" type="submit"   value="提交" />
            </form>
        </div>
        </div>
    </div>
</div>
</body>
<script src="js/message.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/layui/layui.all.js"></script>
<script src="js/layui/layui.js"></script>
</html>
