package index;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DbManage;
import db.DbManage1;
import mark.MarkInfo;

public class IndexUser {
	 public int editStudentInfo(String username,String password) throws SQLException{
		 int flag=0;
		 String sqlTxt="update users set password='"+password+"' where username= '"+username+"' ";
		 System.out.println(sqlTxt);
		 DbManage1 db=new DbManage1();
		 try{
			 flag=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag;
	 }
	 public ArrayList<Index_user> getIndex(String sqlTxt)
			 throws SQLException{
				 ArrayList<Index_user> alindex=new ArrayList<Index_user>();
				 ResultSet rs=null;
				 DbManage db=new DbManage();
				 try{
					 rs=db.querySql(sqlTxt);
					 while(rs.next()){
						 Index_user smark=new Index_user();
						
						 smark.setUsername(rs.getString("username"));
						 smark.setPassword(rs.getString("password"));
						 alindex.add(smark);
				 }
				 }
				 catch(SQLException ex){
				 throw ex;
			 }
				 finally{
					 db.closeConnection();
				 }
				 return alindex;
		 }
}
