<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="student.*" %>
<jsp:useBean id="du" class="db.DbUtil"/>
<%@ page language="java" import="db.login" %>
<%@ page import="util.*" %>
<jsp:useBean id="stu" class="student.StudentLogic1" scope="page"/>
<%
	String power=request.getParameter("power");
  	String table=request.getParameter("table");
  	String username=(String)session.getAttribute("loginusername");
   %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <link href="mycss/main.css" type="text/css" rel="stylesheet">
   	<link href="mycss/bar.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="sweetalert.css">
    <title>��Ϣ����ϵͳ</title>
  </head>
  <%	
        String id=request.getParameter("id");
        String sqlTxt="select * from "+table+" where id='"+id+"'";  
        ArrayList<StudentInfo> alStu=stu.getStudentInfo(sqlTxt);
        StudentInfo stuInfo=alStu.get(0);
        
   %>
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
             <form name="a" method="post" action="servlet/EditStudentInfo?id=<%=stuInfo.getId()%>">
   ��Ʒ��:<input type="text" name="sname" class="barinput2" value=<%=stuInfo.getSname() %>><br><br>
   �۸�:<input type="text" name="sprice"  class="barinput2"value=<%=stuInfo.getSprice() %>><br><br>
    ʣ������:<input type="text" name="snumber" class="barinput2" value=<%=stuInfo.getSnumber()%>><br><br>
     <input type="submit" value="�ύ" class="barinput3"><br><br>
  <input type="text" name="table" class="fl-n" value=<%=table%> style="display:none"><br><br>
  </form>
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
