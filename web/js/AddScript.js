    var xmlHttp=false;
    function createXMLHttpRequest()
    {
        if (window.ActiveXObject)  //在IE浏览器中创建XMLHttpRequest对象
        {
            try{
                xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch(e){
                try{
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                catch(ee){
                    xmlHttp=false;
                }
            }
        }
        else if (window.XMLHttpRequest) //在非IE浏览器中创建XMLHttpRequest对象
        {
            try{
                xmlHttp = new XMLHttpRequest();
            }
            catch(e){
                xmlHttp=false;
            }
        }
    }
	
	function bookcheck(){
        var bookid = document.getElementById("bookid").value;
        createXMLHttpRequest();   //调用创建XMLHttpRequest对象的方法
        xmlHttp.onreadystatechange=bookcheckResult;   //设置回调函数
        var url="BookAction?action=querybookbyid&next=existcheck&id=" + bookid;
        xmlHttp.open("POST",url,true);      //向服务器端发送请求
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf8");
        xmlHttp.send(null);
    }
	
	function bookcheckResult(){
        if (xmlHttp.readyState==4 && xmlHttp.status==200){
            var data= xmlHttp.responseText;
            if(data == "null"){
				alert(123);
				document.getElementById("bookidcheck").innerHTML = "*该编号已存在";
            }
			else{
				alert(123);
				document.getElementById("bookidcheck").innerHTML = "*该编号已存在";
            }
        }
    }
	
	function errorsubmit(){
		var readerid = document.getElementById("reader	id").value;
		var bookid = document.getElementById("bookid").value;
		var readeridcheck =  document.getElementById("readeridcheck").innerHTML;
		var readerstatuscheck =  document.getElementById("readerstatuscheck").innerHTML;
		var bookidcheck =  document.getElementById("bookidcheck").innerHTML;
		var booknumcheck =  document.getElementById("booknumcheck").innerHTML;
		var readerborrowcheck =  document.getElementById("readerborrowcheck").innerHTML;
		if (readerid == ""){
			document.getElementById("readeridcheck").innerHTML = "*学号不能为空";
			return false;
		}
		else if(bookid == ""){
			document.getElementById("bookidcheck").innerHTML = "*编号不能为空";
			return false;
		}
		else if (readeridcheck.length > 0 || readerstatuscheck.length > 0 || bookidcheck.length > 0 || booknumcheck.length > 0 || readerborrowcheck.length > 0)
			return false;
	}
