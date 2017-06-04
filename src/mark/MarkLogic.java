package mark;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import db.DbManage;
import db.DbManage1;
public class MarkLogic {
	 public int deletMarkInfo(String id) throws SQLException{
		 DbManage1 db=new DbManage1();
		 int flag=0;
		 String sqlTxt="delete from mark where id ='"+id+"'";
		 try{
			 flag=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag;
	 }
	
	 public int addMarkInfo(String sqlTxt) throws SQLException{
		 int flag=0;
		 
		 DbManage1 db=new DbManage1();
		 try{
			 flag=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag;
	 }
	 public int editMarkInfo(String table,String id,String sname,String stime,  String slocal,String maxprice,String minprice,String sprice) throws SQLException{
		 int flag=0;
		 String sqlTxt="update "+table+" set sname='"+sname
				 +"',stime='"+stime
				 +"',slocal='"+slocal
				 +"',maxprice='"+maxprice
				 +"',minprice='"+minprice
				 +"',sprice='"+sprice
				 +"' where id="+id;
		 DbManage1 db=new DbManage1();
		 try{
			 flag=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag;
	 }
	 public int editMarkInfo2(String table,String id,String username) throws SQLException{
		  
		 int flag=0;
		 int year,month,date,day,hour,miniute,second;
		 String str="",temp="";
		 Calendar cl = Calendar.getInstance();
		 year = cl.get(Calendar.YEAR);
		 month = cl.get(Calendar.MONTH)+1;
		 date = cl.get(Calendar.DAY_OF_MONTH);
		 day = cl.get(Calendar.DAY_OF_WEEK);
		 switch(day){
		 case 1:
		 temp="日"; break;
		 case 2:
		 temp="一"; break;
		 case 3:
		 temp="二"; break;
		 case 4:
		 temp="三"; break;
		 case 5:
		 temp="四"; break;
		 case 6:
		 temp="五"; break;
		 case 7:
		 temp="六"; break;
		 }
		 hour = cl.get(Calendar.HOUR_OF_DAY);
		 miniute = cl.get(Calendar.MINUTE);
		 second = cl.get(Calendar.SECOND);
		 str = year+"年"+month+"月 "+date+"日  星期 "+temp+hour+":"+miniute+":"+second;
		 String sqlTxt="update mark_del set username = '"+username+"', dotime='"+ str+"' where id="+id;
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
	 public int editMarkInfo3(String table,String id,String username,String sname) throws SQLException{
		  
		 int flag=0;
		 int year,month,date,day,hour,miniute,second;
		 String str="",temp="";
		 Calendar cl = Calendar.getInstance();
		 year = cl.get(Calendar.YEAR);
		 month = cl.get(Calendar.MONTH)+1;
		 date = cl.get(Calendar.DAY_OF_MONTH);
		 day = cl.get(Calendar.DAY_OF_WEEK);
		 switch(day){
		 case 1:
		 temp="日"; break;
		 case 2:
		 temp="一"; break;
		 case 3:
		 temp="二"; break;
		 case 4:
		 temp="三"; break;
		 case 5:
		 temp="四"; break;
		 case 6:
		 temp="五"; break;
		 case 7:
		 temp="六"; break;
		 }
		 hour = cl.get(Calendar.HOUR_OF_DAY);
		 miniute = cl.get(Calendar.MINUTE);
		 second = cl.get(Calendar.SECOND);
		 str = year+"年"+month+"月 "+date+"日  星期 "+temp+hour+":"+miniute+":"+second;
		 String sqlTxt="update mark_ins set username = '"+username+"', dotime='"+ str+"' where sname='"+sname+"'";
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
	 public int editMarkInfo4(String table,String id,String username) throws SQLException{
		  
		 int flag=0;
		 int year,month,date,day,hour,miniute,second;
		 String str="",temp="";
		 Calendar cl = Calendar.getInstance();
		 year = cl.get(Calendar.YEAR);
		 month = cl.get(Calendar.MONTH)+1;
		 date = cl.get(Calendar.DAY_OF_MONTH);
		 day = cl.get(Calendar.DAY_OF_WEEK);
		 switch(day){
		 case 1:
		 temp="日"; break;
		 case 2:
		 temp="一"; break;
		 case 3:
		 temp="二"; break;
		 case 4:
		 temp="三"; break;
		 case 5:
		 temp="四"; break;
		 case 6:
		 temp="五"; break;
		 case 7:
		 temp="六"; break;
		 }
		 hour = cl.get(Calendar.HOUR_OF_DAY);
		 miniute = cl.get(Calendar.MINUTE);
		 second = cl.get(Calendar.SECOND);
		 str = year+"年"+month+"月 "+date+"日  星期 "+temp+hour+":"+miniute+":"+second;
		 String sqlTxt="update mark_up set username = '"+username+"', dotime='"+ str+"' where id="+id;
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
	 public int queryMarkInfo(String id,String sname,String stime,  String slocal,String maxprice,String minprice,String sprice) throws SQLException{
				 int flag=0;
				 String sqlTxt="select * from mark where id='"+id
						 +"' or sname="+sname
						 +"' or stime='"+stime
						 +"' or slocal='"+slocal
						 +"' or maxprice='"+maxprice
						 +"' or minprice='"+minprice
						 +"' or sprice='"+sprice
						 ;
				 DbManage1 db=new DbManage1();
				 try{
					 flag=db.excuteSql(sqlTxt);
				 }
				 catch(SQLException ex){
					 throw ex;
				 }
				 return flag;
			 }
	 public ArrayList<MarkInfo> getMarkInfo(String sqlTxt)
			 throws SQLException{
				 ArrayList<MarkInfo> almark=new ArrayList<MarkInfo>();
				 ResultSet rs=null;
				 DbManage db=new DbManage();
				 try{
					 rs=db.querySql(sqlTxt);
					 while(rs.next()){
						 MarkInfo smark=new MarkInfo();
						 smark.setId(rs.getInt("id"));
						 smark.setSname(rs.getString("sname"));
						 smark.setStime(rs.getString("stime"));
						 smark.setSlocal(rs.getString("slocal"));
						 smark.setMaxprice(rs.getString("maxprice"));
						 smark.setMinprice(rs.getString("minprice"));
						 smark.setSprice(rs.getString("sprice"));
						 almark.add(smark);
				 }
				 }
				 catch(SQLException ex){
				 throw ex;
			 }
				 finally{
					 db.closeConnection();
				 }
				 return almark;
		 }
}
