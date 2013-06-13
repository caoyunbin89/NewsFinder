<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="org.w3c.dom.*" %>
<%@ page import="java.util.ArrayList;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/first11.css" />
<style type="text/css">
body{
background-color:black;

}
#box1{
padding:3px 7px 2px 7px;
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
position:relative;
top:40px;
left:550px;
font-size:30px;
color:red;
}
#p{
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
}
a{
	font-family:Arial,Verdana,Sans-serif;
backgroud-color:#4169e1;
position:relative;
margin:15px;
top:45px;
left:350px;
font-size:15px;
width:800px;
	text-decoration: none;
	color:#00ffff;
	opaccity:0.6;
	z-index:20;
}
table{
position:relative;
left:320px;
top:30px;
width:600px;
color:#FFCC33;
z-index:20;
}
#c{
position:relative;
top:45px;
left:350px;
color:white;}
#b{
position:relative;
left:860px;
top:110px;
z-index:20;
}
img.mb_bgimage{
	position:fixed;
	left:0px;
	top:0px;
	width:100%;
	opacity:0.5;
	z-index:1;
}
</style>
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
<div id="box1"><%=query %></div>
<%
	String[] url=(String[])request.getAttribute("url");
	String[] guid=(String[])request.getAttribute("guid");
	String[] content=(String[])request.getAttribute("content");
	String[] title=(String[])request.getAttribute("title");
	String[] topic=(String[])request.getAttribute("topic");
	String[] summary=(String[])request.getAttribute("summary");
	String[] pubdate=(String[])request.getAttribute("pubdate");
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
		out.println("<a id=\"ab\" href=admin?pageNow="+1+">Back to the first page!</a>");
	}else{
		%>

		<%	if(pageNow != pageCount){
			for(int i=0;i<pageSize;i++){%>

			<br/>
			<a href=<%=url[CurrentRecond+i]%>><%=title[CurrentRecond+i]%></a>
			<div id="c">publish date:<%=pubdate[CurrentRecond+i] %></div>
			<div id="p">
			<%out.println(content[CurrentRecond+i]);
			%>
			</div>
			<br/>
			<%
			session.setAttribute("titles", title[CurrentRecond+i]);
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
				<div id="c">publish date:<%=pubdate[CurrentRecond+i] %></div>
				
				<div id="p">
				<%//out.println(summary[CurrentRecond+i]);%>
				<%out.println(content[CurrentRecond+i]);%>
				</div>
				
				<br/>
				<%
				session.setAttribute("titles", title[CurrentRecond+i]);
				}
			
		}
		%><br>
		<form action=change method="post" >
		<table border="1" bordercolor="#66FF99">
		<tr>
		<td><input type="radio" name=lei value=0 >Hematology</input></td>
		<td><input type="radio" name=lei value=1 >MedicalMicrobiology</input></td>
		<td><input type="radio" name=lei value=2 >Immunology</input></td>
		<td><input type="radio" name=lei value=3 >Cytology</input></td>
		</tr>
		<tr>
		<td><input type="radio" name=lei value=4 >Histopathology</input></td>
		<td><input type="radio" name=lei value=5 >BloodTransfusion</input></td>
		<td><input type="radio" name=lei value=6 >ClinicalChemistry</input></td>
		<td><input type="radio" name=lei value=7 >Biomedicine</input></td>
		</tr>
		<input type="submit" value="change" id="b"/>
		</table>
		<br>
		
		<br><br>
		<%	
			//上一页
			if(pageNow != 1){
				out.println("<a  href=admin?pageNow="+(pageNow-1)+" style=\"text-decoration: none\">prev</a>");
			}
			//显示当前页
			for(int j=0;j<5;j++){
				out.println("<a  href=admin?pageNow="+(pageNow+j)+" style=\"text-decoration: none\">["+(pageNow+j)+"]</a>");
			}
			//下一页
			if(pageNow != pageCount){
				out.println("<a  href=admin?pageNow="+(pageNow+1)+" style=\"text-decoration: none\">next</a>");
			}
		}	
		%>   
		<br>
		<br>

		<a href="NewsFinderadmin.jsp">back to admin</a>
		</form>

		</div>
		<div style="text-align:center;font-size:11px;height:50">

		<br><br><br><br><br>
		<hr width=40%>
</body>
</html>