<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/1/11
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/add.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%
    request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <title>书本添加</title>
</head>
<body onload="a()">
<h1 align="center">欢迎进入图书馆管理系统</h1>
</body>
<body>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand" href="#">Library</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/main.jsp">首页</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="" id="navbardrop" data-toggle="dropdown">
                    图书管理
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="BookAction?action=getall">查看图书总表</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/AddBook.jsp">添加书本</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="" id="navbardrop" data-toggle="dropdown">
                    借书与还书
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">借书</a>
                    <a class="dropdown-item" href="#">还书</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">图书进出记录</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">用户管理</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">当前管理员信息</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">系统查询</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">图书预约</a>
            </li>
        </ul>
    </div>
</nav>
<form action="BookAction?action=addtemp" method="post">
    <div class="bookinfo">
        <div class="title">
            <span>请输入书本信息</span>
        </div>
        <div>
            <span class="infotitle">书本编号：</span><input name="bookid" >
        </div>
        <div>
            <span class="infotitle">书本名称：</span><input name="bookname">
        </div>
        <div>
            <span class="infotitle">书本作者：</span><input name="bookauthor">
        </div>
        <div>
            <span class="infotitle">出版单位：</span><input name="bookpublisher">
        </div>
        <div>
            <span class="infotitle">书本价格：</span><input name="bookprice">
        </div>
        <div>
            <span class="infotitle">书本类目：</span><input name="bookcategory">
        </div>
        <div>
            <span class="infotitle">书本库存：</span><input name="bookstore" >
        </div>
        <div>
            <span class="infotitle">所在位置：</span><input name="booklocation" >
        </div>
        <div>
            <span class="infotitle">书本详情：</span><textarea name="bookdesc"></textarea>
        </div>
        <div class="button">
            <button type="submit" class="btn btn-default" name="over" value="1">完成添加</button>
            <button type="submit" class="btn btn-default" name="over" value="0">继续添加</button>
        </div>
    </div>
</form>
</body>
</html>
    
