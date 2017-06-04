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
	// ·������
	require.config({
		paths : {
			echarts : 'http://echarts.baidu.com/build/dist'
		}
	});
	// ʹ��
	require([ 'echarts', 'echarts/chart/bar' // ʹ����״ͼ�ͼ���barģ�飬�������
	], 
	drewEcharts
);
			function drewEcharts(ec) {
				// ����׼���õ�dom����ʼ��echartsͼ��
				var myChart = ec.init(document.getElementById('main'));
		
				var option = {
				 	title: {
                		text: '�Ź�ũó����һ���ȿ챨'
           			 },
					tooltip : {
						show : true
					},
					legend : {
						data : [ '����' ]
					},
					xAxis : [ {
						type : 'category',
						data :(function(){
		                                    var arr=[];
		                                        $.ajax({
		                                        type : "post",
		                                        async : false, //ͬ��ִ��
		                                        url : "bar.do",
		                                        data : {},
		                                        dataType : "json", //����������ʽΪjson
		                                        success : function(result) {
		                                        if (result) {
		                                               for(var i=0;i<result.length;i++){
		                                                  console.log(result[i].name);
		                                                  arr.push(result[i].name);
		                                                }    
		                                        }
		                                        
		                                    },
		                                    error : function(errorMsg) {
		                                        alert("������˼��ͼ����������ʧ����!");
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
						"name" : "����",
						"type" : "bar",
						"data" : (function(){
		                                        var arr=[];
		                                        $.ajax({
		                                        type : "post",
		                                        async : false, //ͬ��ִ��
		                                        url : "bar.do",
		                                        data : {},
		                                        dataType : "json", //����������ʽΪjson
		                                        success : function(result) {
		                                        if (result) {
		                                               for(var i=0;i<result.length;i++){
		                                                  console.log(result[i].num);
		                                                  arr.push(result[i].num);
		                                                }  
		                                        }
		                                    },
		                                    error : function(errorMsg) {
		                                        alert("������˼����ү��ͼ����������ʧ����!");
		                                        myChart.hideLoading();
		                                    }
		                                   })
		                                  return arr;
		                            })()
		                            
					} ]
				};
		
				// Ϊecharts����������� 
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
    <title>��Ϣ����ϵͳ</title>
    
  </head>
  
  <body>
   <div id="header">
        <div class="header-content">
            <div>�Ź�ũó���D�D��Ϣ����ϵͳ</div>
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
          <div class="console"><img src="images/indexhead.jpg" alt="��ӭ���.jpg"></div>
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
		
		                <th width="100" scope="col">���</th>
		                <th width="100" scope="col">����</th>
		                <th width="100" scope="col">����</th>
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
		                    <a href="edit_index.jsp?id=<%=temp[2]%>&table=<%=table %>">�޸�</a>
		                </td>
		            </tr>
		            <%} %>
        	</table>
				</div>
                </div>
          

<a class="mya" href="servlet/ListFileServlet">�����ļ�</a>
            <a class="mya"  href="upload.jsp">�ϴ��ļ�</a>
  </div>
</div>

  </body>
  
</html>
