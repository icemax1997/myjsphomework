package student;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.swing.text.DefaultEditorKit.InsertBreakAction;

import org.apache.taglibs.standard.lang.jstl.ValueSuffix;

import db.DbManage;
import db.DbManage1;
public class StudentLogic1 {
	 public int deletStudentInfo(String table,String id) throws SQLException{
		 DbManage1 db=new DbManage1();
		 int flag=0;
		 String sqlTxt="delete from "+table+" where id ='"+id+"'";
		 try{
			 flag=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag;
	 }
	 public int PatchdeletStudentInfo(String table,String[] values) throws SQLException{
		 DbManage1 db=new DbManage1();
		 int flag=0;	 
		 String sqlTxt="delete  from "+table+" where ";
		 for (int i = 0; i < values.length; i++) {
			
			if (i== values.length-1) {
				sqlTxt=sqlTxt + " id = "+values[i];
				System.out.println(sqlTxt);
				break;
			}else {
				sqlTxt=sqlTxt + " id = "+values[i]+" or";
			}
		}
		 try{
			 flag=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag;
	 }
	 public int Matching(String username,String password,String power) throws SQLException{
		 DbManage1 db=new DbManage1();
		 int flag=0;	 
		 String sqlTxt="select  * from users where username='"+username+"' and password = '"+password+"' and power = '"+power+"'";
		 
		 try{
			 flag=db.executeQuery(sqlTxt);

		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag;
	 }
	 public int addStudentInfo(String sqlTxt) throws SQLException{
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
	 public int addUser(String power,String username,String password) throws SQLException{
		 int flag=0;
//		 INSERT into users (power,username,password) VALUES('2','admin2','admin2')
		 String sqlTxt="INSERT into users (power,username,password) VALUES ('"+power+"','"+username+"','"+password+"')";
		 DbManage1 db=new DbManage1();
		 try{
			 flag=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag;
	 }
	 public int editStudentInfo(String table,String id,String sname,String sprice,  String snumber) throws SQLException{
		 int flag=0;
		 String sqlTxt="update "+table+" set sname='"+sname
				 +"',sprice='"+sprice
				 +"',snumber='"+snumber
				 
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
	 public int editUser(String username,  String password) throws SQLException{
		 int flag=0;
		 String sqlTxt="update users set password='"+password+"' where username="+username;
		 DbManage1 db=new DbManage1();
		 try{
			 flag=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag;
	 }
	 public int PowerChange(String table, String[] ids) throws SQLException{
		 int flag=0;
//		 UPDATE users set power=1 where id=1 or id=2 or id=3
		 String sqlTxt="UPDATE "+table+" set power=1 where ";
		 for (int i = 0; i < ids.length; i++) {
			if (i==ids.length-1) {
				sqlTxt=sqlTxt+"id= "+ids[i]+"";
			}else {
				sqlTxt=sqlTxt+"id= "+ids[i]+" or ";
			}
		}
		 DbManage1 db=new DbManage1();
		 try{
			 flag=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag;
	 }
	 public int PowerChange2(String table, String[] ids) throws SQLException{
		 int flag2=0;
//		 UPDATE users set power=2 where id not in(1,2,3)
		 String sqlTxt="UPDATE "+table+" set power=2 where id not in(";
		 for (int i = 0; i < ids.length; i++) {
			if (i==ids.length-1) {
				sqlTxt=sqlTxt+ids[i]+")";
			}else {
				sqlTxt=sqlTxt+ids[i]+",";
			}
		}
		 DbManage1 db=new DbManage1();
		 try{
			 flag2=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag2;
	 }
	 public int PowerChange3(String table, String[] ids) throws SQLException{
		 int flag3=0;
//		 UPDATE users set power_tran =1 where id=1 or id=2 or id=3
		 String sqlTxt="UPDATE "+table+" set power2=1 where ";
		 for (int i = 0; i < ids.length; i++) {
			if (i==ids.length-1) {
				sqlTxt=sqlTxt+"id= "+ids[i]+"";
			}else {
				sqlTxt=sqlTxt+"id= "+ids[i]+" or ";
			}
		}
		 DbManage1 db=new DbManage1();
		 try{
			 flag3=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag3;
	 }
	 public int PowerChange4(String table, String[] ids2) throws SQLException{
		 int flag4=0;
//		 UPDATE users set power_tran =2 where id not in(1,2,3)
		 String sqlTxt="UPDATE "+table+" set power2=2 where id not in(";
		 for (int i = 0; i < ids2.length; i++) {
			if (i==ids2.length-1) {
				sqlTxt=sqlTxt+ids2[i]+")";
			}else {
				sqlTxt=sqlTxt+ids2[i]+",";
			}
		}
		 DbManage1 db=new DbManage1();
		 try{
			 flag4=db.excuteSql(sqlTxt);
		 }
		 catch(SQLException ex){
			 throw ex;
		 }
		 return flag4;
	 }
	 public int queryStudentInfo(String id,String sname,String sprice,  String snumber) throws SQLException{
				 int flag=0;
				 String sqlTxt="select * from shuiguoshicai where id='"+id+"' or sname="+sname+"' or sprice='"+sprice+"' or snumber='"+snumber
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
	 public ArrayList<StudentInfo> getStudentInfo(String sqlTxt)
			 throws SQLException{
				 ArrayList<StudentInfo> alStu=new ArrayList<StudentInfo>();
				 ResultSet rs=null;
				 DbManage db=new DbManage();
				 try{
					 rs=db.querySql(sqlTxt);
					 while(rs.next()){
						 StudentInfo stu=new StudentInfo();
						 stu.setId(rs.getInt("id"));
						 stu.setSname(rs.getString("sname"));
						 stu.setSprice(rs.getString("sprice"));
						 stu.setSnumber(rs.getString("snumber"));
						 
						 alStu.add(stu);
				 }
				 }
				 catch(SQLException ex){
				 throw ex;
			 }
				 finally{
					 db.closeConnection();
				 }
				 return alStu;
		 }
}
