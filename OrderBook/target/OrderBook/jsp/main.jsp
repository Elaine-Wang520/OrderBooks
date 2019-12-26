<%--
  Created by IntelliJ IDEA.
  User: linjunli
  Date: 2019/6/24 0024
  Time: 9:21
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
    <title>首页 | BookTextOrder</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<div class="head_line"></div>
<div class="container" id="main">
    <div id="header"></div>
    <div class="row c_center">
        <div class="col-md-3" id="left_content">
            <!-- 标题 -->
            <div id="title">
                <h2><a href="users/loginOut">BookTextOrder</a></h2>
                <h5 class="text-muted">welcome to order books!</h5>
            </div>
            <!-- 用户信息 -->
            <c:if test="${user!=null}">
                <div class="c_center" id="person_info">
                    <img src="${user.img}" height="130" width="130"
                         alt="丢失了我的头像?" class="img-circle">
                    <h4 class="text-muted">${user.username}</h4>
                    <h5 class="text-muted">星星和浮云.</h5>
                </div>
            </c:if>
            <c:if test="${user==null}">
                <div class="c_center" id="person_info">
                    <img src="img/header.jpg" height="130" width="130"
                         alt="丢失了我的头像?" class="img-circle">
                    <h5 class="text-muted"><a href="jsp/login.jsp">用户登录</a></h5>
                    <h5 class="text-muted"><a href="jsp/adminlogin.jsp">管理员登录</a></h5>
                </div>
            </c:if>
            <!-- 这里初始化侧边栏的三个大标签 -->
            <div id="list">
                <table class="table table-hover c_center">
                    <tr class="active">
                        <!-- 点击日志按钮跳转到index.jsp -->
                        <td><a href="jsp/main.jsp"><span class="glyphicon glyphicon-home"></span>
                            &nbsp;&nbsp;首页</a></td>
                    </tr>
                <c:if test="${user!=null}">
                    <tr>
                        <!--点击个人中心按钮跳转到personal.jsp -->
                        <td><a href="users/getUserInfo"><span class="glyphicon glyphicon-list"></span>
                            &nbsp;&nbsp;个人中心</a></td>
                    </tr>
                </c:if>
                    <tr>
                        <!--点击个人中心按钮跳转到personal.jsp -->
                        <td><a href="messages/getMessageInfo"><span class="glyphicon glyphicon-list"></span>
                            &nbsp;&nbsp;公告信息</a></td>
                    </tr>
                    <tr>
                        <!--点击个人中心按钮跳转到personal.jsp -->
                        <td><a href="jsp/booksearch.jsp"><span class="glyphicon glyphicon-list"></span>
                            &nbsp;&nbsp;搜索</a></td>
                    </tr>
                    <tr>
                        <td><a href="about.html"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;&nbsp;关于</a></td>
                    </tr>
                </table>
            </div>
            <br/>
            <!-- 这里初始化信息发布-->
            <div class="sort">
                <div class="list-group">
                    <span class="list-group-item active">消息发布</span>
                    <c:forEach var="entity" items="${message_list}">
                        <a href="messages/getmessage?get=${entity.key}" class="list-group-item">
                                ${entity.value}&nbsp;&nbsp;&nbsp;&nbsp;
                        </a>
<%--                            (${entity.value})</a>--%>
                    </c:forEach>
                </div>
            </div>
            <!-- 这里初始化订购排行 -->
            <div class="visit">
                <div class="list-group">
                    <span class="list-group-item active">订购排行</span>
                    <c:forEach var="b" items="${books}">
                        <a href="books/getById?id=${b.bookid}" class="list-group-item">${b.bookname}&nbsp;&nbsp; <span
                                class="c_right">(${b.number})</span></a>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-md-2" id="center_content">
        </div>
        <!-- 初始化图书列表完成 -->
        <div class="col-md-7 " id="right_Content">
            <div class="list-group">
                <a href="javascript:void(0);" class="list-group-item active">图书信息</a>
                <!-- 这里初始化图书列表 -->
                <c:forEach var="book" items="${book_list}">
                    <div class="list-group-item" style="display: flex;">
                        <div >
                            <img src="${book.imgpath}" style="width:80px;height: 100px;margin-right: 20px">
                        </div>
                        <div >
                        <h4><a href="books/getById?id=${book.id}">${book.bookname}</a></h4>
                        <br/>
                        <span>${book.press}&nbsp;&nbsp;|</span>
                        <span>${book.price}&nbsp;&nbsp;|</span>
<%--                        <a href="articles/getSortAndArticle?get=${article.sort}">${article.sort}</a>&nbsp;&nbsp;|--%>
                        <span>阅读次数: ${book.visit}</span>
                        <br/><br/>
                        <a href="books/getById?id=${book.id}">详细信息</a>
                        <br/><br/><br/>
                            <c:if test="${user!=null}">
<%--                        <a href="books/buyBooks?id=${book.id}">购买</a>--%>
<%--                        <a href="books/addshopCart?id=${book.id}">加入购物车</a>--%>
<%--                                <div class="buy">--%>
<%--                                    <form id="form1">--%>
<%--                                        选择需要购买的数量：<input type="text" name="number" value="1"/>--%>
<%--                                        <input type="hidden" value="${book.id}" name="bookid">--%>
<%--                                        <input type="hidden" value="${user.id}" name="userid">--%>
<%--                                        <input class="btn btn-default" type="button" value="加入购物车" id="btn1" />--%>
<%--                                        <input class="btn btn-default" type="button" value="立即购买" id="btn2" />--%>
<%--                                    </form>--%>
<%--                                </div>--%>
                            </c:if>
                        <br/>
                    </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="foot_line"></div>
</div>
<!-- 底部信息 -->
<div id="footer">
    <div>
       <a href="https://github.com/LonelyXy">
           <img src="img/github.png" width="20px" height="20px" class="img-circle">&nbsp;&nbsp;GitHub</a>
        &nbsp;|
        <a href="javascript:scroll(0,0)">&nbsp;&nbsp;BookTextOrder
        </a>
        <br/>
    </div>
</div>
</body>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/book.js"></script>

<script type="text/javascript"></script>
</html>
