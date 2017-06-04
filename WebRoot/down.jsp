<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <link rel="stylesheet" href="mycss/down.css">

  </head>
  
  <body>
	<div class="downheader"><div>请选择你要下载的文件</div></div>
	<div></div>
	</body>
</html>
