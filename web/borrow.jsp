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
<script src="${pageContext.request.contextPath}/js/InfoScript.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
<head>
    <title>书本借出记录登记表</title>
</head>
<%
    request.setCharacterEncoding("utf-8");
    if(session.getAttribute("adminname") == null){
        response.sendRedirect("/Library/index.jsp");
    }
%>
<body>
<h1 align="center">欢迎进入图书馆管理系统</h1>
<jsp:include page="nav.html"/>
<div class="borrowinfo">
    <div class="title">
        书本借出记录登记表
    </div>
    <form action="IOAction?action=borrow" onsubmit="return errorsubmit()" method="post">
        <div>
            <span class="infotitle">读者学号：</span><input type="text" onkeyup="readercheck()" name="readerid" id="readerid"><span id="readeridcheck" class="error"></span>
        </div>
        <div>
            <span class="infotitle">读者姓名：</span><input type="text" name="readername" id="readername" disabled>
        </div> 
        <div>
            <span class="infotitle">读者班级：</span><input type="text" name="readername" id="readerclass" disabled>
        </div>
        <div>
            <span class="infotitle">用户状态：</span><input type="text" name="readername" id="readerstatus" disabled><span id="readerstatuscheck" class="error"></span>
        </div>
        <div>
            <span class="infotitle">用户已借：</span><input type="text" name="readerborrow" id="readerborrow" disabled><span id="readerborrowcheck" class="error"></span>
        </div>
        <div>
            <span class="infotitle">书本编号：</span><input type="text" name="bookid" onkeyup="bookcheck()" id="bookid"><span id="bookidcheck" class="error"></span>
        </div>
        <div>
            <span class="infotitle">书本名称：</span><input type="text" name="bookname" id="bookname"disabled>
        </div>
        <div>
            <span class="infotitle">书本作者：</span><input type="text" name="bookauthor" id="bookauthor" disabled>
        </div>
        <div>
            <span class="infotitle">出版单位：</span><input type="text" name="bookpublisher" id="bookpublisher" disabled>
        </div>
        <div>
            <span class="infotitle">书本剩余：</span><input type="text" name="bookremain" id="bookremain" disabled><span id="booknumcheck" class="error"></span>
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
</body>
</html> 
