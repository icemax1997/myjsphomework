package db;
import java.sql.Connection;
import java.sql.SQLException;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class DbManage {
     private Connection conn;
     public ResultSet querySql(String sqlTxt) throws SQLException{
    	 String driver= "com.mysql.jdbc.Driver";
 		String url="jdbc:mysql://localhost:3306/computer";
 		Statement stmt=null;
 		ResultSet rs=null;
 		try{
 			Class.forName(driver);
 			this.conn=DriverManager.getConnection(url,"root","mcrhenryh");
 			stmt=(Statement) this.conn.createStatement();
 			rs=stmt.executeQuery(sqlTxt);
 		}
 		catch(ClassNotFoundException e){
 			e.printStackTrace();
 		}
 		catch(SQLException e){
 		e.printStackTrace();
 		}
 		
 		return rs;
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

}
