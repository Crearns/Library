
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
    function check(){
        var readerid = document.getElementById("readerid").value;
        createXMLHttpRequest();   //调用创建XMLHttpRequest对象的方法
        xmlHttp.onreadystatechange=checkResult;   //设置回调函数
        var url="ReaderAction?action=QueryReaderById&readerid=" + readerid;
        xmlHttp.open("POST",url,true);      //向服务器端发送请求
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf8");
        xmlHttp.send(null);
    }

    function checkResult(){
        var readername = document.getElementById("readername");
        var readerclass = document.getElementById("readerclass");
        var readerstatus = document.getElementById("readerstatus");
        if (xmlHttp.readyState==4 && xmlHttp.status==200){
            var data= xmlHttp.responseText;
            var parameters=data.split("||");
            var getreadername = parameters[0];
            var getreaderclass = parameters[1];
            var getreaderstatus = parameters[2];
            if(getreadername == "null"){
                readername.value = "未知";
                readerclass.value = "未知";
                readerstatus.value = "未知";
            }
            else{
                readername.value = getreadername;
                readerclass.value = getreaderclass;
                readerstatus.value = getreaderstatus;
            }

        }
    }
