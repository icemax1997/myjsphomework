<%@page import="java.sql.Statement"%>
<%@page import="org.apache.taglibs.standard.tag.common.xml.IfTag"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
<%@ page language="java" import="db.login" %>
<%@ page import="util.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="du" class="db.DbUtil3"/>
<jsp:useBean id="stu" class="student.StudentLogic1" scope="page"/>
<jsp:useBean id="smark" class="mark.MarkLogic" scope="page"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
  <%
  String table=request.getParameter("table");
         String username=(String)session.getAttribute("loginusername");
   %>
<html>
  <head>
        <link href="mycss/main.css" type="text/css" rel="stylesheet">
   	<link href="mycss/bar.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="sweetalert.css">
		<link rel="stylesheet" type="text/css" href="mycss/query.css">
    <script src="jquery.js">
		</script>
		<script>
		$(document).ready(function(){
		  $("#flip").click(function(){
		    if ($("#panel").css("display")=="none") {
		      $("#panel").slideDown("slow");
		    }else {
		        $("#panel").slideUp("slow");
		    }
		
		  });
		  $("#flip2").click(function(){
		    if ($("#panel2").css("display")=="none") {
		      $("#panel2").slideDown("slow");
		    }else {
		        $("#panel2").slideUp("slow");
		    }
		
		  });
		});
		</script>
    <style type="text/css">
		#panel,#panel2
		{
			display:none;
		}
	</style>
    <%
    String power=request.getParameter("power");
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
   
  <%
  
  int pageSize =5;
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
            	<th width="82" scope="col">�û�</th>
                <th width="82" scope="col">����ʱ��</th>
				<th width="82" scope="col">��ӦID</th>
                <th width="82" scope="col">Ʒ��</th>
                <th width="82" scope="col">����ʱ��</th>  
                <th width="82" scope="col">�ɼ���</th>  
                <th width="120" scope="col">��߼ۣ�Ԫ/���</th>  
                <th width="120" scope="col">��ͼۣ�Ԫ/���</th>  
                <th width="120" scope="col">�����ۣ�Ԫ/���</th>  
                
            </tr>
            <%for(String[] temp : list){ %>
            <tr>
           		<td>
                   	<%=temp[7] %>
                </td>
                <td>
                   	<%=temp[8] %>
                </td>
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

	<div class="page">
          <div class="myreach">
           <a href="record_ins.jsp?currentPage=<%=currentPage+1 %>&table=<%=table %>&power=<%=power %>" id="fl-r">��һҳ</a>
              <a href="record_ins.jsp?currentPage=<%=currentPage-1%>&table=<%=table %>&power=<%=power %>" id="fl-r">��һҳ</a>
             
          </div>
          <div class="decoration">ÿҳ��
          <%=pageSize %>������ ��ǰ�ǵ�<%=currentPage %>ҳ</div>
        </div>
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
