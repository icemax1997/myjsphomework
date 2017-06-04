
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
<jsp:useBean id="du" class="db.DbUtil3"/>
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
   <link href="../main.css" type="text/css" rel="stylesheet">
    <base href="<%=basePath%>">
     
    <title>Download</title>
<style type="text/css">

</style>
  </head>
  
  <body>
   <%
  
  int pageSize = 999;
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

                <th width="46" scope="col">操作内容——插入</th>
                
            </tr>
            <%for(String[] temp : list){ %>
            <tr>
                
                <td>
                   	 用户admin插入了一条品名为<%=temp[1] %>的记录
                </td>
                
            </tr>
            <%} %>
        </table>
 </body>
</html>
