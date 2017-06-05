<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:useBean id="du" class="db.DbUtil3"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="main.css" type="text/css" rel="stylesheet">
    <title>Download</title>
  </head>
  
  <body>
  <%
String exportToWord = request.getParameter("exportToWord");
if (exportToWord != null
        && exportToWord.toString().equalsIgnoreCase("YES")) {
    response.setContentType("application/vnd.ms-word");
    response.setHeader("Content-Disposition", "inline; filename= word.doc");
      }
  int pageSize = 999;
  int currentPage = 1;
  String param = request.getParameter("currentPage");
  if(param!=null&&!"".equals(param)){
  		currentPage = Integer.parseInt(param);
  		if(currentPage==0)
  		   currentPage = 1;
  }
  String table=request.getParameter("table");
  List<String[]> list = du.getPageData(table,pageSize, currentPage);
   %>
	<table class="listtable">
            <tr>
                <th width="46" scope="col">操作内容——删除</th>
            </tr>
            <%for(String[] temp : list){ %>
            <tr> 
                <td>
                   	 用户admin删除了一条品名为<%=temp[1] %>的记录
                </td>
            </tr>
            <%} %>
        </table>
 </body>
</html>
