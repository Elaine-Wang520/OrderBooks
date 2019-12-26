<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/6/24
  Time: 12:19
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
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<%--    <link type="text/css" rel="stylesheet" href="css/addbook.css" />--%>
    <script src="js/jquery-2.1.1.min.js"></script>
    <style type="text/css">
        .main{
            background: #eee;
            /*border: #00c4ff 5px solid;*/
        }
        .content{
            display: flex;
            flex-direction: row;
            margin-left:200px ;
        }
        .header{
            /*border: blue 2px solid;*/
            padding-top: 5px;
            margin-left:270px;
        }
        .menu{
            width: 300px;
            /*border: solid 3px black;*/
            margin-left: 100px;
            margin-top: 200px;
            height: 250px;
            /*padding-right: 100px;*/
        }
        .contain{
            margin-top: 40px;
            /*border: solid 1px red;*/
        }
        .contain #title{
            text-align: center;
        }
        .help{
            margin-top:20px;
            margin-bottom:20px;
            font-size:15px;
        }
        .btn{
            margin-top: 10px;
            margin-left: 170px;
        }
        .layui-nav{
            height: 500px;
        }
        /*.layui-nav-item{*/
        /*    height: 100px;*/
        /*}*/
    </style>

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
    <div class="contain">
        <div id="title"><h2>添加新教材</h2></div>

        <form action="admins/up" id="formUp" method="post" enctype="multipart/form-data">
            <input type="file" name="file" id="file" value=""/>
            <%--            <input id="bookUp" type="submit" value="上传图片">--%>
            <br/>
            <input type="submit" value="上传图片">
        </form>

        <form id="book_form" action="" method="post">

            <input type="hidden" name="imgpath" value="${img_path}"/>

            <span class="help">书名</span>
            <input type="text" class="form-control" name="bookname" ><br/>

            <span class="help">作者</span>
            <input type="text" class="form-control" name="author" ><br/>
            <span class="help">数量</span>
            <input type="text"  class="form-control" name="number" ><br/>
                <!-- sort -->
                <span class="help">价格</span>

                <input type="text" class="form-control"  id="price" name="price"><br/>

                <!-- tag -->
                <span class="help">出版社</span>

                <input type="text" class="form-control" id="tags"  name="press"><br/>
                <span class="help">出版日期</span>
                <input type="text"  class="form-control" name="pressdate" ><br/>
                <span class="help">入库人</span>
                <input type="text"  class="form-control" name="inputname" ><br/>

                <span class="help">内容</span><br/>
                <textarea name="content" style="width:400px;height: 200px"></textarea><br/>
            <input  class="btn btn-default" id="book_btn" type="button"   value="提交" />
        </form>
    </div>
    </div>
</div>
</body>
<script src="js/admin.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/layui/layui.all.js"></script>
<script src="js/layui/layui.js"></script>
</html>
