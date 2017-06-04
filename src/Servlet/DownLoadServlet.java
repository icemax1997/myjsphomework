package Servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownLoadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DownLoadServlet() {
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
		//�õ�Ҫ���ص��ļ���
		String fileName = request.getParameter("filename"); //23239283-92489-������.avi
		fileName = new String(fileName.getBytes("iso8859-1"),"UTF-8");
		System.out.println(fileName);
		//�ϴ����ļ����Ǳ�����/WEB-INF/uploadĿ¼�µ���Ŀ¼����
		String fileSaveRootPath=this.getServletContext().getRealPath("/WEB-INF/upload");
		//ͨ���ļ����ҳ��ļ�������Ŀ¼
		
		//�õ�Ҫ���ص��ļ�
		File file = new File(fileSaveRootPath + "\\" + fileName);
		System.out.println(file);
		//����ļ�������
		if(!file.exists()){
		request.setAttribute("message", "��Ҫ���ص���Դ�ѱ�ɾ������");
		request.getRequestDispatcher("/message.jsp").forward(request, response);
		return;
		}
		//�����ļ���
		String realname = fileName.substring(fileName.indexOf("_")+1);
		//������Ӧͷ��������������ظ��ļ�
		response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
		//��ȡҪ���ص��ļ������浽�ļ�������
		FileInputStream in = new FileInputStream(fileSaveRootPath + "\\" + fileName);
		//���������
		OutputStream out = response.getOutputStream();
		//����������
		byte buffer[] = new byte[1024];
		int len = 0;
		//ѭ�����������е����ݶ�ȡ������������
		while((len=in.read(buffer))>0){
		//��������������ݵ��������ʵ���ļ�����
		out.write(buffer, 0, len);
		}
		//�ر��ļ�������
		in.close();
		//�ر������
		out.close();
	
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
