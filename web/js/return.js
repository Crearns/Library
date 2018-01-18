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
    function readercheck(){
        var readerid = document.getElementById("readerid").value;
        createXMLHttpRequest();   //调用创建XMLHttpRequest对象的方法
        xmlHttp.onreadystatechange=readercheckResult;   //设置回调函数
        var url="ReaderAction?action=QueryReaderById&readerid=" + readerid;
        xmlHttp.open("POST",url,true);      //向服务器端发送请求
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf8");
        xmlHttp.send(null);
    }
	
    function readercheckResult(){
        var readername = document.getElementById("readername");
        if (xmlHttp.readyState==4 && xmlHttp.status==200){
            var data= xmlHttp.responseText;
            var parameters=data.split("||");
            var getreadername = parameters[0];
            if(getreadername == "null"){
				document.getElementById("readeridcheck").innerHTML = "*请输入正确学号";
            }
			else{
				document.getElementById("readeridcheck").innerHTML = "";
            }
        }
    }
	
	function errorsubmit(){
		var readerid = document.getElementById("readerid").value;
		var readeridcheck =  document.getElementById("readeridcheck").innerHTML;
		if(readerid == ""){
			document.getElementById("readeridcheck").innerHTML = "*学号不能为空";
			return false;
		}
		if (readeridcheck.length > 0)
			return false;
	}