<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2017/11/30
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
  <head>
    <title>管理员登录</title>
  </head>
  <body>
      <h1 align="center"> <b>欢迎使用图书馆管理系统</b></h1>
      <hr>
      <div class="container">
          <div class="row clearfix">
              <div class="col-md-12 column">
                  <div class="row clearfix">
                      <div class="col-md-4 column">
                      </div>
                      <div class="col-md-4 column">
                          <form role="form" action="/Library/Action/LoginAction?action=login"  method="post">
                              <div class="form-group">
                                  <label for="exampleInputEmail1">账号</label><input type="text" class="form-control" id="exampleInputEmail1" name="username"/>
                              </div>
                              <div class="form-group">
                                  <label for="exampleInputPassword1">密码</label><input type="password" class="form-control" id="exampleInputPassword1" name="password"/>
                              </div>
                              <center><button  type="submit" class="btn btn-default" >登录</button></center>
                          </form>
                      </div>
                      <div class="col-md-4 column">
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </body>
</html>
