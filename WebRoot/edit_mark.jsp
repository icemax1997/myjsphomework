<%@ page import="mark.MarkInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page language="java" import="student.*" %>

<jsp:useBean id="du" class="db.DbUtil"/>
<%@ page language="java" import="db.login" %>
<%@ page import="util.*" %>
<jsp:useBean id="stu" class="student.StudentLogic1" scope="page"/>
<jsp:useBean id="smark" class="mark.MarkLogic" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	
   <link href="mycss/main.css" type="text/css" rel="stylesheet">
   	<link href="mycss/bar.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="sweetalert.css">
  </head>
<%
    String power=request.getParameter("power");
   %>   
  <%
  		String table=request.getParameter("table");
        String id=request.getParameter("id");
        String sqlTxt="select * from "+table+" where id='"+id+"'";  
        ArrayList<MarkInfo> almark=smark.getMarkInfo(sqlTxt);
        MarkInfo markInfo=almark.get(0);
   %>
  <body>
  <div id="header">
        <div class="header-content">
            <div>信工农贸网——信息管理系统</div>
            <p>欢迎您 高级管理员root用户</p>
            <p>修改密码 退出登录</p>
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
<form name="a" method="post" action="servlet/EditMark?id=<%=markInfo.getId()%>">

     品名:<input type="text" name="sname" class="barinput2" value=<%=markInfo.getSname()%>><br><br>
     报价时间:<input type="text" name="stime" class="barinput2" value=<%=markInfo.getStime() %>><br><br>
     采集地点:<input type="text" name="slocal" class="barinput2" value=<%=markInfo.getSlocal() %>><br><br>
     最高价（元/公斤）:<input type="text" name="maxprice" class="barinput2" value=<%=markInfo.getMaxprice()%>><br><br>
     最低价（元/公斤）:<input type="text" name="minprice" class="barinput2" value=<%=markInfo.getMinprice() %>><br><br>
     批发价（元/公斤）:<input type="text" name="sprice" class="barinput2" value=<%=markInfo.getSprice() %>><br><br> 
     <input type="submit" value="提交" class="barinput3"><br><br>
  <input type="text" name="table" class="barinput" value=<%=table%> style="display:none"><br><br>
  </form>
	

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
