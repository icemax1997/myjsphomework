<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>下载文件显示页面</title>
    <style media="screen">
		    body{
		  width: 100%;
		  height: 100%;
		  padding:0px;
		  margin:0px;
			}
			html{
			  width: 100%;
			  height: 100%;
			  padding:0px;
			  margin:0px;
			}
			
			.downheader{
			  width: 100%;
			  height: 40%;
			  text-align: center;
			  font-size: 3.5em;
			  font-weight: bold;
			  color: #fff;
			  background: orange;
			}
			.downheader div{
			  padding-top: 7%;
			}
			.downbody{
			  text-align: center;
			  font-size: 1.5em;
			  margin: 0.5em;
			}
		    .mya {
			    display: inline-block;
			    padding: 4px 12px;
			    margin-bottom: 0;
			    font-size: 14px;
			    line-height: 20px;
			    text-align: center;
			    vertical-align: middle;
			    cursor: pointer;
			    color: #333333;
			    text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
			    background-color: #f5f5f5;
			    border: 1px solid #cccccc;
			    border-bottom-color: #b3b3b3;
			    border-radius: 4px;
			    box-shadow: inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);
			    margin-right: 0.5em;
			    text-decoration: none;
			}
			a{	
					font-size: 0.8em;
				 text-decoration: none;
				 color:#009999;
			}
  </style>
  </head>
  
  <body>
  
 <div class="downheader"><div>请选择你需要下载的文件</div></div>
<div class="downbody">
		<c:forEach var="me" items="${fileNameMap}">
        <c:url value="/servlet/DownLoadServlet" var="downurl">
            <c:param name="filename" value="${me.key}"></c:param>
        </c:url>
        ${me.value}<a href="${downurl}" >下载</a>
        <br/>
    	</c:forEach> 
    </div>
    
    <center><button onClick="window.location.href='../views/main/index.jsp?power=${param.power}'" class="mya">返回主页</button> </center>
  </body>
</html>
