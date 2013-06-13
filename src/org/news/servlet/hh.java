package org.news.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class hh {
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
	public static ArrayList<String[]> getdata(String s1) throws IOException
	{
		Connection conn=DBCon.getConn();
		ArrayList<String []> entrys = new ArrayList<String[]>();
		String sql="select * from news where topics=\""+s1+"\";";
		String in[]=null;
		try {
			PreparedStatement stmt=(PreparedStatement) conn.prepareStatement(sql);
			System.out.println(stmt);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				String[] entry =  new String[7];
				entry[0] = rs.getString("url");
				entry[1] = rs.getString("title");
				entry[2] = rs.getString("content");
				entry[3]=rs.getString("summary");
				entry[4]=rs.getString("guid");
				entry[5]=rs.getString("topics");
				entry[6]=rs.getString("pubdate");
				entrys.add(entry);
				System.out.println(" topics:" + entry[5] );
				System.out.println(" guid:" + entry[4] );
				System.out.println("url:" + entry[0] );
				System.out.println(" id:" + entry[1] );
				System.out.println( " text:" + entry[2]);
				System.out.println(" summary:" + entry[3] );
				
				
			}
			rs.close();
	        stmt.close();
	        conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();}
		return entrys; 
	}
	public static ArrayList<String[]> getdata() throws IOException
	{
		Connection conn=DBCon.getConn();
		ArrayList<String []> entrys = new ArrayList<String[]>();
		String sql="select * from email;";
		String in[]=null;
		try {
			PreparedStatement stmt=(PreparedStatement) conn.prepareStatement(sql);
			System.out.println(stmt);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				String[] entry =  new String[1];
				entry[0] = rs.getString("email");
				entrys.add(entry);
				System.out.println(" email:" + entry[0] );	
				
			}
			rs.close();
	        stmt.close();
	        conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();}
		return entrys; 
	}
	public static ArrayList<String[]> getdata1() throws IOException
	{
		Connection conn=DBCon.getConn();
		ArrayList<String []> entrys = new ArrayList<String[]>();
		String sql="select * from news ;";
		String in[]=null;
		try {
			PreparedStatement stmt=(PreparedStatement) conn.prepareStatement(sql);
			System.out.println(stmt);
			ResultSet rs=stmt.executeQuery();
			while(rs.next()){
				String[] entry =  new String[6];
				entry[0] = rs.getString("url");
				entry[1] = rs.getString("title");
				entry[2] = rs.getString("content");
				entry[3]=rs.getString("summary");
				entry[4]=rs.getString("guid");
				entry[5]=rs.getString("topics");
				entrys.add(entry);
				System.out.println(" topics:" + entry[5] );
				System.out.println(" guid:" + entry[4] );
				System.out.println("url:" + entry[0] );
				System.out.println(" id:" + entry[1] );
				System.out.println( " text:" + entry[2]);
				System.out.println(" summary:" + entry[3] );
				
				
			}
			rs.close();
	        stmt.close();
	        conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();}
		return entrys; 
	}
	public static boolean save(String s1,String s2,String s3,String s4,String s5, String s6, String s7){
		boolean result =false;
		Connection conn=null;
		conn=DBCon.getConn();
		String sql="insert into news(guid,pubdate,title,summary,url,content,topics) values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement stmt=(PreparedStatement) conn.prepareStatement(sql);
			stmt.setString(1, s1);
			stmt.setString(2, s2);
			stmt.setString(3,s3);
			stmt.setString(4,s4);
			stmt.setString(5,s5);
			stmt.setString(6,s6);
			stmt.setString(7,s7);
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
	public static boolean save(String s1,String s2){
		boolean result =false;
		Connection conn=null;
		conn=DBCon.getConn();
		String sql="update news set topics=\""+s1+"\" where title=\""+s2+"\";";
		try {
			PreparedStatement stmt=(PreparedStatement) conn.prepareStatement(sql);
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
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			//String query="Hematology";
			//getdata(query);
			 hh j = new hh();
		    	ArrayList<String[]> entrys = new ArrayList<String[]>();
		    	entrys=j.getdata1();
		    	int h=entrys.size();
		    	String[] url=new String[h];
				String[] titles = new String[h];
				String[] contents = new String[h];
				String[] summarys=new String[h];
				String[] guids=new String[h];
				String[] topics=new String[h];
				String o = "";
				for(int i=0; i<h; i++){
					titles[i] = entrys.get(i)[1];
					contents[i] = entrys.get(i)[2];
					summarys[i]=entrys.get(i)[3];
					guids[i]=entrys.get(i)[4];
					topics[i]=entrys.get(i)[5];
					System.out.println(" topics1:" + topics[i] );
					System.out.println(" guid1:" +guids[i] );
					System.out.println("url1:" + url[i] );
					System.out.println(" id1:" + titles[i] );
					System.out.println( " text1:" + contents[i]);
					System.out.println(" summary1:" +summarys[i] );
					o+=titles[i];
				}
				System.out.println("o:::::"+o);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
