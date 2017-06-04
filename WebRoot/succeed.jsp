<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'succeed.jsp' starting page</title>
    
  </head>
  
  <body>
    <%
    	String user=request.getParameter("user");
    	String password=request.getParameter("password");
     %>
     user=<%=user %><br>
     password=<%=password %><br>
     <%
     	if(user.equals("admin")&&password.equals("admin")){
     		out.print("welcome You!");
     		response.sendRedirect("index.jsp?table=shuiguoshucai"); 
     	} else{
     		out.print("´íÎó");
     	}
     	
     	%>
     
  </body>
</html>
