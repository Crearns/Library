<%@ page import="Entity.Book" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/1/12
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addbook.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
<head>
    <title>书本添加确认</title>
</head>
<body>
<h1 align="center">欢迎进入图书馆管理系统</h1>
</body>
<body>
<jsp:include page="nav.html"/>
<%
    request.setCharacterEncoding("utf-8");
    if(session.getAttribute("adminname") == null){
        response.sendRedirect("/Library/index.jsp");
    }
    ArrayList<Book> addbooklist = (ArrayList<Book>)session.getAttribute("addbooklist");
%>
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
        if(addbooklist!=null && addbooklist.size() > 0)
        {
            for(int i = 0; i < addbooklist.size(); i++)
            {
                Book b = addbooklist.get(i);
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
<div class="button">
    <button onclick="location.href='BookAction?action=confirm'" class="btn btn-success">确认添加</button>
    <button onclick="location.href='BookAction?action=truncatetable'" class="btn btn-danger">清空列表</button>
</div>
</body>
</html>
