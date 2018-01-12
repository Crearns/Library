<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/1/11
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addbook.css">
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
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/booklist.jsp">查看图书总表</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/AddBook.jsp">添加书本</a>
                    <a class="dropdown-item" href="#">书本信息编辑</a>
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

<div class="bookinfo">
    <form action="BookAction?action=addtemp" method="post">
        <span id="title">请输入书本信息</span>
        <br>
        <label>书编号</label>
        <input type="text" name="bookid" />
        <br>
        <label>书名</label>
        <input type="text" name="bookname" />
        <br>
        <label>作者</label>
        <input type="text" name="bookauthor" />
        <br>
        <label>出版社</label>
        <input type="text" name="bookpublisher" />
        <br>
        <label>价格</label>
        <input type="text" name="bookprice" />
        <br>
        <label>类目</label>
        <input type="text" name="bookcategory" />
        <br>
        <label>库存</label>
        <input type="text" name="bookstore" />
        <br>
        <label>所在位置</label>
        <input type="text" name="booklocation" />
        <br>
        <label>书本描述</label>
        <textarea name="bookdesc"></textarea>
        <br>
        <button type="submit">完成</button>
        <button type="submit">下一本书</button>     
    </form>
</div>
</body>
</html>

