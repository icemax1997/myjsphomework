
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="du" class="db.DbUtil3"/>
 <%   response.setHeader("Content-disposition","attachment; filename=Excel.xls");
    //���������趨���͵�ǰ�������ʱ�ĵ���Ϊtest.xls
    %>  
  <%
  String table=request.getParameter("table");
   %>
<jsp:useBean id="stu" class="student.StudentLogic1" scope="page"/>
<%@ page language="java" import="student.*" %>
<%@ page language="java" import="db.login" %>
<%@ page import="util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <link href="../main.css" type="text/css" rel="stylesheet">
    <base href="<%=basePath%>">
    
    <title>Download</title>

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

                <th width="46" scope="col">�������ݡ�������</th>
                
            </tr>
            <%for(String[] temp : list){ %>
            <tr>
                
                <td>
                   	 �û�admin������һ��Ʒ��Ϊ<%=temp[1] %>�ļ�¼
                </td>
                
            </tr>
            <%} %>
        </table>
 </body>
</html>
