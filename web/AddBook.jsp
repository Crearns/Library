<%--
  Created by IntelliJ IDEA.
  User: Creams
  Date: 2018/1/11
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addpage.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%
    request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <title>书本添加</title>
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
%>
<form action="BookAction?action=addtemp" method="post">
    <div class="bookinfo">
        <div class="title">
            <span>请输入书本信息</span>
        </div>
        <div>
            <span class="infotitle">书本编号：</span><input name="bookid" class="required" id="bookid" >
        </div>
        <div>
            <span class="infotitle">书本名称：</span><input class="required" name="bookname">
        </div>
        <div>
            <span class="infotitle">书本作者：</span><input class="required" name="bookauthor">
        </div>
        <div>
            <span class="infotitle">出版单位：</span><input class="required" name="bookpublisher">
        </div>
        <div>
            <span class="infotitle">书本价格：</span><input class="required" name="bookprice">
        </div>
        <div>
            <span class="infotitle">书本类目：</span><input class="required" name="bookcategory">
        </div>
        <div>
            <span class="infotitle">书本库存：</span><input class="required" name="bookstore" >
        </div>
        <div>
            <span class="infotitle">所在位置：</span><input class="required" name="booklocation" >
        </div>
        <div>
            <span class="infotitle">书本详情：</span><textarea name="bookdesc"></textarea>
        </div>
        <div class="button">
            <button type="submit" class="btn btn-default" name="over" value="1">完成添加</button>
            <button type="submit" class="btn btn-default" name="over" value="0" id="send">继续添加</button>
        </div>
    </div>
</form>
<script type="text/javascript">
    $('form :input').blur(function () {
        var $parent = $(this).parent();
        $parent.find(".formtips").remove();
        if( $(this).is('#bookid')){
            if(this.value == "" || this.value.length < 6){
                var errorMsg = "请输入至少6位编号.";
                $parent.append('<span class="formtips onError">'+errorMsg+'</span>')
            }
            else{
                var okMsg = '输入正确.';
                $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>')
            }
        }

    });
    
    $("form :input.required").each(function () {
       var $required = $("<strong class='high'>*</strong>");
       $(this).parent().append($required);
    });
    
    $('#send').click(function () {
       $("form .required:input").trigger('blur');
       var numError = $(form .onError).length;
       if(numError)
           return false;
    });
</script>
</body>
</html>
    
