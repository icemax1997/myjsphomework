
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
<jsp:useBean id="du" class="db.DbUtil4"/>
<%@ page language="java" import="db.login" %>
<jsp:useBean id="smark" class="mark.MarkLogic" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <%
        String exportToWord = request.getParameter("exportToWord");
        if (exportToWord != null
                && exportToWord.toString().equalsIgnoreCase("YES")) {
            response.setContentType("application/vnd.ms-word");
            response.setHeader("Content-Disposition", "inline; filename="
                    + "word.doc");
 
        }
    %>
      <%
  String table=request.getParameter("table");
   %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <link href="mycss/main.css" type="text/css" rel="stylesheet">
    <title>Download</title>

  </head>
  
  <body>
    <%
  
  int pageSize = 99;
  int currentPage = 1;
  String param = request.getParameter("currentPage");
  if(param!=null&&!"".equals(param)){
  		currentPage = Integer.parseInt(param);
  		if(currentPage==0)
  		   currentPage = 1;
  }
  
  List<String[]> list = du.getPageData(table,pageSize, currentPage);
   %>


	<table class="listtable">
            <tr> 
            <th width="46" scope="col">ID</th>
                <th width="67" scope="col">用户管理</th>
                <th width="66" scope="col">用户名</th>
                <th width="82" scope="col">密码</th>  
               
            </tr>
            <%for(String[] temp : list){ %>
            <tr>
                <td>
                    <%=temp[0] %>
                </td>
                <td>
                    <%=temp[1] %>
                </td>
                <td>
                    <%=temp[2] %>
                </td>
                <td>
                    <%=temp[3] %>
                </td>
                   
            </tr>
            <%} %>
        </table>
 </body>
</html>
