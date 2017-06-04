<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  
    String action = "";  
    String username = "";  
    //检查用户名  
  
    //用作数据库联接，可以根据你的情况修改，如果为测试可以不用*作记号的语句   
  			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=java.sql.DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/computer?useUnicode=true&characterEncoding=gb2312"
			,"root","mcrhenryh");
			Statement stmt=con.createStatement();
    	try {  
        action = request.getParameter("action");  
        username = request.getParameter("userName").trim();  
        ResultSet rst=stmt.executeQuery("select * from users where username ='"+username+"'");
			int flag=0;
			while(rst.next())
			{
				flag=1;
			}
			rst.close();
			stmt.close();
			con.close();
        if ("".equals(username)) {  
            out.println("<div class='reds' align='center'>╰（‵□′）╯用户名不能为空！</div>");  
        } else if (username.length() < 4 || username.length() > 20) {  
            out.println("<div class='reds' align='center'>用户名"  
                    + username + "您输入的用户名不合法(长度为4到20位，且不能使用?#=等特殊字符)</div>");  
        } else if (flag==1) {  
            out.println("<div class='reds' align='center'>" + "很抱歉，用户名"  
                    + username + "已被占用，请重新输入！</div>");  
        } else {  
            out.println("(～￣▽￣)～恭喜您的用户名可用");  
        }  
    } catch (Exception e) {  
        System.out.println(request.getServletPath() + " error : "  
                + e.getMessage());  
    }
    		
%>  


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>check</title>
    
  </head>
  
  <body>
    
  </body>
</html>
