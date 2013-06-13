<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="org.w3c.dom.*" %>
<%@ page import="java.util.ArrayList;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/first.css" />
<style type="text/css">

p{
	width: 600px;
	font-size:15px;
	position:relative;
	background-color:#3A1608;
	left:320px;
	top:50px;
	color:white;
	padding:10px;
	margin-top:0px;
	color:white;
	font-weigh:bold;
	opacity: 0.8;
	z-index:-2;
}

a{
	font-family:Arial,Verdana,Sans-serif;
backgroud-color:#4169e1;
position:relative;
margin:15px;
top:45px;
left:400px;
font-size:15px;
width:800px;
	text-decoration: none;
	color:#00ffff;
	opaccity:0.6;
	z-index:20;
}
img.mb_bgimage{
	position:fixed;
	left:0px;
	top:0px;
	width:100%;
	opacity:0.5;
	z-index:-1;
}</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="userproject3.js"></script>
<title>Insert title here</title>
</head>
<body>
<img class="mb_bgimage" src="images/background/bg.jpg" alt="Background"/>
<%
//当前页开始记录页下标CurrentRecond
// 计算pageCount
%>
<%
String len = (String)request.getAttribute("length");
int length =Integer.parseInt(len);
String query=(String)session.getAttribute("keyword");
%>
<div id="box"><%=query %></div>
<%
	String[] url=(String[])request.getAttribute("url");
	String[] guid=(String[])request.getAttribute("guid");
	String[] content=(String[])request.getAttribute("content");
	String[] title=(String[])request.getAttribute("title");
	String[] topic=(String[])request.getAttribute("topic");
	String[] summary=(String[])request.getAttribute("summary");
	int pageSize = 1;//每页显示多少条记录
	int pageNow = 1;    //希望显示第几页，默认为1
	int pageCount = 0 ;    //一共有多少页
	int rowCount = length;          //共有多少条记录
	int CurrentRecond = 0;  
	if(rowCount%pageSize == 0){
		pageCount = rowCount/pageSize;
	}else {
		pageCount = rowCount/pageSize+1;
	}

		
	String s_pageNow = (String)request.getAttribute("s_pageNow");
	if(s_pageNow!=null){
		pageNow = Integer.parseInt(s_pageNow);
		CurrentRecond = (pageNow-1)*pageSize;
	} 

	if(pageNow > pageCount){
		out.println("<br>");
		out.println("<div id=\"ab\">"+"Nothing else！"+"</div><br>Please do another search");
		out.println("<a id=\"ab\" href=input?pageNow="+1+">Back to the first page!</a>");
	}else{
		%>

		<%	if(pageNow != pageCount){
			for(int i=0;i<pageSize;i++){%>

			<br/>
			<a href=<%=url[CurrentRecond+i]%>><%=title[CurrentRecond+i]%></a>
			<p>
			<%out.println(content[CurrentRecond+i]);%>
			</p>
			<br/>
			<%
			}
			}else{  //if(pageNow == pageCount)
				int lastCount = 0;
				lastCount = rowCount%pageSize;
				if(lastCount == 0) {
					lastCount = pageSize;
				}
				for(int i=0;i<(lastCount);i++){%>			
				<br/>				
				<a  href=<%=url[CurrentRecond+i]%>><%=title[CurrentRecond+i]%></a>
				<p>
				<%out.println(content[CurrentRecond+i]);%>
				</p>
				<br/>
				<%
				}
		}
		%><br><br><br><br>
		<%	
			//上一页
			if(pageNow != 1){
				out.println("<a  href=input?pageNow="+(pageNow-1)+" style=\"text-decoration: none\">prev</a>");
			}
			//显示当前页
			for(int j=0;j<5;j++){
				out.println("<a  href=input?pageNow="+(pageNow+j)+" style=\"text-decoration: none\">["+(pageNow+j)+"]</a>");
			}
			//下一页
			if(pageNow != pageCount){
				out.println("<a  href=input?pageNow="+(pageNow+1)+" style=\"text-decoration: none\">next</a>");
			}
		}	
		%>   
		<br>
		<br>

		<form action="input" method="post">

		
		<input  type="text" name="pageNow" value="">
		<input  type="submit" value="skip"  />
		<a href="NewsFinderindex.jsp">back</a>

		</form>
		</div>
		<div style="text-align:center;font-size:11px;height:50">
		<br><br><br><br><br>
		<hr width=40%>
</body>
</html>