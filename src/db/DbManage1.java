package db;
import java.sql.Connection;
import java.sql.SQLException;
import com.mysql.jdbc.Statement;

import java.sql.DriverManager;
import java.sql.ResultSet;

public class DbManage1 {
     private Connection conn;
     public int excuteSql(String sqlTxt) throws SQLException{
    	 String driver= "com.mysql.jdbc.Driver";
 		String url="jdbc:mysql://localhost:3306/computer";
 		Statement stmt=null;
 		int flag=0;
 		try{
 			Class.forName(driver);
 			this.conn=DriverManager.getConnection(url,"root","mcrhenryh");
 			stmt=(Statement) this.conn.createStatement();
 			flag=stmt.executeUpdate(sqlTxt);
 		}
 		catch(ClassNotFoundException e){
 			e.printStackTrace();
 		}
 		catch(SQLException e){
 		e.printStackTrace();
 		}
 		finally{
 			this.closeConnection();
 		}
 		
 		return flag;
 	}
    
     
 	public void closeConnection(){
 		try{
 			this.conn.close();
 		}
 		catch( SQLException e) {
 			e.printStackTrace();
 		}
 		this.conn=null;
 	}


	public int executeQuery(String sqlTxt) throws SQLException{
    	 String driver= "com.mysql.jdbc.Driver";
 		String url="jdbc:mysql://localhost:3306/computer";
 		Statement stmt=null;
 		int flag=0;
 		ResultSet rs =null;
 		try{
 			Class.forName(driver);
 			this.conn=DriverManager.getConnection(url,"root","mcrhenryh");
 			stmt=(Statement) this.conn.createStatement();
 			rs=stmt.executeQuery(sqlTxt);
 			if (rs.next()) {
				flag=1;
			}
 		}
 		catch(ClassNotFoundException e){
 			e.printStackTrace();
 		}
 		catch(SQLException e){
 		e.printStackTrace();
 		}
 		finally{
 			this.closeConnection();
 		}
 		
 		return flag;
 	}

	

}
