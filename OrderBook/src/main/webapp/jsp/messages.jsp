<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/24 0024
  Time: 15:45
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
                    <img src="img/header.jpg" height="130" width="130"
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
                        <td><a href="users/index"><span class="glyphicon glyphicon-home"></span>
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
                        <td><a href="about.html"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;&nbsp;关于</a></td>
                    </tr>
                </table>
            </div>
            <br/>

        </div>

        <div class="col-md-2" id="center_content"></div>
        <div class="col-md-7 " id="right_content">
            <br/><br/>
            <div class="list-group">

                <a href="#" class="list-group-item active">消息</a>
                <!-- 这里初始化信息发布 -->
                <c:forEach var="m" items="${messages}">
                    <div>
                        <hr>
                        <!-- 信息 -->
                        <div class="list-group" style="background: #fff;">


                                    <div>
                                        <div>
                                            <div>
                                                <a href="">${m.title}</a>
                                            </div>
                                            <div class="c_right">
                                                <img src="img/time.png">
                                                    ${m.date}&nbsp;&nbsp;
                                                <br/><br/>
                                                <span>${m.content}|</span>
                                                <span>${m.messager}|</span>
                                            </div>
                                        </div>

                                    </div>
                        </div>
                    </div>
                </c:forEach>
                <!-- 初始化标签完成 -->

            </div>
        </div>
    </div>

    <div class="foot_line"></div>
</div>
<!-- container -->


<div id="footer">
    <a href="javascript:scroll(0,0)">&nbsp;&nbsp;BookTextOrder</a>
</div>
<!-- footer -->

</body>
</html>