package Servlet_index;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import index.IndexLogic;
import mark.MarkLogic;

public class EditIndex extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public EditIndex() {
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
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		name=this.convertCharSet(name);
		String num=request.getParameter("num");
		String table=request.getParameter("table");
		
		IndexLogic markLogic=new IndexLogic();
	
		int flag=0;
		try{
			flag=markLogic.editStudentInfo(id, num);
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		if(flag!=0)
			response.sendRedirect("../index.jsp?table="+table);
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
