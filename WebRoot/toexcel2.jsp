
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="student.*" %>
<jsp:useBean id="du2" class="db.DbUtil2"/>
<%@ page language="java" import="db.login" %>
<%@ page import="util.*" %>
<jsp:useBean id="stu" class="student.StudentLogic1" scope="page"/>

 <%   response.setHeader("Content-disposition","attachment; filename=Excel.xls");
    //以上这行设定传送到前端浏览器时的档名为test.xls
    %>  
  <%
  String table=request.getParameter("table");
   %>
<%@ page language="java" import="student.*" %>
<%@ page language="java" import="db.login" %>
<%@ page import="util.*" %>
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
  
  List<String[]> list = du2.getPageData(table,pageSize, currentPage);
   %>


	<table class="listtable">
             <tr>
                <th width="46" scope="col">ID</th>
                <th width="67" scope="col">品名</th>
                <th width="82" scope="col">报价时间</th>  
                <th width="82" scope="col">采集点</th>  
                <th width="82" scope="col">最高价（元/公斤）</th>  
                <th width="82" scope="col">最低价（元/公斤）</th>  
                <th width="82" scope="col">批发价（元/公斤）</th>  
                
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
                <td>
                    <%=temp[4] %>
                </td>
                <td>
                    <%=temp[5] %>
                </td>
                <td>
                    <%=temp[6] %>
                </td>
                
            </tr>
            <%} %>
        </table>
 </body>
</html>
