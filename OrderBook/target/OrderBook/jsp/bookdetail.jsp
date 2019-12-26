<%--
  Created by IntelliJ IDEA.
  User: 王镜
  Date: 2019/6/24 0024
  Time: 15:35
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
    <title>BookTextOrder</title>
</head>
<link rel="stylesheet" type="text/css" href="css/bookdetail.css">
<body>


<div class="content">
    <a href="users/index"><span class="glyphicon glyphicon-home"></span>
        &nbsp;&nbsp;首页</a>
    <h2>图书详情信息</h2>
    <div class="left">
        <img src="${book.imgpath}">
    </div>
    <div class="right">
        <div class="right1">
            <h3>${book.bookname}</h3>
            <ul>
                <li>作者:${book.author}</li>
                <li>出版社：${book.press}</li>
                <li>价格：${book.price}</li>
                <li>库存：${book.number}</li>
            </ul>
        </div>
        <!--弹出框，如果会员没有登录的话（还没写）-->
    </div>
    <div class="bottom">
        <h4>内容简介</h4>
        <p>${book.content}</p>
    </div>


    <c:if test="${user!=null}">

            <div class="buy">
                <form id="form1">
<%--                <form id="form2">--%>
                    选择需要购买的数量：<input type="text" name="number" value="1"/>
                    <input type="hidden" value="${book.id}" name="bookid">
                    <input type="hidden" value="${user.id}" name="id">
                    <input class="btn btn-default" type="button" value="加入购物车" id="btn1" />
<%--                </form>--%>
                <input class="btn btn-default" type="button" value="立即购买" id="btn2" />
                </form>
             </div>



    </c:if>

</div>

<div class="foot">

    <div class="r_div">
        <c:choose>
            <c:when test="${book_next!=null}">
                <a href="books/getById?id=${book_next.id}">上一篇:&nbsp;${book_next.bookname}</a>
            </c:when>
            <c:otherwise>
                &nbsp;没有更多的图书了
            </c:otherwise>
        </c:choose>
        <span class="glyphicon glyphicon-chevron-right"></span>
    </div>

    <div class="f_div">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <c:choose>
            <c:when test="${book_pre!=null}">
                <a href="books/getById?id=${book_pre.id}">&nbsp;下一篇:${book_pre.bookname}</a>
            </c:when>
            <c:otherwise>
                &nbsp;没有更多的图书了
            </c:otherwise>
        </c:choose>

    </div>
</div>


</body>
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/layer/layer.js"></script>
<script src="js/book.js"></script>

<script type="text/javascript"></script>

</html>
