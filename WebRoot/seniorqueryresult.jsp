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
                <th width="67" scope="col">��Ʒ��</th>
                <th width="66" scope="col">�۸�</th>
                <th width="82" scope="col">ʣ������</th>  
                <th width="94" scope="col">����</th>
            </tr>
    <% 
    	String id=request.getParameter("id");
		String presname=request.getParameter("sname");
		byte[] t=presname.getBytes("ISO-8859-1");		
		String sname=new String(t,"gbk");
		String sprice=request.getParameter("sprice");
		String snumber=request.getParameter("snumber");
		String table=request.getParameter("table");
		
    %>
    <% 
       String sqlTxt="select * from "+table+" where sname like '%"+sname+"%' or sprice like '% "
       +sprice+"%' or snumber like '% "
       +snumber +"%'";
       ArrayList<StudentInfo> alStu=stu.getStudentInfo(sqlTxt);
       for(int i=0;i<alStu.size();i++){
       StudentInfo stuInfo=alStu.get(i);
       
        %><tr>
          <td><%=stuInfo.getId() %></td>
          <td><%=stuInfo.getSname()%></td>
          <td><%=stuInfo.getSprice() %></td>
          <td><%=stuInfo.getSnumber() %></td>
          <td><a href="edit_studentinfo.jsp?id=<%=stuInfo.getId() %>&table=<%=table%>">�޸�</a>
           <a href="servlet/DeleteStudentInfo?id=<%=stuInfo.getId()%>&table=<%=table%>">ɾ��</a></td>  
        </tr>
        <%
        }
         %>
         
  </table>
   	<div class="page">
          <div class="myreach">
           <a href="show_studentinfo.jsp?table=<%=table%>" id="fl-r">����</a>
             
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
