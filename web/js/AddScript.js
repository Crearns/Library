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
		document.getElementById("bookidcheck").innerHTML = "";
        xmlHttp.open("POST",url,true);      //向服务器端发送请求
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf8");
        xmlHttp.send(null);
    }
	
	function bookcheckResult(){
        if (xmlHttp.readyState==4 && xmlHttp.status==200){
            var data= xmlHttp.responseText;	
			if(data != "null"){
				document.getElementById("bookidcheck").innerHTML = "*该编号已存在";
			}
        }
    }
	
	function errorsubmit(){
		var bookidcheck =  document.getElementById("bookidcheck").innerHTML;
		if (bookidcheck.length > 0)
			return false;
	}
