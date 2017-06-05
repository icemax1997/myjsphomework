<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
<jsp:useBean id="du" class="db.DbUtil"/>
<jsp:useBean id="stu" class="student.StudentLogic1" scope="page"/>
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
    <title>��Ϣ����ϵͳ</title>
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
	</head>
	<%	String table=request.getParameter("table");
	      String id=request.getParameter("id");
	      String sqlTxt="select * from "+table+" where id='"+id+"'";  
	      ArrayList<StudentInfo> alStu=stu.getStudentInfo(sqlTxt);
	      StudentInfo stuInfo=alStu.get(0);
	 %>
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
             <form name="a" method="post" action="servlet/EditStudentInfo?id=<%=stuInfo.getId()%>">
   ��Ʒ��:<input type="text" name="sname" class="barinput2" value=<%=stuInfo.getSname() %>><br><br>
   �۸�:<input type="text" name="sprice"  class="barinput2"value=<%=stuInfo.getSprice() %>><br><br>
    ʣ������:<input type="text" name="snumber" class="barinput2" value=<%=stuInfo.getSnumber()%>><br><br>
     <input type="submit" value="�ύ" class="barinput3"><br><br>
  <input type="text" name="table" class="fl-n" value=${param.table} style="display:none"><br><br>
  </form>
  </div>
</div>
  </body>
</html>
