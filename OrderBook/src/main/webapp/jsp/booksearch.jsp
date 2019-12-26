<%--
  Created by IntelliJ IDEA.
  User: 王镜
  Date: 2019/6/25 0025
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<body>
<head>
    <base href="<%=basePath%>">
    <title>Book</title>
</head>
<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="style/adMain.css">
<link rel="stylesheet" type="text/css" href="style/adCheckBook.css">
<script type="text/javascript" src="script/jquery-2.1.4.min.js"></script>
<body>

<a href="jsp/main.jsp"><span class="glyphicon glyphicon-home"></span>
    &nbsp;&nbsp;首页</a>


<div class="content">
    <div class="right">
        <div class="ad_data">
            <div class="search">
                <form id="formx" action="books/booksearch" method="post">
                <input class="in" type="text" name="sea"   placeholder="关键字/图书名称" onfocus="if(value=='关键字/图书名/出版社') {value=''}" onblur="if (value=='') {value='图书编号/图书名/出版社'}" />

                <input class="btn"  type="submit" value="搜索" id="btn" />
                </form>
            </div>
            <div class="table_div">
                <table class="table">
                    <thead>
                    <tr>
                        <th>图书名称</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>出版日期</th>
                        <th>价格</th>
                        <th>在库数量</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="book" items="${book_lists}">
                    <tr>
                        <td>${book.bookname}</td>
                        <td>${book.author}</td>
                        <td>${book.press}</td>
                        <td>${book.pressdate}</td>
                        <td>${book.price}</td>
                        <td>${book.number}</td>
                        <td></td>
                    </tr>

                    </c:forEach>

                    </tbody>
                </table>
            </div>

        </div>
    </div>
    <div class="clear"></div>
</div>
</div>

</body>


<script type="text/javascript"></script>

</html>
