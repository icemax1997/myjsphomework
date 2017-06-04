<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="student.*" %>
<jsp:useBean id="du" class="db.DbUtil_index"/>
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
	<script type="text/javascript" src="http://echarts.baidu.com/build/dist/echarts.js"></script>
		<script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript">
	// 路径配置
	require.config({
		paths : {
			echarts : 'http://echarts.baidu.com/build/dist'
		}
	});
	// 使用
	require([ 'echarts', 'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
	], 
	drewEcharts
);
			function drewEcharts(ec) {
				// 基于准备好的dom，初始化echarts图表
				var myChart = ec.init(document.getElementById('main'));
		
				var option = {
				 	title: {
                		text: '信工农贸网第一季度快报'
           			 },
					tooltip : {
						show : true
					},
					legend : {
						data : [ '销量' ]
					},
					xAxis : [ {
						type : 'category',
						data :(function(){
		                                    var arr=[];
		                                        $.ajax({
		                                        type : "post",
		                                        async : false, //同步执行
		                                        url : "bar.do",
		                                        data : {},
		                                        dataType : "json", //返回数据形式为json
		                                        success : function(result) {
		                                        if (result) {
		                                               for(var i=0;i<result.length;i++){
		                                                  console.log(result[i].name);
		                                                  arr.push(result[i].name);
		                                                }    
		                                        }
		                                        
		                                    },
		                                    error : function(errorMsg) {
		                                        alert("不好意思，图表请求数据失败啦!");
		                                        myChart.hideLoading();
		                                    }
		                                   })
		                                   return arr;
		                                })() 
					
					} ],
					yAxis : [ {
						type : 'value'
					} ],
					series : [ {
						"name" : "销量",
						"type" : "bar",
						"data" : (function(){
		                                        var arr=[];
		                                        $.ajax({
		                                        type : "post",
		                                        async : false, //同步执行
		                                        url : "bar.do",
		                                        data : {},
		                                        dataType : "json", //返回数据形式为json
		                                        success : function(result) {
		                                        if (result) {
		                                               for(var i=0;i<result.length;i++){
		                                                  console.log(result[i].num);
		                                                  arr.push(result[i].num);
		                                                }  
		                                        }
		                                    },
		                                    error : function(errorMsg) {
		                                        alert("不好意思，大爷，图表请求数据失败啦!");
		                                        myChart.hideLoading();
		                                    }
		                                   })
		                                  return arr;
		                            })()
		                            
					} ]
				};
		
				// 为echarts对象加载数据 
				myChart.setOption(option);
			}
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
    <title>信息管理系统</title>
    
  </head>
  
  <body>
   <div id="header">
        <div class="header-content">
            <div>信工农贸网――信息管理系统</div>
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
          <div class="console"><img src="images/indexhead.jpg" alt="欢迎横幅.jpg"></div>
                   <div class="personal">
      			      <div id="main" class="myecharts">myecharts</div>
                    <div class="myechartsconsole">
				 <%
  
				  int pageSize = 5;
				  int currentPage = 1;
				  String param = request.getParameter("currentPage");
				  if(param!=null&&!"".equals(param)){
				  		currentPage = Integer.parseInt(param);
				  		if(currentPage==0)
				  		   currentPage = 1;
				  }
				  
				  List<String[]> list = du.getPageData(pageSize, currentPage);
  				 %>
			<table class="listtable">
		            <tr>
		
		                <th width="100" scope="col">类别</th>
		                <th width="100" scope="col">销量</th>
		                <th width="100" scope="col">操作</th>
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
		                    <a href="edit_index.jsp?id=<%=temp[2]%>&table=<%=table %>">修改</a>
		                </td>
		            </tr>
		            <%} %>
        	</table>
				</div>
                </div>
          

<a class="mya" href="servlet/ListFileServlet">下载文件</a>
            <a class="mya"  href="upload.jsp">上传文件</a>
  </div>
</div>

  </body>
  
</html>
