<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setHeader("Content-disposition","attachment; filename=Excel.xls");//���������趨���͵�ǰ�������ʱ�ĵ���Ϊtest.xls
%>
<jsp:useBean id="du" class="db.DbUtil4"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link href="mycss/main.css" type="text/css" rel="stylesheet">
    <base href="<%=basePath%>"> 
    <title>Download</title>
  </head> 
  <body>
    <%
  int pageSize = 100;
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
                <th width="46" scope="col">ID</th>
                <th width="67" scope="col">�û�����</th>
                <th width="66" scope="col">�û���</th>
                <th width="82" scope="col">����</th>     
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
