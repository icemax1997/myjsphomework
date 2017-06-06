<%@page import="javax.swing.text.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:useBean id="du" class="db.DbUtil_index"/>
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
	<script type="text/javascript" src="http://echarts.baidu.com/build/dist/echarts.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
    <title>信息管理系统</title>
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
            <div>信工农贸网――信息管理系统</div>
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
                        <li><a href="servlet/ListFileServlet?power=${param.power}">下载文件</a></li>
                        <li><a href="upload.jsp?power=${param.power}">上传文件</a></li>
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
		                    <a href="views/edit/edit_index.jsp?id=<%=temp[2]%>&table=${param.table}&power=${param.power}">修改</a>
		                </td>
		            </tr>
		            <%} %>
        	</table>            
				</div>
                </div>
			
  </div>
</div>
  </body>
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
</script>
</html>
