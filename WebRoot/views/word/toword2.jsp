<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
<jsp:useBean id="du2" class="db.DbUtil2"/>
<%@ page language="java" import="db.login" %>
<jsp:useBean id="smark" class="mark.MarkLogic" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
        String exportToWord = request.getParameter("exportToWord");
        if (exportToWord != null
                && exportToWord.toString().equalsIgnoreCase("YES")) {
            response.setContentType("application/vnd.ms-word");
            response.setHeader("Content-Disposition", "inline; filename="
                    + "word.doc");
        }

		  int pageSize = 99;
		  int currentPage = 1;
		  String param = request.getParameter("currentPage");
		  if(param!=null&&!"".equals(param)){
		  		currentPage = Integer.parseInt(param);
		  		if(currentPage==0)
		  		   currentPage = 1;
		  }
		  String table=request.getParameter("table");
		  List<String[]> list = du2.getPageData(table,pageSize, currentPage);
	 %>
	<table class="listtable">
            <tr>
                <th width="46" scope="col">ID</th>
                <th width="67" scope="col">产品名</th>
                <th width="66" scope="col">价格</th>
                <th width="82" scope="col">剩余数量</th>  
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
