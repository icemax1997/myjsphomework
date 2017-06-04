<%@page import="org.apache.taglibs.standard.tag.common.xml.IfTag"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
<%@ page language="java" import="db.login" %>
<%@ page import="util.*" %>
<jsp:useBean id="du" class="db.DbUtil"/>
<jsp:useBean id="stu" class="student.StudentLogic1" scope="page"/>
<jsp:useBean id="smark" class="mark.MarkLogic" scope="page"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
  <%
  String table=request.getParameter("table");
   %>
   <%
  String power=request.getParameter("power");
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
   <div class="bar">
   <div id="panel">
	  <FORM action=servlet/AddStudentInfo Method="post" class="queryloginform">
	  <div id="content">
	  <div><input type="text" name="sname" class="queryinput" placeholder="�������Ʒ��"></div>
	  <div><input type="text" name="sprice" placeholder="������۸�"></div>
	  <div><input type="text" name="snumber" placeholder="������ʣ������"></div>
	  <div><input type="text" name="table" value=<%=table%> ></div>
	  <div> <input type="submit" value="�ύ" id="querysubmit" style="color: #fff;"></div>
      </div>
  		</form>  
   </div>
      <div id="panel2">
	  <FORM action=seniorqueryresult.jsp Method="post" class="queryloginform">
	  <div id="content">
	  <div><input type="text" name="sname" class="queryinput" placeholder="�������Ʒ��"></div>
	  <div><input type="text" name="sprice" placeholder="������۸�"></div>
	  <div><input type="text" name="snumber" placeholder="������ʣ������"></div>
	  <div><input type="text" name="table" value=<%=table%> ></div>
	  <div> <input type="submit" value="����" id="querysubmit" style="color: #fff;"></div>
      </div>
  		</form>  
   </div>
			        <div class="bar-left">
			            <form name="form1" method="post" action="queryresult.jsp">
			                <div>
			                    <input type="text" placeholder="������Ϣ" name="sname" class="barinput">
			                    <input type="submit" name="Submit" value="ģ������" class="barrsearch"> 
			                    <input type="text" name="table" value=<%=table %> class="barhide">
			                </div>
			            </form>
			        </div>
                   <form method="post" action="servlet/PatchDeleteStudentInfo?table=<%=table %>">
                    <div class="bar-right">
		            <div class="baras">
		                   <input type="submit" name="button1" value="����ɾ�� " class="barpatchdelete">
			                <a href="toexcel.jsp?table=<%=table %>">����ΪExcel</a>
			                <a href="toword.jsp?exportToWord=YES&table=<%=table %>">����ΪWord</a>
			                <div id="flip">�����Ϣ</div>
			                <div id="flip2">�߼�����</div>
		            </div>
		        </div>
              </div>
              
  
  <%
  
  int pageSize = 5;
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

                <th width="46" scope="col">ѡ��</th>
                <th width="46" scope="col">ID</th>
                <th width="67" scope="col">
                <%
                	
                	if(table.equals("pinzhongguanli")){
                		out.print("�ɹ�Ʒ��");
                	}
                	else if(table.equals("diquguanli")){
                		out.print("�ɹ�����");
                	}else if(table.equals("shijianguanli")){
                		out.print("�ɹ�ʱ��");
                	}
                	else{
                	out.print("��Ʒ����");
                	}
                	
                 %>
                </th>
                <th width="66" scope="col"> <%
                	if(table.equals("pinzhongguanli")||table.equals("shijianguanli")||table.equals("diquguanli")){
                	out.print("����۸�");
                	}else{
                	out.print("��Ʒ�ۼ�");
                	}
                	
                 %></th>
                <th width="82" scope="col">ʣ������</th>  
                <th width="94" scope="col">����</th>
            </tr>
            
            <%for(String[] temp : list){ %>
            <tr>
            	<td>
                   <input type="checkbox" value="<%=temp[0] %>" name="ch1">
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
                
                <td><a href="edit_studentinfo.jsp?id=<%=temp[0]%>&table=<%=table%>&power=<%=power %>">�޸�</a>
                    <a href="servlet/DeleteStudentInfo?id=<%=temp[0]%>&table=<%=table%>&power=<%=power %>" >ɾ��</a>
                </td>
            </tr>
            <%} %>
        </table>    
</form>
	<div class="page">
          <div class="myreach">
           <a href="show_studentinfo.jsp?currentPage=<%=currentPage+1 %>&table=<%=table %>&power=<%=power %>" id="fl-r">��һҳ</a>
              <a href="show_studentinfo.jsp?currentPage=<%=currentPage-1%>&table=<%=table %>&power=<%=power %>" id="fl-r">��һҳ</a>
             
          </div>
          <div class="decoration">ÿҳ��
          <%=pageSize %>������ ��ǰ�ǵ�<%=currentPage %>ҳ</div>
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
