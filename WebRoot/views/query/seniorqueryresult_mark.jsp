<%@page import="mark.MarkInfo"%>
<jsp:useBean id="smark" class="mark.MarkLogic" scope="page"/>
<jsp:useBean id="du" class="db.DbUtil"/>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="mycss/main.css" type="text/css" rel="stylesheet">
   	<link href="mycss/bar.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="sweetalert.css">
	<script type="text/javascript" src="js/jquery.js"></script>
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
    <title>��ѯ���</title>
  </head>
  <body>
     <div id="header">
        <div class="header-content">
            <div>�Ź�ũó��������Ϣ����ϵͳ</div>
             <p>��ӭ�� �߼�����Ա${loginusername}�û�</p>
            <a href="views/edit/edit_user.jsp?username=${loginusername}&power=${param.power}" class="out">�޸�����</a>
            <a href="servlet/Exit" class="out">�˳���¼</a>
        </div>
    </div>
          <div class="content">
          		<div class="nav">
            <ul id="nav-list">
                <li>
                    <a href="" class="nav-list-navigation">ϵͳ��ҳ</a>
                <ul>
                    <a href="views/main/index.jsp?table=shuiguoshucai&power=${param.power}">��ҳ</li>
          		</ul>
        		</li>
        		<li>
           		<a href="" class="nav-list-navigation">�ɹ�����</a>
                        <ul>
                            <li><a href="views/main/mark.jsp?table=mark&power=${param.power}">�г��������</a></li>
                            <li><a href="views/main/show_studentinfo.jsp?table=pinzhongguanli&power=${param.power}">Ʒ�ֹ���</a></li>
                            <li><a href="views/main/show_studentinfo.jsp?table=diquguanli&power=${param.power}">��������</a></li>
                            <li><a href="views/main/show_studentinfo.jsp?table=shijianguanli&power=${param.power}">ʱ�����</a></li>
                        </ul>
                </li>
                <li>
                    <a href="" class="nav-list-navigation">��Ӧ����</a>
                    <ul>
                        <li><a href="views/main/show_studentinfo.jsp?table=shuiguoshucai&power=${param.power}">ˮ���߲�</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=xumushuichan&power=${param.power}">����ˮ��</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=liangyoumimian&power=${param.power}">��������</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=nongfujiagong&power=${param.power}">ũ��ӹ�</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=miaomuhuacao&power=${param.power}">��ľ����</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=nongzinongji&power=${param.power}">ũ��ũ��</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=zhongyaocai&power=${param.power}">��ҩ��</a></li>
                    </ul>
                </li>
                <li id="yourpower">
                    <a href="" class="nav-list-navigation">��־����</a>
                    <ul>
                        <li><a href="views/record/record_ins.jsp?table=mark_ins&power=${param.power}">������־</a></li>
                        <li><a href="views/record/record_del.jsp?table=mark_del&power=${param.power}">ɾ����־</a></li>
                        <li><a href="views/record/record_up.jsp?table=mark_up&power=${param.power}">������־</a></li>
                        
                    </ul>
                </li>
               <li id="yourpower">
                    <a href="" class="nav-list-navigation">�û�����</a>
                    <ul>
                        <li><a href="views/main/users.jsp?table=users&power=${param.power}">Ȩ������</a></li>
                        <li><a href="servlet/ListFileServlet">�����ļ�</a></li>
                        <li><a href="upload.jsp">�ϴ��ļ�</a></li>
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
                <th width="94" scope="col">����</th>
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
          <td><a href="views/edit/edit_mark.jsp?id=<%=markInfo.getId() %>&table=${param.table}">�޸�</a>
           <a href="servlet/DeleteMark?id=<%=markInfo.getId()%>&table=${param.table}">ɾ��</a></td>  
        </tr>
        <%
        }
         %>
  </table>
   	<div class="page">
        <div class="myreach">
           <a href="views/main/mark.jsp?table=${param.table}" id="fl-r">����</a>
          </div>
          <div class="decoration">��ѯ���</div>
        </div>
  </div>
</div>
  </body>
</html>
