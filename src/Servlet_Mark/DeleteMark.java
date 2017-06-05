package Servlet_Mark;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mark.MarkLogic;
public class DeleteMark extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public DeleteMark() {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	    HttpSession session=request.getSession();//返回与当前request相关联的session，如果没有则在服务器端创建一个;
	    String username =(String)session.getAttribute("loginusername");
		String table=request.getParameter("table");
		String id=request.getParameter("id");
		int flag=0,flag2=0;
		MarkLogic markLogic=new MarkLogic();
		try{
			flag=markLogic.deletMarkInfo(id);
			flag2=markLogic.editMarkInfo2(table, id, username);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		if(flag!=0&flag2!=0)
			response.sendRedirect("../views/main/mark.jsp?table="+table);
		else
			response.sendRedirect("../views/main/error.html");
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
