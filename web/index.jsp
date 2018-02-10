<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2017/11/30
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/loginScript.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
<head>
    <title>管理员登录</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    if(session.getAttribute("adminname") != null && session.getAttribute("logout") == null){
        response.sendRedirect("/Library/main.jsp");
    }
%>
<div class="welcome">
    <img src="${pageContext.request.contextPath}/image/welcome.jpg" width="1920px" height="945px">
</div>
<div class="Chineseword">
      <span>
          书是人类进步的阶梯 -高尔基
      </span>
</div>
<div class="Englishword">
      <span>
          Books are the stepping stones <br>to human progress. -Gorky
      </span>
</div>
<div class="loginform">
    <div class="col-md-4 column">
        <span id="labellogin">管理员系统登录</span><br>
        <div class="form-group">
            <input type="text" class="form-control" id="usernameinput" name="username" placeholder="用户名"/>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="passwordinput" name="password" placeholder="密码"/>
        </div>
        <button id="loginbutton" class="btn btn-primary" onclick="logincheck()">登录</button>
        <span class="errorsubmit" id="checkinfo"></span>
    </div>
</div>
</body>
</html>
