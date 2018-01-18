<%@ page import="Entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/1/14
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
<head>
    <title>图书详情</title>
</head>
<body>
<h1 align="center">欢迎进入图书馆管理系统</h1>
<jsp:include page="nav.html"/>
<%
    request.setCharacterEncoding("utf-8");
    if(session.getAttribute("adminname") == null){
        response.sendRedirect("/Library/index.jsp");
    }
%>
<%
    Book book = (Book)session.getAttribute("resultbook");
%>
<div class="detail">
    <div class="title">
        <span>图书详情信息</span>
    </div>
    <div id="id">
        <span class="infotitle">书本编号：</span><span class="info"><%=book.getId()%></span>
    </div>
    <div>
        <span class="infotitle">书本名称：</span><span class="info"><%=book.getName()%></span>
    </div>
    <div>
        <span class="infotitle">书本作者：</span><span class="info"><%=book.getAuthor()%></span>
    </div>
    <div>
        <span class="infotitle">出版单位：</span><span class="info"><%=book.getPublisher()%></span>
    </div>
    <div>
        <span class="infotitle">书本价格：</span><span class="info"><%=book.getPrice()%>元</span>
    </div>
    <div>
        <span class="infotitle">书本类目：</span><span class="info"><%=book.getCategory()%></span>
    </div>
    <div>
        <span class="infotitle">书本库存：</span><span class="info"><%=book.getStore()%>本</span>
    </div>
    <div>
        <span class="infotitle">书本所在位置：</span><span class="info"><%=book.getLocation()%>号柜</span>
    </div>
    <div>
        <span class="infotitle">书本详情：</span><span class="info"><%=book.getDesc()%></span>
    </div>
    <div class="button">
        <a href="BookAction?action=querybookbyid&id=<%=book.getId()%>&next=edit"><button type="button" class="btn btn-default">编辑信息</button></a>
        <a href="BookAction?action=getall"><button type="button" class="btn btn-info">返回总表</button></a>
    </div>
</div>
</body>
</html>
