<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
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
  </head>
  <body>
  <div id="header">
        <div class="header-content">
            <div>信工农贸网——信息管理系统</div>
             <p>欢迎您 高级管理员${loginusername}用户</p>
            <a href="views/edit/edit_user.jsp?username=${loginusername}&power=${param.power}" class="out">修改密码</a>
            <a href="servlet/Exit" class="out">退出登录</a>
        </div>
    </div>
          <div class="content">
          		<div class="nav">
            <ul id="nav-list">
                <li>
                    <a href="" class="nav-list-navigation">系统主页</a>
                <ul>
                    <a href="views/main/index.jsp?table=shuiguoshucai&power=${param.power}">主页</li>
          		</ul>
        		</li>
        		<li>
           		<a href="" class="nav-list-navigation">采购管理</a>
                        <ul>
                            <li><a href="views/main/mark.jsp?table=mark&power=${param.power}">市场行情管理</a></li>
                            <li><a href="views/main/show_studentinfo.jsp?table=pinzhongguanli&power=${param.power}">品种管理</a></li>
                            <li><a href="views/main/show_studentinfo.jsp?table=diquguanli&power=${param.power}">地区管理</a></li>
                            <li><a href="views/main/show_studentinfo.jsp?table=shijianguanli&power=${param.power}">时间管理</a></li>
                        </ul>
                </li>
                <li>
                    <a href="" class="nav-list-navigation">供应管理</a>
                    <ul>
                        <li><a href="views/main/show_studentinfo.jsp?table=shuiguoshucai&power=${param.power}">水果蔬菜</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=xumushuichan&power=${param.power}">畜牧水产</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=liangyoumimian&power=${param.power}">粮油米面</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=nongfujiagong&power=${param.power}">农夫加工</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=miaomuhuacao&power=${param.power}">苗木花草</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=nongzinongji&power=${param.power}">农资农机</a></li>
                        <li><a href="views/main/show_studentinfo.jsp?table=zhongyaocai&power=${param.power}">中药材</a></li>
                    </ul>
                </li>
                <li id="yourpower">
                    <a href="" class="nav-list-navigation">日志管理</a>
                    <ul>
                        <li><a href="views/record/record_ins.jsp?table=mark_ins&power=${param.power}">插入日志</a></li>
                        <li><a href="views/record/record_del.jsp?table=mark_del&power=${param.power}">删除日志</a></li>
                        <li><a href="views/record/record_up.jsp?table=mark_up&power=${param.power}">更新日志</a></li>
                        
                    </ul>
                </li>
               <li id="yourpower">
                    <a href="" class="nav-list-navigation">用户管理</a>
                    <ul>
                        <li><a href="views/main/users.jsp?table=users&power=${param.power}">权限设置</a></li>
                        <li><a href="servlet/ListFileServlet">下载文件</a></li>
                        <li><a href="upload.jsp">上传文件</a></li>
                    </ul>
                </li>
                </ul>
        </div>
  <div class="listcontent">
  <table class="listtable">
  <tr>
                <th width="46" scope="col">ID</th>
                <th width="67" scope="col">产品名</th>
                <th width="66" scope="col">价格</th>
                <th width="82" scope="col">剩余数量</th>  
                <th width="94" scope="col">操作</th>
            </tr>
    <% 
    	String id=request.getParameter("id");
		byte[] b=request.getParameter("sname").getBytes("ISO-8859-1");		
		String sname=new String(b,"gbk");
		String sprice=request.getParameter("sprice");
		String snumber=request.getParameter("snumber");
		String table=request.getParameter("table");
        String sqlTxt="select * from "+table+" where sname like '%"+sname+"%'";
        ArrayList<StudentInfo> alStu=stu.getStudentInfo(sqlTxt);
        for(int i=0;i<alStu.size();i++){
        StudentInfo stuInfo=alStu.get(i);
        %><tr>
          <td><%=stuInfo.getId() %></td>
          <td><%=stuInfo.getSname()%></td>
          <td><%=stuInfo.getSprice() %></td>
          <td><%=stuInfo.getSnumber() %></td>
          <td><a href="views/edit/edit_studentinfo.jsp?id=<%=stuInfo.getId()%>&table=${param.table}">修改</a> <a href="servlet/DeleteStudentInfo?id=<%=stuInfo.getId()%>&table=${param.table}"">删除</a></td>  
        </tr>
        <%
        }
         %> 
  </table>
   	<div class="page">
          <div class="myreach">
           <a href="views/main/show_studentinfo.jsp?table=${param.table}" id="fl-r">返回</a> 
          </div>
          <div class="decoration">查询结果</div>
        </div>
  </div>
</div>
  </body>
</html>
