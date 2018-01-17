<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/1/15
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/borrow.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
<head>
    <title>书本借出记录登记表</title>
</head>
<body>
<h1 align="center">欢迎进入图书馆管理系统</h1>

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
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/borrow.jsp">借书</a>
                    <a class="dropdown-item" href="#">还书</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="IOAction?action=getlog">图书进出记录</a>
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

<div class="borrowinfo">
    <div class="title">
        书本借出记录登记表
    </div>
    <form action="IOAction?action=borrow" method="post">
        <div>
            <span class="infotitle">读者学号：</span><input type="text" name="readerid" onkeyup="a()">
        </div>
        <div>
            <span class="infotitle">读者姓名：</span><input type="text" name="readername" id="readername" disabled>
        </div>
        <div>
            <span class="infotitle">读者班级：</span><input type="text" name="readername" id="readerclass" disabled>
        </div>
        <div>
            <span class="infotitle">用户状态：</span><input type="text" name="readername" id="readerstatus" disabled>
        </div>
        <div>
            <span class="infotitle">书本编号：</span><input type="text" name="bookid" id="bookid">
        </div>
        <div>
            <span class="infotitle">书本名称：</span><input name="bookname" id="bookname"disabled>
        </div>
        <div>
            <span class="infotitle">书本作者：</span><input name="bookauthor" id="bookauthor" disabled>
        </div>
        <div>
            <span class="infotitle">出版单位：</span><input name="bookpublisher" id="bookpublisher" disabled>
        </div>
        <div>
            <span class="infotitle">书本剩余：</span><input name="bookname" id="bookremain" disabled>
        </div>
        <div>
            <span class="infotitle">借阅时间：</span>
            <select name="borrowday">
                <option value="7">7天</option>
                <option value="14">14天</option>
            </select>
        </div>
        <div class="button">
            <button type="submit" class="btn btn-success">提交</button>
            <button type="reset" class="btn btn-default">重填</button>
        </div>
    </form>
</div>
<%--<script type="text/javascript">--%>
    <%--function a() {--%>
        <%--var a = document.getElementById("readername");--%>
        <%--var b = document.getElementById("readerclass");--%>
        <%--var c = document.getElementById("readerstatus");--%>
        <%--var d = document.getElementById("bookremain");--%>
        <%--a.value="aaa";--%>
        <%--b.value="aaa";--%>
        <%--c.value="aaa";--%>
        <%--d.value=1;--%>
    <%--}--%>
    <%----%>
    <%--$('form :input').blur(function () {--%>
       <%--var $parent= $(this).parent();--%>
       <%--if( $(this).is('#bookid')){--%>
           <%--if( document.getElementById("bookremain").value <= 0){--%>
               <%--var errorMsg = "书本剩余不足 请择日借阅";--%>
               <%--$parent.append('<span class="formtips onError">'+errorMsg +'</span>');--%>
           <%--}--%>
       <%--}--%>
    <%--});--%>
<%--</script>--%>
</body>
</html> 
