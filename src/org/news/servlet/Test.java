package org.news.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Test {
	public static class DBCon{
		private static java.sql.Connection con=null;
		public static java.sql.Connection getConn(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String user="root";
			String pwd="198911";
			String url="jdbc:mysql://localhost:3306/test";
			try {
				con=(Connection) DriverManager.getConnection(url,user,pwd);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
		}
	}
	
	public static boolean saveemail(String s1){
		boolean result =false;
		Connection conn=null;
		conn=DBCon.getConn();
		String sql="insert into email (email) values(?)";
		try {
			PreparedStatement stmt=(PreparedStatement) conn.prepareStatement(sql);
			stmt.setString(1, s1);
			int i=stmt.executeUpdate();
			if(i==1)
				result=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
		
	}

 
 public static void main(String argv[]){
 }
}