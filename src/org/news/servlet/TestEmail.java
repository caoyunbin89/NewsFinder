package org.news.servlet;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import sun.net.smtp.SmtpClient;

import java.io.*;
import java.util.*;
import java.net.*;

public class TestEmail extends HttpServlet
{
  
  private static final String CONTENT_TYPE = "text/html";
  public void init(ServletConfig config) throws ServletException
  {
    super.init(config);
  }
  
  public void doGet(HttpServletRequest request, HttpServletResponse response) 
      throws ServletException, IOException 
  {
	  
	  SimpleEmail email = new SimpleEmail();
	  email.setSSL(true);
	  email.setSmtpPort(25);
	  email.setHostName("smtp.126.com");
	  email.setAuthentication("jambalaya2@126.com", "cyb198911");
	  try {
		  hh h=new hh();
		  ArrayList<String[]> entrys = new ArrayList<String[]>();
		  entrys=h.getdata();
		  int len = entrys.size() ;
		  String[] a=new String[len];
		  for(int i=0;i<len;i++){
			  a[i] = entrys.get(i)[0];
		  email.addTo(a[i]);
		  }
	} catch (EmailException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  try {
		email.setFrom("jambalaya2@126.com");
	} catch (EmailException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  email.setSubject("NewsFinder");
	  email.setCharset("GBK");
	  try {
		  hh j = new hh();
	    	ArrayList<String[]> entry = new ArrayList<String[]>();
	    	entry=j.getdata1();
	    	int h=entry.size();
	    	String[] url=new String[h];
			String[] titles = new String[h];
			String[] contents = new String[h];
			String[] summarys=new String[h];
			String[] guids=new String[h];
			String[] topics=new String[h];
			String o = "";
			for(int i=0; i<h; i++){
				titles[i] = entry.get(i)[1];
				contents[i] = entry.get(i)[2];
				summarys[i]=entry.get(i)[3];
				guids[i]=entry.get(i)[4];
				topics[i]=entry.get(i)[5];
//				System.out.println(" topics1:" + topics[i] );
//				System.out.println(" guid1:" +guids[i] );
//				System.out.println("url1:" + url[i] );
//				System.out.println(" id1:" + titles[i] );
//				System.out.println( " text1:" + contents[i]);
//				System.out.println(" summary1:" +summarys[i] );
				o+=guids[i]+"\n"+titles[i]+"\n"+"topic:"+topics[i]+"\n"+"Summary:"+summarys[i]+"\n"+"Contents:"+contents[i]+"\n";
				
			}
			System.out.println("o:::::"+o);
			email.setMsg(o);
		
	} catch (EmailException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  try {
		email.send();
	} catch (EmailException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  response.sendRedirect("success.jsp");
  }
  
    public void destroy() 
  {
  }
}