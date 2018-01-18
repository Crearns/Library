<%@ page import="Entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/1/14
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%
    request.setCharacterEncoding("utf-8");
    if(session.getAttribute("adminname") == null){
        response.sendRedirect("/Library/index.jsp");
    }
%>
<html>
<head>
    <title>图书编辑</title>
</head>
<body>
<h1 align="center">欢迎进入图书馆管理系统</h1>
<jsp:include page="nav.html"/>
<%
    Book book = (Book)session.getAttribute("resultbook");
%>
<form action="BookAction?action=EditDone" method="post">
    <div class="detail">
        <div class="title">
            <span>编辑图书详情信息</span>
        </div>
        <div>
            <span class="infotitle">书本编号：</span><input name="id" value="<%=book.getId()%>" readonly="readonly">
        </div>
        <div>
            <span class="infotitle">书本名称：</span><input name="name" value="<%=book.getName()%>">
        </div>
        <div>
            <span class="infotitle">书本作者：</span><input name="author" value="<%=book.getAuthor()%>">
        </div>
        <div>
            <span class="infotitle">出版单位：</span><input name="publisher" value="<%=book.getPublisher()%>">
        </div>
        <div>
            <span class="infotitle">书本价格：</span><input name="price" value="<%=book.getPrice()%>">
        </div>
        <div>
            <span class="infotitle">书本类目：</span><input name="category" value="<%=book.getCategory()%>">
        </div>
        <div>
            <span class="infotitle">书本库存：</span><input name="store" value="<%=book.getStore()%>">
        </div>
        <div>
            <span class="infotitle">所在位置：</span><input name="location" value="<%=book.getLocation()%>">
        </div>
        <div>
            <span class="infotitle">书本详情：</span><textarea name="desc"><%=book.getDesc()%></textarea>
        </div>
        <div class="button">
            <button type="submit" class="btn btn-success">编辑完成</button>
            <a href="BookAction?action=DeleteById&id=<%=book.getId()%>"><button type="button" class="btn btn-danger">删除书本</button></a>
            <a href="BookAction?action=getall"><button type="button" class="btn btn-info">返回总表</button></a>
        </div>
    </div>
</form>
</body>
</html>
