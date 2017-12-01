<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2017/12/1
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功测试</title>
</head>
<body>
<h1>登陆成功！</h1>

<hr>
欢迎<%= session.getAttribute("name")%> 进入图书馆管理系统
</body>
</html>
