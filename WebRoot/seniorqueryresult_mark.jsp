<%@page import="mark.MarkInfo"%>
<%@page import="mark.MarkLogic"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="student.*" %>
<%@ page language="java" import="db.login" %>
<%@ page import="util.*" %>
<jsp:useBean id="du" class="db.DbUtil"/>
<jsp:useBean id="stu" class="student.StudentLogic1" scope="page"/>
<jsp:useBean id="smark" class="mark.MarkLogic" scope="page"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
        <link href="mycss/main.css" type="text/css" rel="stylesheet">
   	<link href="mycss/bar.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="sweetalert.css">
    <title>��ѯ���</title>
    
<%
  String power=request.getParameter("power");
  String username=(String)session.getAttribute("loginusername");
   %>
  </head>
  
  <body>
     <div id="header">
        <div class="header-content">
            <div>�Ź�ũó��������Ϣ����ϵͳ</div>
            <p>��ӭ�� �߼�����Ա<%=username %>�û�</p>
            <a href="servlet/Exit" class="out">�˳���¼</a>
        </div>
    </div>
          <div class="content">
        <div class="nav">
            <ul id="nav-list">
                <li>
                    <a href="" class="nav-list-navigation">ϵͳ��ҳ</a>
                    <ul>
                        <a href="index.jsp?table=shuiguoshucai&power=<%=power%>">��ҳ</li>
          </ul>
        </li>

        <li>
            <a href="" class="nav-list-navigation">�ɹ�����</a>
                        <ul>
                            <li><a href="mark.jsp?table=mark&power=<%=power%>">�г��������</a></li>
                            <li><a href="show_studentinfo.jsp?table=pinzhongguanli&power=<%=power%>">Ʒ�ֹ���</a></li>
                            <li><a href="show_studentinfo.jsp?table=diquguanli&power=<%=power%>">��������</a></li>
                            <li><a href="show_studentinfo.jsp?table=shijianguanli&power=<%=power%>">ʱ�����</a></li>
                        </ul>
                </li>
                <li>
                    <a href="" class="nav-list-navigation">��Ӧ����</a>
                    <ul>
                        <li><a href="show_studentinfo.jsp?table=shuiguoshucai&power=<%=power%>">ˮ���߲�</a></li>
                        <li><a href="show_studentinfo.jsp?table=xumushuichan&power=<%=power%>">����ˮ��</a></li>
                        <li><a href="show_studentinfo.jsp?table=liangyoumimian&power=<%=power%>">��������</a></li>
                        <li><a href="show_studentinfo.jsp?table=nongfujiagong&power=<%=power%>">ũ��ӹ�</a></li>
                        <li><a href="show_studentinfo.jsp?table=miaomuhuacao&power=<%=power%>">��ľ����</a></li>
                        <li><a href="show_studentinfo.jsp?table=nongzinongji&power=<%=power%>">ũ��ũ��</a></li>
                        <li><a href="show_studentinfo.jsp?table=zhongyaocai&power=<%=power%>">��ҩ��</a></li>
                    </ul>
                </li>
                <li id="yourpower">
                    <a href="" class="nav-list-navigation">�û�����</a>
                    <ul>
                        <li><a href="record_ins.jsp?table=mark_ins&power=<%=power%>">������־</a></li>
                        <li><a href="record_del.jsp?table=mark_del&power=<%=power%>">ɾ����־</a></li>
                        <li><a href="record_up.jsp?table=mark_up&power=<%=power%>">������־</a></li>
                        <li><a href="users.jsp?table=users&power=<%=power%>">Ȩ������</a></li>
                    </ul>
                </li>
                </ul>
        </div>
  <div class="listcontent">
  <table class="listtable">
  			<tr>
                 <th width="46" scope="col">ID</th>
                <th width="67" scope="col">Ʒ��</th>
                <th width="82" scope="col">����ʱ��</th>  
                <th width="82" scope="col">�ɼ���</th>  
                <th width="82" scope="col">��߼ۣ�Ԫ/���</th>  
                <th width="82" scope="col">��ͼۣ�Ԫ/���</th>  
                <th width="82" scope="col">�����ۣ�Ԫ/���</th>  
            </tr>
    <% 
    	
    	String table=request.getParameter("table");
    	String id=request.getParameter("id");
		String stime=request.getParameter("stime");
		String presname=request.getParameter("sname");
		byte[] t=presname.getBytes("ISO-8859-1");		
		String sname=new String(t,"gbk");
		String preslocal=request.getParameter("slocal");
		byte[] t2=preslocal.getBytes("ISO-8859-1");		
		String slocal=new String(t2,"gbk");
		String maxprice=request.getParameter("maxprice");
		String minprice=request.getParameter("minprice");
		String sprice=request.getParameter("sprice");
		
    %>
    <% 
       String sqlTxt="select * from "+table+" where sname like '%"
       +sname+"%' or stime like '% "
       +stime+"%' or slocal like '% "
       +slocal+"%' or maxprice like '% "
       +maxprice+"%' or minprice like '% "
       +minprice+"%' or sprice like '% "
       +sprice+"%'";
       ArrayList<MarkInfo> almark=smark.getMarkInfo(sqlTxt);
       for(int i=0;i<almark.size();i++){
       MarkInfo markInfo=almark.get(i);
       
        %><tr>
          <td><%=markInfo.getId() %></td>
          <td><%=markInfo.getSname()%></td>
          <td><%=markInfo.getStime() %></td>
          <td><%=markInfo.getSlocal() %></td>
          <td><%=markInfo.getMaxprice()%></td>
          <td><%=markInfo.getMinprice() %></td>
          <td><%=markInfo.getSprice() %></td>
          <td><a href="edit_mark.jsp?id=<%=markInfo.getId() %>&table=<%=table%>">�޸�</a>
           <a href="servlet/DeleteMark?id=<%=markInfo.getId()%>&table=<%=table%>">ɾ��</a></td>  
        </tr>
        <%
        }
         %>
         
  </table>
   	<div class="page">
          <div class="myreach">
           <a href="mark.jsp?table=<%=table%>" id="fl-r">����</a>
             
          </div>
          <div class="decoration">��ѯ���</div>
        </div>
  </div>
</div>
    
	<script type="text/javascript" src="jquery.js"></script>
 	<script  type="text/javascript">   	
     $(function () {

            (function ($) {
                $.getUrlParam = function (name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return unescape(r[2]); return null;
                }
            })(jQuery);

             var xx = $.getUrlParam('power');
            if(xx=="2"){
            		$("#yourpower").hide();    		
            }else if(xx=="1"){
            	$("#yourpower").show();
            }
            	
            
            
        });
     	
    </script>
  </body>
</html>
