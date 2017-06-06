<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>注册</title>
     <link href="mycss/main.css" type="text/css" rel="stylesheet">
   	<link href="mycss/bar.css" type="text/css" rel="stylesheet">
   	<link href="mycss/register.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="sweetalert.css">
	<script language="javascript">  
		   //创建XMLHttpRequest对象   
		 function GetO()  {   
		   var ajax=false;   
		    try     {   
		     ajax = new ActiveXObject("Msxml2.XMLHTTP");   
		    }   
		    catch (e)     {   
		      try       {   
		       ajax = new ActiveXObject("Microsoft.XMLHTTP");   
		      }   
		      catch (E)       {   
		       ajax = false;   
		      }   
		    }   
		    if (!ajax && typeof XMLHttpRequest!='undefined')     {   
		     ajax = new XMLHttpRequest();   
		    }   
		    return ajax;   
		 }   
		   
		 function getMyHTML(serverPage, objID) {   
		   var ajax = GetO();   
		    //得到了一个html元素，在下面给这个元素的属性赋值   
		  var obj = document.all[objID];   
		    //设置请求方法及目标，并且设置为异步提交   
		 ajax.open("post", serverPage, true);   
		 ajax.onreadystatechange = function()  {   
		    if (ajax.readyState == 4 && ajax.status == 200)     {   
		    //innerHTML是HTML元素的属性，如果您不理解属性那就理解为HTML元素的变量   
		    //ajax.responseText是服务器的返回值，把值赋给id=passport1的元素的属性   
		    //innerHTML这个属性或说这个变量表示一组开始标记和结束标记之间的内容   
		     obj.innerHTML = ajax.responseText;   
		    }   
		   }   
		    //发送请求   
		 ajax.send(null);   
		   }   
		   function CheckName()    {   
		     getMyHTML("views/main/check.jsp?userName="+a.username.value, "passport1")
		   }   
		   //这个函数的作用是当用户的焦点从其他地方回到group_name这个输入框时再给属性赋回原内容   
		 function sl(tx)    {   
		    if(tx=='passport1')   {   
		      document.all[tx].innerHTML = "<div class='reds' align='left'>o(*￣▽￣*)ブ用户名为4-20 个字符 (包括大小写字母,中文,数字,特殊字符等) 1个汉字等于2个字符。注册后不可修改。</div>";   
		     }   
		   }  
		  
	</script>  
  </head> 
  <body>
      <div id="welcome"> 信工农贸信息管理系统——注册界面</div>
      <form name="a" method="post" action="servlet/Register" id="loginform">
        <div class="alert">
          	请填写表单
        </div>
        <div id="content">
            <div class="doinput">
                <center>
                <INPUT name="username" type="text" value="" size=30  
                            maxlength="50" onBlur="javaScript:CheckName();"  
                            onFocus="return sl('passport1');" class="myuser" placeholder="新账号" />  
                        <div id="passport1" style="color: red"></div>  
				</center>
            </div>
            <div id="content">
                <div class="doinput">
                  <center>
                    <Input type=text name="password" placeholder="新密码"  class="mypassword">
                    <div>
                    </div>
                  </center>
                </div>
            </div>
            <div class="doinput">
              <center>
                <input type="radio" name="power" value="1" class="myradio">高级管理员
                <input type="radio" name="power" value="2" class="myradio">普通管理员
            </center>
                <input type="submit" name="register" value="注册并返回" class="mybutton">
            </div>
        </div>
    </form>
  </body>
</html>
