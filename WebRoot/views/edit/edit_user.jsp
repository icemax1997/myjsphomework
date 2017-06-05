<%@ page import="index.Index_user"%>
<%@ page import="mark.MarkInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>
<jsp:useBean id="du" class="db.DbUtil_index"/>
<%@ page language="java" import="db.login" %>
<jsp:useBean id="index" class="index.IndexUser" scope="page"/>
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
  <%	
        String username=request.getParameter("username");
        String sqlTxt="select * from users where username='"+username+"'";  
        ArrayList<Index_user> almark=index.getIndex(sqlTxt);
        Index_user markInfo=almark.get(0);
   %>
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
<form name="a" method="post" action="servlet/EditUsers">
  账号:<input type="text" name="username" class="barinput2" value=${loginusername}><br><br>
   新的密码:<input type="text" name="password" class="barinput2"><br><br>
 <input type="submit" value="提交" class="barinput3"><br><br>
</form>
  </body>
</html>
