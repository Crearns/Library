<%@ page import="java.util.ArrayList" %>
<%@ page import="Entity.Reader" %>
<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/1/23
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
<%
    request.setCharacterEncoding("utf-8");
    if(session.getAttribute("adminname") == null){
        response.sendRedirect("/Library/index.jsp");
    }
    ArrayList<Reader> readerlist = (ArrayList<Reader>)session.getAttribute("readerlist");
%>
<head>
    <title>读者列表</title>
</head>
<body>
<h1 align="center">欢迎进入图书馆管理系统</h1>
<jsp:include page="nav.html"/>

<table class="table">
    <thead>
    <tr>
        <th>读者ID</th>
        <th>读者姓名</th>
        <th>读者性别</th>
        <th>读者当前状态</th>
        <th>读者邮箱</th>
        <th>读者电话</th>
        <th>读者班级</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <%
        if(readerlist!=null && readerlist.size() > 0)
        {
            for(int i = 0; i < readerlist.size(); i++)
            {
                Reader reader = readerlist.get(i);
    %>
    <tr>
        <td><%=reader.getUsername()%></td>
        <td><%=reader.getName()%></td>
        <td><%=reader.getSex()%></td>
        <td><%=reader.getStatus()%></td>
        <td><%=reader.getMail()%></td>
        <td><%=reader.getTel()%></td>
        <td><%=reader.getGrade()%>年级<%=reader.getClassnum()%>班</td>
        <td><a href="#">编辑信息</a></td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
</body>
</html>
