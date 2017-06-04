package Servlet_Student;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import student.StudentLogic1;
public class AddStudentInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddStudentInfo() {
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
		String table=request.getParameter("table");
		String sname=request.getParameter("sname");
		sname=this.convertCharSet(sname);
		String sprice=request.getParameter("sprice");
		sprice=this.convertCharSet(sprice);
		String snumber=request.getParameter("snumber");
		snumber=this.convertCharSet(snumber);
		
		StudentLogic1 stuLogic=new StudentLogic1();
		String sqlTxt="insert into "+table+
		"(sname,sprice,snumber) values("
		    +"'"+sname+"',"
		    +"'"+sprice+"',"
		    +"'"+snumber+"')"
		   ;
		int flag=0;
		System.out.println(sqlTxt);
		try{
			flag=stuLogic.addStudentInfo(sqlTxt);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		if(flag!=0)
			
			response.sendRedirect("../show_studentinfo.jsp?table="+table);
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
