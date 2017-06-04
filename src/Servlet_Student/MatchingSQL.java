package Servlet_Student;

import java.io.IOException;
import student.StudentLogic1;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MatchingSQL extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public MatchingSQL() {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String table=request.getParameter("table");
		String power=request.getParameter("power");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		HttpSession session=request.getSession();
        session.setAttribute("loginusername",username);
        session.setAttribute("loginpassword",password);
		StudentLogic1 stuLogic=new StudentLogic1();
		int flag=0;
		try{
			flag=stuLogic.Matching(username,password,power);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		if(flag!=0)
			response.sendRedirect("../index.jsp?power="+power);
			
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
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
