<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %> 
<% 
String rand = (String)session.getAttribute("rand"); 
String input = request.getParameter("rand"); 
String username=(String) request.getParameter("t_UserName");
String passwd=(String) request.getParameter("t_UserPass");
if(rand.equals(input)&&username.equals("admin123")&&passwd.equals("admin123")){ 
out.print("<script>alert('��֤ͨ����');location.href='/NewsFinder/NewsFinderadmin.jsp'</script>");
session.setAttribute("yan", "yiyan");
} else{ 
out.print("<script>alert('��������ȷ����֤�룡');location.href='login.html';</script>"); 
} 
%> 


