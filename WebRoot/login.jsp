<%@page import="db.login"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="db.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <base href="<%=basePath%>">
    <title>��¼</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<link href="mycss/main.css" type="text/css" rel="stylesheet">
   	<link href="mycss/bar.css" type="text/css" rel="stylesheet">
   	<link href="mycss/login.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="sweetalert.css">
  </head>
  
  <body>
    <div id="welcome"> �Ź�ũó��Ϣ����ϵͳ��ӭ����</div>
    <FORM action="servlet/MatchingSQL" Method="post" id="loginform">
        <div class="alert">
            Please login with your Username and Password.
        </div>

        <div id="content">
            <div class="doinput">
                <center><Input type=text name="username" placeholder="UserName" class="myuser"></center>
            </div>
            <div id="content">
                <div class="doinput">
                  <center>
                    <Input type=password name="password" placeholder="PassWord"  class="mypassword">
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
                <Input type=submit value="��¼" class="mybutton" id="dologin">
                <a href="register.jsp" class="mybutton" id="doregister">ע��</a>
            </div>
        </div>
    </form>

  </body>
</html>
