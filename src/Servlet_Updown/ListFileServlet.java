package Servlet_Updown;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
* @ClassName: ListFileServlet
* @Description: �г�Webϵͳ�����������ļ�
* @author: �°�����
* @date: 2015-1-4 ����9:54:40
*
*/ 

public class ListFileServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ListFileServlet() {
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
		//��ȡ�ϴ��ļ���Ŀ¼
		String power =request.getParameter("power");
		String uploadFilePath = this.getServletContext().getRealPath("/WEB-INF/upload");
		
		//�洢Ҫ���ص��ļ���
		Map<String,String> fileNameMap = new HashMap<String,String>();
		//�ݹ����filepathĿ¼�µ������ļ���Ŀ¼�����ļ����ļ����洢��map������
		listfile(new File(uploadFilePath),fileNameMap);//File�ȿ��Դ���һ���ļ�Ҳ���Դ���һ��Ŀ¼
		//��Map���Ϸ��͵�listfile.jspҳ�������ʾ
		request.setAttribute("fileNameMap", fileNameMap);
		System.out.println("power="+power);
		request.getRequestDispatcher("../listfile.jsp?power="+power).forward(request, response);
	
	}
	public void listfile(File file,Map<String,String> map){
		//���file����Ĳ���һ���ļ�������һ��Ŀ¼
		if(!file.isFile()){
		//�г���Ŀ¼�µ������ļ���Ŀ¼
		File files[] = file.listFiles();
		//����files[]����
		for(File f : files){
		//�ݹ�
		listfile(f,map);
		}
		}else{
		/**
		* �����ļ������ϴ�����ļ�����uuid_�ļ�������ʽȥ���������ģ�ȥ���ļ�����uuid_����
		file.getName().indexOf("_")�����ַ����е�һ�γ���"_"�ַ���λ�ã�����ļ��������ڣ�9349249849-88343-8344_��_��_��.avi
		��ôfile.getName().substring(file.getName().indexOf("_")+1)����֮��Ϳ��Եõ���_��_��.avi����
		*/
		String realName = file.getName().substring(file.getName().indexOf("_")+1);
		//file.getName()�õ������ļ���ԭʼ���ƣ����������Ψһ�ģ���˿�����Ϊkey��realName�Ǵ����������ƣ��п��ܻ��ظ�
		map.put(file.getName(), realName);
		}
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
