<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ע��</title>
         <link href="mycss/main.css" type="text/css" rel="stylesheet">
   	<link href="mycss/bar.css" type="text/css" rel="stylesheet">
   	<link href="mycss/register.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="sweetalert.css">
	<script language="javascript">  
		   //����XMLHttpRequest����   
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
		    //�õ���һ��htmlԪ�أ�����������Ԫ�ص����Ը�ֵ   
		  var obj = document.all[objID];   
		    //�������󷽷���Ŀ�꣬��������Ϊ�첽�ύ   
		 ajax.open("post", serverPage, true);   
		 ajax.onreadystatechange = function()  {   
		    if (ajax.readyState == 4 && ajax.status == 200)     {   
		    //innerHTML��HTMLԪ�ص����ԣ����������������Ǿ����ΪHTMLԪ�صı���   
		    //ajax.responseText�Ƿ������ķ���ֵ����ֵ����id=passport1��Ԫ�ص�����   
		    //innerHTML������Ի�˵���������ʾһ�鿪ʼ��Ǻͽ������֮�������   
		     obj.innerHTML = ajax.responseText;   
		    }   
		   }   
		    //��������   
		 ajax.send(null);   
		   }   
		   function CheckName()    {   
		     getMyHTML("check.jsp?userName="+a.username.value, "passport1")
		   }   
		   //��������������ǵ��û��Ľ���������ط��ص�group_name��������ʱ�ٸ����Ը���ԭ����   
		 function sl(tx)    {   
		    if(tx=='passport1')   {   
		      document.all[tx].innerHTML = "<div class='reds' align='left'>o(*������*)���û���Ϊ4-20 ���ַ� (������Сд��ĸ,����,����,�����ַ���) 1�����ֵ���2���ַ���ע��󲻿��޸ġ�</div>";   
		     }   
		   }  
		  
	</script>  
  </head> 
  <body>
      <div id="welcome"> �Ź�ũó��Ϣ����ϵͳ����ע�����</div>
      <form name="a" method="post" action="servlet/Register" id="loginform">
        <div class="alert">
            Please register with your Username and Password.
        </div>

        <div id="content">
            <div class="doinput">
                <center>
                <INPUT name="username" type="text" value="" size=30  
                            maxlength="50" onBlur="javaScript:CheckName();"  
                            onFocus="return sl('passport1');" class="myuser"/>  
                        <div id="passport1" style="color: red"></div>  

				</center>
            </div>
            <div id="content">
                <div class="doinput">
                  <center>
                    <Input type=text name="password" placeholder="New PassWord"  class="mypassword">
                    <div>
                    </div>
                  </center>
                </div>
            </div>
            <div class="doinput">
              <center>
                <input type="radio" name="power" value="1" class="myradio">�߼�����Ա
                <input type="radio" name="power" value="2" class="myradio">��ͨ����Ա
            </center>
                <input type="submit" name="register" value="ע�Ტ����" class="mybutton">
            </div>
        </div>
    </form>

    
  </body>
</html>
