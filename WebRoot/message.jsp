<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>消息提示</title>
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
			  font-size: 1.2em;
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
			    margin-bottom:0.5em;
			}
			a{	
					font-size: 0.8em;
				 text-decoration: none;
				 color:#009999;
			}
  </style>
  </head>
  
  <body>
  <center>
   <div class="downheader"><div>:） 成功!</div></div>
     ${message}
     <br><br>
     <button onClick="window.location.href='../views/main/index.jsp?power=${param.power}'" class="mya">返回主页</button> 
  </center>
 
     </body>
</html>
