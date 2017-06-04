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
    <title>登录</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<link href="mycss/main.css" type="text/css" rel="stylesheet">
   	<link href="mycss/bar.css" type="text/css" rel="stylesheet">
   	<link href="mycss/login.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="sweetalert.css">
  </head>
  
  <body>
    <div id="welcome"> 信工农贸信息管理系统欢迎您！</div>
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
                <input type="radio" name="power" value="1" class="myradio">高级管理员
                <input type="radio" name="power" value="2" class="myradio">普通管理员
            </center>
                <Input type=submit value="登录" class="mybutton" id="dologin">
                <a href="register.jsp" class="mybutton" id="doregister">注册</a>
            </div>
        </div>
    </form>

  </body>
</html>
