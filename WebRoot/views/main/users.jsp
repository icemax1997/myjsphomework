<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="du" class="db.DbUtil4"/>
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
    <script type="text/javascript">
        $(function() {
            (function($) {
                $.getUrlParam = function(name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return unescape(r[2]);
                    return null;
                }
            })(jQuery);
            var xx = $.getUrlParam('power');
            if (xx == "2") {
                $("#yourpower").hide();
            } else if (xx == "1") {
                $("#yourpower").show();
            }
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
                <div class="bar-left">
                    <form method="post" action="servlet/Userpowerchange">
                        <input type="submit" name="button1" value="ȷ�ϲ��ύ" class="mya">
                </div>
                <div class="bar-right">
                    <div class="myreach">
                        <a href="views/excel/toexcel3.jsp?table=${param.table}" id="fl-r">����ΪExcel</a>
                        <a href="views/word/toword3.jsp?exportToWord=YES&&table=${param.table}" id="fl-r">����ΪWord</a>
                    </div>
                </div>
            </div>
            <%
            int pageSize = 99;
            int currentPage = 1;
            String param = request.getParameter("currentPage");
            if(param!=null&&!"".equals(param)){
            		currentPage = Integer.parseInt(param);
            		if(currentPage==0)
            		   currentPage = 1;
            }
            String table=request.getParameter("table");
            List<String[]> list = du.getPageData(table,pageSize, currentPage);
             %>
                <input type="text" name="table" value=${param.table} style="display:none;">
                <table class="listtable">
                    <tr>
                        <th width="46" scope="col">ID</th>
                        <th width="46" scope="col">�û�����</th>
                        <th width="46" scope="col">�û���</th>
                        <th width="46" scope="col">����</th>
                    </tr>
                    <%for(String[] temp : list){ %>
                        <tr>
                            <td>
                                <%=temp[0] %>
                            </td>
                            <td>
                                <% if(temp[1].equals("1")){
                   	out.print("<input type=\"checkbox\" checked=\"true\"  name=\"ch1\" value=\" "+ temp[0] +"\">");
                   	}else{
                   	out.print("<input type=\"checkbox\"  name=\"ch1\" value=\" "+ temp[0] +"\">");
                   	}
                   	 %>
                            </td>
                            <td>
                                <%=temp[2] %>
                            </td>
                            <td>
                                <%=temp[3] %>
                            </td>
                        </tr>
                        <%} %>
                </table>
                </form>
        </div>
    </div>
</body>
</html>
