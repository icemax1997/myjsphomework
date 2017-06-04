package index;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DbManage;
import db.DbManage1;
import mark.MarkInfo;

public class IndexLogic {
	 public int editStudentInfo(String id,String num) throws SQLException{
		 int flag=0;
		 String sqlTxt="update bar set num='"+num+"' where id="+id;
		 DbManage1 db=new DbManage1();
		 try{
			 flag=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag;
	 }
	 public ArrayList<Index> getIndex(String sqlTxt)
			 throws SQLException{
				 ArrayList<Index> alindex=new ArrayList<Index>();
				 ResultSet rs=null;
				 DbManage db=new DbManage();
				 try{
					 rs=db.querySql(sqlTxt);
					 while(rs.next()){
						 Index smark=new Index();
						 smark.setId(rs.getInt("id"));
						 smark.setName(rs.getString("name"));
						 smark.setNum(rs.getInt("num"));
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
