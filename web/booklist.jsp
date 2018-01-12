<%@ page import="Dao.BookDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entity.Book" %>
<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2017/12/2
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function a(){
        $.ajax({
            url:"BookAction?action=getall",//servlet文件的名称  
            type:"GET",
        });
    }
</script>
<%
    ArrayList<Book> booklist = (ArrayList<Book>)session.getAttribute("allbooklist");
%>
<html>
<head>
    <title>图书管理</title>
</head>
<body onload="a()">
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
<br>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <form class="form-search">
                书本搜索：<input class="input-medium search-query" type="text" /><button class="btn" type="submit">查找</button>
            </form>
        </div>
    </div>
</div>
<table class="table">
    <thead>
    <tr>
        <th>书本编号</th>
        <th>书名</th>
        <th>作者</th>
        <th>出版社</th>
        <th>价格</th>
        <th>类目</th>
        <th>库存</th>
        <th>所在位置(柜号)</th>
    </tr>
    </thead>
    <tbody>
    <%
        if(booklist!=null && booklist.size() > 0)
        {
            for(int i = 0; i < booklist.size(); i++)
            {
                Book b = booklist.get(i);
    %>
    <tr>
        <td><%=b.getId()%></td>
        <td><%=b.getName()%></td>
        <td><%=b.getAuthor()%></td>
        <td><%=b.getPublisher()%></td>
        <td><%=b.getPrice()%></td>
        <td><%=b.getCategory()%></td>
        <td><%=b.getStore()%></td>
        <td><%=b.getLocation()%></td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>

</body>
</html>
