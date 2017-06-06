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
    <title>��Ϣ����ϵͳ</title>
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
            <div>�Ź�ũó���D�D��Ϣ����ϵͳ</div>
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
                        <li><a href="servlet/ListFileServlet?power=${param.power}">�����ļ�</a></li>
                        <li><a href="upload.jsp?power=${param.power}">�ϴ��ļ�</a></li>
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
		                    <a href="views/edit/edit_index.jsp?id=<%=temp[2]%>&table=${param.table}&power=${param.power}">�޸�</a>
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
</script>
</html>
