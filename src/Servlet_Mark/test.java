package Servlet_Mark;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mark.MarkLogic;

public class test extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public test() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public String convertCharSet(String oldString) 
	        throws UnsupportedEncodingException{
		String newString="";
		byte[] b=oldString.getBytes("ISO-8859-1");		
		newString=new String(b,"gbk");
		return newString;
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();//返回与当前request相关联的session，如果没有则在服务器端创建一个;
	    String username =(String)session.getAttribute("loginusername");
		String table=request.getParameter("table");
		String id=request.getParameter("id");
		String sname=request.getParameter("sname");
		sname=this.convertCharSet(sname);
		String stime=request.getParameter("stime");
		String slocal=request.getParameter("slocal");
		slocal=this.convertCharSet(slocal);
		String maxprice=request.getParameter("maxprice");
		maxprice=this.convertCharSet(maxprice);
		String minprice=request.getParameter("minprice");
		minprice=this.convertCharSet(minprice);
		String sprice=request.getParameter("sprice");
		sprice=this.convertCharSet(sprice);
		MarkLogic markLogic=new MarkLogic();
		String sqlTxt="insert into "+table+" (sname,stime,slocal,maxprice,minprice,sprice) values("
		    +"'"+sname+"',"
		    +"'"+stime+"',"
		    +"'"+slocal+"',"
		    +"'"+maxprice+"',"
		    +"'"+minprice+"',"
		    +"'"+sprice+"')";
		int flag=0,flag2=0;
		try{
			flag=markLogic.addMarkInfo(sqlTxt);
			flag2=markLogic.editMarkInfo3(table, id, username,sname);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		if(flag!=0&&flag2!=0)
			
			response.sendRedirect("../mark.jsp?table="+table);
		else
			response.sendRedirect("../error.html");
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
