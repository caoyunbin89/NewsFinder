<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="NewsFinder" />
<meta name="description" content="NewsFinder" />
<title>Welcome to NewsFinder</title> 
		<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
		<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
    </head>
    <body>
		<div id="map"></div>
		<div id="bf_container" class="bf_container">
			<div id="bf_background" class="bf_background">
				<img src="images/background/default.jpg" alt="image1" style="display:none;"/>
				<div class="bf_overlay"></div>
			</div>
			<div id="bf_page_menu" class="bf_menu" >
				<h1 class="title">NewsFinder<span>WELCOME</span></h1>
				<ul>
					<li><a href="#" data-content="home"><span class="bf_hover"></span><span>Welcome</span></a></li>
					<li><a href="#" data-content="about"><span class="bf_hover"></span><span>Our News</span></a></li>
					<li><a href="#" data-content="menu"><span class="bf_hover"></span><span>About us</span></a></li>
					<li><a href="#" data-content="visitus"><span class="bf_hover"></span><span>Visit us</span></a></li>
					<li><a href="#" data-content="admin"><span class="bf_hover"></span><span>Admin</span></spa></a></li>
					<li><a href="#" data-content="contact"><span class="bf_hover"></span><span>Contact us</span></spa></a></li>
				</ul>
			</div>
			<div class="bf_page" id="home" style="display:block;">
				<div class="bf_content_text">
					<h2>Welcome</h2>
					<p>Have you ever been on your way to find something about Biomedical? Have you ever been Confused about the news that have not been classified? Have you ever been crazy to find that professional website? That is what we want to do. Believe that we are the best. </p>
				</div>
			</div>
			<div class="bf_page" id="about">
				<div class="bf_content_text">
					<h2>Our News</h2>
					<script src="js/jquery.min.js" type="text/javascript"></script>
					<script src="js/zzsc.js" type="text/javascript"></script>
					<div class="menu">
						<a class="yellow" href="NewsFinderh2.jsp">Hematology</a>
            			<a class="green" href="NewsFinderm2.jsp" >Mirobiology </a>
            			<a class="pink" href="NewsFinderi2.jsp">Immunology</a>
            			<a class="purple" href="NewsFinderc2.jsp">Cytology</a>
           	 			<a class="blue" href="NewsFinderhi2.jsp">Histopathology</a>
            			<a class="orange" href="NewsFindert2.jsp">Transfusion</a>
            			<a class="royalblue" href="NewsFinderch2.jsp">Chemistry</a>
            			<a class="dk" href="NewsFinderb2.jsp">Biomedicine</a>
            			</div>
				</div>
			</div>
			<div class="bf_page" id="menu">
				<div class="bf_content_text">
					<h2>About us</h2>
					<p>It's a beautiful school with many perfect students.</p>
					<p>We are the NewsFinder team.We build this system.Our teacher is Guo Yan.We are Tang Suwen, Shen Hui, Guo Yayun, Cao Yunbin. </p>
					<ul id="bf_dishes">
						<li><a href="#"><img id="aaa" src="images/thumbs/1.jpg" alt="thumb1"/></a></li>
						<li><a href="#"><img id="aaa"src="images/thumbs/21.jpg" alt="thumb2"/></a></li>
						<li><a href="#"><img id="aaa"src="images/thumbs/3.jpg" alt="thumb3"/></a></li>
						<li><a href="#"><img id="aaa"src="images/thumbs/cao1.jpg" alt="thumb4"/></a></li>
					</ul>
				</div>
				<div id="bf_gallery" class="bf_gallery">
					<a id="bf_close" href="#" class="bf_close"></a>
					<div class="bf_nav">
						<a id="bf_prev" href="#" class="bf_prev"></a>
						<a id="bf_next" href="#" class="bf_next"></a>
					</div>
					<div class="bf_gallery_wrapper">
						<div class="bf_gallery_item">
							<div class="bf_heading"><h2>Tang Suwen</h2></div>
							<div class="bf_desc">
								<p>Email:330692678@qq.com</p>
							</div>
							<img src="images/foreground/1.jpg" alt="image1" data-bgimg="images/background/1.jpg" />
						</div>
						<div class="bf_gallery_item">
							<div class="bf_heading"><h2>Shen Hui</h2></div>
							<div class="bf_desc">
								<p>Email:422176020@qq.com</p>
							</div>
							<img src="images/foreground/21.jpg" alt="image1" data-bgimg="images/background/21.jpg" />
						</div>
						<div class="bf_gallery_item">
							<div class="bf_heading"><h2>Guo Yayun</h2></div>
							<div class="bf_desc">
								<p>Email:295106466@qq.com</p>
							</div>
							<img src="images/foreground/3.jpg" alt="image1" data-bgimg="images/background/3.jpg" />
						</div>
						<div class="bf_gallery_item">
							<div class="bf_heading"><h2>Cao Yunbin</h2></div>
							<div class="bf_desc">
								<p>Email:jambalaya2@126.com</p>
							</div>
							<img src="images/foreground/cao1.jpg" alt="image1" data-bgimg="images/background/cao1.jpg" />
						</div>

					</div>
				</div>
			</div>
			<div class="bf_page" id="visitus" >
				<div class="bf_content_text">
			<h2>Visit us</h2>
					<div class="menu">
					<a class="yellow" href="NewsFindertest1.html" >visit us</a>
					</div>
				</div>
			</div>
		<div class="bf_page" id="admin" >
				<div class="bf_content_text">
					<h2>Admin page</h2>
					<div class="menu">
					<a class="blue" href="NewsFinderlogin.jsp" >Admin login</a>
					</div>
				</div>
			</div>
			<div class="bf_page" id="contact" >
				<div class="bf_content_text">
					<h2>How to contact us</h2>
					<p>You could input your email address in the followig input box.Then we will send the news to you!</p>
					<div class="menu">
					<form action=emailinsert method=post>
					<input type="text" name=contact></input>
					<input type="submit" value="input" ></input>
					</div>
				</div>
			</div>
		<div class="bf_footer">
			<a class="bf_left" href="http://sse.ustc.edu.cn/pages/index.php"><span>&laquo;We come from:</span>sse ustc</a>

		</div>
		<!-- The JavaScript -->
		<!-- the mousewheel plugin - optional to provide mousewheel support -->
		<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
		<script type="text/javascript" src="js/jquery.template.min.js"></script>
    </body>
</html>