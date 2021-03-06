package db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import student.StudentInfo;
import student.*;
public class DbUtil_index {
	
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private String url = "jdbc:mysql://localhost:3306/computer";
	
	public DbUtil_index(){
		loadDriverClass();
		initDb();
		initStmt();
	}

	private void loadDriverClass() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void initDb() {
		try {
			conn = DriverManager.getConnection(url, "root", "mcrhenryh");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void initStmt(){
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ResultSet getRs(String sql){
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	
	public void execute(String sql){
		try {
			stmt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void close(){
		if(rs!=null)
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(stmt!=null)
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public List<String[]> getPageData(int pageSize, int page) {
		ResultSet rs = getRs("select  * from bar order by id limit "
								+(page-1)*pageSize+","+pageSize);
		List<String[]> list = new ArrayList<String[]>();
		
		try {
			while(rs.next()){
				String[] temp = new String[3];
				temp[0] = rs.getString("name");
				temp[1] = rs.getString("num");
				temp[2] =rs.getString("id");
				list.add(temp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}
