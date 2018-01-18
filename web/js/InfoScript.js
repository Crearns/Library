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
        var readerclass = document.getElementById("readerclass");
        var readerstatus = document.getElementById("readerstatus");
		var readerborrow = document.getElementById("readerborrow");
        if (xmlHttp.readyState==4 && xmlHttp.status==200){
            var data= xmlHttp.responseText;
            var parameters=data.split("||");
            var getreadername = parameters[0];
            var getreaderclass = parameters[1];
            var getreaderstatus = parameters[2];
			var getreaderborrow = parameters[3];
            if(getreadername == "null"){
                readername.value = "未知";
                readerclass.value = "未知";
                readerstatus.value = "未知";
				readerborrow.value = "未知";
				document.getElementById("readeridcheck").innerHTML = "*请输入正确学号";
            }
			else{
                readername.value = getreadername;
                readerclass.value = getreaderclass;
                readerstatus.value = getreaderstatus;
				readerborrow.value = getreaderborrow;
				document.getElementById("readeridcheck").innerHTML = "";
				document.getElementById("readerstatuscheck").innerHTML = "";
            }
			if(getreaderstatus == "异常" && getreadername != "null"){
				document.getElementById("readerstatuscheck").innerHTML = "*该用户异常无法借阅";
			}
			else if(getreaderborrow == "5"){
				document.getElementById("readerborrowcheck").innerHTML = "*该用户借阅过多";
			}
			else{
				document.getElementById("readerstatuscheck").innerHTML = "";
			}

        }
    }
	
	function bookcheck(){
        var bookid = document.getElementById("bookid").value;
        createXMLHttpRequest();   //调用创建XMLHttpRequest对象的方法
        xmlHttp.onreadystatechange=bookcheckResult;   //设置回调函数
        var url="BookAction?action=querybookbyid&next=borrowcheck&id=" + bookid;
        xmlHttp.open("POST",url,true);      //向服务器端发送请求
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf8");
        xmlHttp.send(null);
    }
	
	function bookcheckResult(){
        var bookname = document.getElementById("bookname");
        var bookauthor = document.getElementById("bookauthor");
        var bookpublisher = document.getElementById("bookpublisher");
		var bookremain = document.getElementById("bookremain");
        if (xmlHttp.readyState==4 && xmlHttp.status==200){
            var data= xmlHttp.responseText;
            var parameters=data.split("||");
            var getbookname = parameters[0];
            var getbookauthor = parameters[1];
            var getbookpublisher = parameters[2];
			var getbookremain = parameters[3];
            if(getbookname == "null"){
                bookname.value = "未知";
                bookauthor.value = "未知";
                bookpublisher.value = "未知";
				bookremain.value = "未知";
				document.getElementById("bookidcheck").innerHTML = "*请输入正确编号";
            }
			else{
                bookname.value = getbookname;
                bookauthor.value = getbookauthor;
                bookpublisher.value = getbookpublisher;
				bookremain.value = getbookremain;
				document.getElementById("bookidcheck").innerHTML = "";
				document.getElementById("bookidcheck").innerHTML = "";
            }
			if(parseInt(getbookremain) == 0 && getbookname != "null"){
				document.getElementById("booknumcheck").innerHTML = "*该书已全部借出";
			}
			else{
				document.getElementById("booknumcheck").innerHTML = "";
			}
        }
    }
	
	function errorsubmit(){
		var readerid = document.getElementById("readerid").value;
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
