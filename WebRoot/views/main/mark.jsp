<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:useBean id="du2" class="db.DbUtil2"/>
<jsp:useBean id="smark" class="mark.MarkLogic" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>�г�����</title>
	<link href="mycss/main.css" type="text/css" rel="stylesheet">
   	<link href="mycss/bar.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="sweetalert.css">
	<link rel="stylesheet" type="text/css" href="mycss/query.css">
	<script src="js/jquery.js"></script>
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
        $("document").ready(function(){
		  $("#flip").click(function(){
		    if ($("#panel3").css("display")=="none") {
		      $("#panel3").slideDown("slow");
		    }else {
		        $("#panel3").slideUp("slow");
		    }
		
		  });
		  $("#flip2").click(function(){
		    if ($("#panel4").css("display")=="none") {
		      $("#panel4").slideDown("slow");
		    }else {
		        $("#panel4").slideUp("slow");
		    }
		
		  });
		});
	</script>
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
     <div class="bar">
   <div id="panel3">
      <FORM action=servlet/test Method="post" class="queryloginform">
      <div id="content2">
      <div><input type="text" name="sname" class="queryinput" placeholder="�������Ʒ��"></div>
      <div><input type="text" name="stime" placeholder="�����뱨��ʱ��"></div>
      <div><input type="text" name="slocal" placeholder="������ɼ���"></div>
      <div><input type="text" name="maxprice" placeholder="��߼ۣ�Ԫ/���"></div>
      <div><input type="text" name="minprice" placeholder="��ͼۣ�Ԫ/���"></div>
      <div><input type="text" name="sprice" placeholder="�����ۣ�Ԫ/���	"></div>
      <div><input type="text" name="table" value=${param.table}></div>
      <div> <input type="submit" value="�ύ" id="querysubmit" style="color: #fff;"></div>
        </div>
        </form>
    </div>
      <div id="panel4">
      <FORM action=views/query/seniorqueryresult_mark.jsp Method="post" class="queryloginform">
      <div id="content2">
      <div><input type="text" name="sname" class="queryinput" placeholder="�������Ʒ��"></div>
      <div><input type="text" name="stime" placeholder="�����뱨��ʱ��"></div>
        <div><input type="text" name="slocal" placeholder="������ɼ���"></div>
          <div><input type="text" name="maxprice" placeholder="��߼ۣ�Ԫ/���"></div>
      <div><input type="text" name="minprice" placeholder="��ͼۣ�Ԫ/���"></div>
              <div><input type="text" name="sprice" placeholder="�����ۣ�Ԫ/���	"></div>
      <div><input type="text" name="table" value=${param.table}></div>
      <div> <input type="submit" value="����" id="querysubmit" style="color: #fff;"></div>
        </div>
        </form>
    </div>
			        <div class="bar-left">
			            <form name="form1" method="post" action="views/query/queryresult_mark.jsp">
			                <div>
			                    <input type="text" placeholder="������Ϣ" name="sname" class="barinput">
			                    <input type="submit" name="Submit" value="ģ������" class="barrsearch"> 
			                    <input type="text" name="table" value="mark" class="barhide">
			                </div>
			            </form>
			        </div>
                   <form method="post" action="servlet/PatchDeleteStudentInfo?table=${param.table}">
                    <div class="bar-right">
		            <div class="baras">
		                   
			                <a href="views/excel/toexcel2.jsp?table=${param.table}">����ΪExcel</a>
			                <a href="views/word/toword2.jsp?exportToWord=YES&table=${param.table}">����ΪWord</a>
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
		  String table=request.getParameter("table");
		  List<String[]> list = du2.getPageData(table,pageSize, currentPage);
		   %>
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
                <td><a href="views/edit/edit_mark.jsp?id=<%=temp[0]%>&table=${param.table}">�޸�</a>
                    <a href="servlet/DeleteMark?id=<%=temp[0]%>&table=${param.table}">ɾ��</a>
                </td>
            </tr>
            <%} %>
        </table>
        </from>
	<div class="page">
          <div class="myreach">
           <a href="views/main/mark.jsp?currentPage=<%=currentPage+1 %>&table=${param.table}" id="fl-r">��һҳ</a>
              <a href="views/main/mark.jsp?currentPage=<%=currentPage-1%>&table=${param.table}" id="fl-r">��һҳ</a>
          </div>
          <div class="decoration">ÿҳ��
          <%=pageSize %>������ ��ǰ�ǵ�<%=currentPage %>ҳ</div>
        </div>
  </div>
</div>
  </body>
</html>
