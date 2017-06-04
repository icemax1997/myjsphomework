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
            <div>信工农贸网——信息管理系统</div>
            <p>欢迎您 高级管理员<%=username %>用户</p>
            <a href="servlet/Exit" class="out">退出登录</a>
        </div>
    </div>
          <div class="content">
        <div class="nav">
            <ul id="nav-list">
                <li>
                    <a href="" class="nav-list-navigation">系统主页</a>
                    <ul>
                        <a href="index.jsp?table=shuiguoshucai&power=<%=power%>">主页</li>
          </ul>
        </li>

        <li>
            <a href="" class="nav-list-navigation">采购管理</a>
                        <ul>
                            <li><a href="mark.jsp?table=mark&power=<%=power%>">市场行情管理</a></li>
                            <li><a href="show_studentinfo.jsp?table=pinzhongguanli&power=<%=power%>">品种管理</a></li>
                            <li><a href="show_studentinfo.jsp?table=diquguanli&power=<%=power%>">地区管理</a></li>
                            <li><a href="show_studentinfo.jsp?table=shijianguanli&power=<%=power%>">时间管理</a></li>
                        </ul>
                </li>
                <li>
                    <a href="" class="nav-list-navigation">供应管理</a>
                    <ul>
                        <li><a href="show_studentinfo.jsp?table=shuiguoshucai&power=<%=power%>">水果蔬菜</a></li>
                        <li><a href="show_studentinfo.jsp?table=xumushuichan&power=<%=power%>">畜牧水产</a></li>
                        <li><a href="show_studentinfo.jsp?table=liangyoumimian&power=<%=power%>">粮油米面</a></li>
                        <li><a href="show_studentinfo.jsp?table=nongfujiagong&power=<%=power%>">农夫加工</a></li>
                        <li><a href="show_studentinfo.jsp?table=miaomuhuacao&power=<%=power%>">苗木花草</a></li>
                        <li><a href="show_studentinfo.jsp?table=nongzinongji&power=<%=power%>">农资农机</a></li>
                        <li><a href="show_studentinfo.jsp?table=zhongyaocai&power=<%=power%>">中药材</a></li>
                    </ul>
                </li>
                <li id="yourpower">
                    <a href="" class="nav-list-navigation">用户管理</a>
                    <ul>
                        <li><a href="record_ins.jsp?table=mark_ins&power=<%=power%>">插入日志</a></li>
                        <li><a href="record_del.jsp?table=mark_del&power=<%=power%>">删除日志</a></li>
                        <li><a href="record_up.jsp?table=mark_up&power=<%=power%>">更新日志</a></li>
                        <li><a href="users.jsp?table=users&power=<%=power%>">权限设置</a></li>
                    </ul>
                </li>
                </ul>
        </div>
  <div class="listcontent">
   <div class="bar">
   <div id="panel">
	  <FORM action=servlet/AddStudentInfo Method="post" class="queryloginform">
	  <div id="content">
	  <div><input type="text" name="sname" class="queryinput" placeholder="请输入产品名"></div>
	  <div><input type="text" name="sprice" placeholder="请输入价格"></div>
	  <div><input type="text" name="snumber" placeholder="请输入剩余数量"></div>
	  <div><input type="text" name="table" value=<%=table%> ></div>
	  <div> <input type="submit" value="提交" id="querysubmit" style="color: #fff;"></div>
      </div>
  		</form>  
   </div>
      <div id="panel2">
	  <FORM action=seniorqueryresult.jsp Method="post" class="queryloginform">
	  <div id="content">
	  <div><input type="text" name="sname" class="queryinput" placeholder="请输入产品名"></div>
	  <div><input type="text" name="sprice" placeholder="请输入价格"></div>
	  <div><input type="text" name="snumber" placeholder="请输入剩余数量"></div>
	  <div><input type="text" name="table" value=<%=table%> ></div>
	  <div> <input type="submit" value="搜索" id="querysubmit" style="color: #fff;"></div>
      </div>
  		</form>  
   </div>
			        <div class="bar-left">
			            <form name="form1" method="post" action="queryresult.jsp">
			                <div>
			                    <input type="text" placeholder="输入信息" name="sname" class="barinput">
			                    <input type="submit" name="Submit" value="模糊搜索" class="barrsearch"> 
			                    <input type="text" name="table" value=<%=table %> class="barhide">
			                </div>
			            </form>
			        </div>
                   <form method="post" action="servlet/PatchDeleteStudentInfo?table=<%=table %>">
                    <div class="bar-right">
		            <div class="baras">
		                   <input type="submit" name="button1" value="批量删除 " class="barpatchdelete">
			                <a href="toexcel.jsp?table=<%=table %>">导出为Excel</a>
			                <a href="toword.jsp?exportToWord=YES&table=<%=table %>">导出为Word</a>
			                <div id="flip">添加信息</div>
			                <div id="flip2">高级搜索</div>
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

                <th width="46" scope="col">选择</th>
                <th width="46" scope="col">ID</th>
                <th width="67" scope="col">
                <%
                	
                	if(table.equals("pinzhongguanli")){
                		out.print("采购品种");
                	}
                	else if(table.equals("diquguanli")){
                		out.print("采购地区");
                	}else if(table.equals("shijianguanli")){
                		out.print("采购时间");
                	}
                	else{
                	out.print("产品名称");
                	}
                	
                 %>
                </th>
                <th width="66" scope="col"> <%
                	if(table.equals("pinzhongguanli")||table.equals("shijianguanli")||table.equals("diquguanli")){
                	out.print("购入价格");
                	}else{
                	out.print("产品售价");
                	}
                	
                 %></th>
                <th width="82" scope="col">剩余数量</th>  
                <th width="94" scope="col">操作</th>
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
                
                <td><a href="edit_studentinfo.jsp?id=<%=temp[0]%>&table=<%=table%>&power=<%=power %>">修改</a>
                    <a href="servlet/DeleteStudentInfo?id=<%=temp[0]%>&table=<%=table%>&power=<%=power %>" >删除</a>
                </td>
            </tr>
            <%} %>
        </table>    
</form>
	<div class="page">
          <div class="myreach">
           <a href="show_studentinfo.jsp?currentPage=<%=currentPage+1 %>&table=<%=table %>&power=<%=power %>" id="fl-r">下一页</a>
              <a href="show_studentinfo.jsp?currentPage=<%=currentPage-1%>&table=<%=table %>&power=<%=power %>" id="fl-r">上一页</a>
             
          </div>
          <div class="decoration">每页有
          <%=pageSize %>条数据 当前是第<%=currentPage %>页</div>
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
