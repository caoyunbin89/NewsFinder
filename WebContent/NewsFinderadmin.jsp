<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title> 
        <link rel="stylesheet" type="text/css" href="css/style1.css" />
		<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
		<link href='http://fonts.googleapis.com/css?family=Astloch:regular,bold' rel='stylesheet' type='text/css' />
		<link type="text/css" href="css/jquery.jscrollpane.css" rel="stylesheet" media="all" />
		<link rel="stylesheet" type="text/css" href="css/reset1.css" >
    </head>
    <body>
    <%
    try{
    String yan=(String)session.getAttribute("yan");
    if(!yan.equals("yiyan")){response.sendRedirect("login.jsp");}
    }
    catch(Exception e){
    	response.sendRedirect("login.jsp");
    }
    %>
		<div id="mb_background" class="mb_background">
			<img class="mb_bgimage" src="images/background/22.jpg" alt="Background"/>
			<div class="mb_overlay"></div>
			<div class="mb_loading"></div>
		</div>
		<div id="mb_pattern" class="mb_pattern"></div>
		<div class="mb_heading">
			<h1>Admin page</h1>
		</div>
		<div id="mb_menu" class="mb_menu">
			<a href="#" data-speed="1000" data-easing="easeOutBack">About</a>
			<a href="#" data-speed="1000" data-easing="easeInExpo">Check</a>
			<a href="#" data-speed="1000" data-easing="easeOutBack">Email</a>
		</div>
		<div id="mb_content_wrapper" class="mb_content_wrapper">
			<span class="mb_close"></span>
			<div class="mb_content">
				<h2>About</h2>
				<div class="mb_content_inner">
					<p>Welcome back our Administrator.This is an Administrator page.You can do somthing that others cannot do.</p>
				</div>
			</div>
			<div class="mb_content">
				<h2>Check</h2>
				<div class="mb_content_inner">
					<p>Administrator checks the the news which is published on the website. He can change the classification of the news.</p>
					<ul id="mb_imagelist" class="mb_imagelist">
						<li><img id="m" src="images/small/1.png" alt="image1"  onclick="location='NewsFinderh3.jsp'"/></li>
						<li><img id="m" src="images/small/21.png" alt="image2" onclick="location='NewsFinderm3.jsp'"/></li>
						<li><img id="m" src="images/small/y3.png" alt="image3" onclick="location='NewsFinderi3.jsp'"/></li>
						<li><img id="m" src="images/small/y4.png" alt="image4" onclick="location='NewsFinderc3.jsp'"/></li>
						<li><img id="m" src="images/small/y5.png" alt="image2" onclick="location='NewsFinderhi3.jsp'"/></li>
						<li><img id="m" src="images/small/y6.png" alt="image1" onclick="location='NewsFindert3.jsp'"/></li>
						<li><img id="m" src="images/small/y7.png" alt="image4" onclick="location='NewsFinderch3.jsp'"/></li>
						<li><img id="m" src="images/small/y8.png" alt="image3" onclick="location='NewsFinderb3.jsp'"/></li>
						<li><img id="m" src="images/small/y9.png" alt="image3" onclick="location='NewsFindero3.jsp'"/></li>
					</ul>
					
				</div>
			</div>
			<div class="mb_content">
				<h2>Email</h2>
				<div class="mb_content_inner">
				<br>
				<br>
				<a href="TestEmail">Email</a>
				</div>
			</div>
		</div>
		<div class="mb_footer">
			<a class="bf_left" href="NewsFinderindex.jsp">&laquo;back</a>
			
		</div>
		<!-- The JavaScript -->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
		<!-- the mousewheel plugin - optional to provide mousewheel support -->
		<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
		<!-- the jScrollPane script -->
		<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" src="js/jquery.transform-0.9.3.min_.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
		<script type="text/javascript">
			$(function() {
				var $menu			= $('#mb_menu'),
				$menuItems			= $menu.children('a'),
				$mbWrapper			= $('#mb_content_wrapper'),
				$mbClose			= $mbWrapper.children('.mb_close'),
				$mbContentItems		= $mbWrapper.children('.mb_content'),
				$mbContentInnerItems= $mbContentItems.children('.mb_content_inner');
				$mbPattern			= $('#mb_pattern'),
				$works				= $('#mb_imagelist > li'),
				$mb_bgimage			= $('#mb_background > img'),
				
				Menu		 		= (function(){
					
					var init		= function() {
						preloadImages();
						initPlugins();
						initPattern();
						initEventsHandler();
					},
					//preloads the images for the work area (data-bgimg attr)
					preloadImages	= function() {
						$works.each(function(i) {
							$('<img/>').attr('src' , $(this).children('img').data('bgimg'));
						});
					},
					//initialise the jScollPane (scroll plugin)
					initPlugins		= function() {
						$mbContentInnerItems.jScrollPane({
							verticalDragMinHeight: 40,
							verticalDragMaxHeight: 40
						});
					},
					/*
						draws 16 boxes on a specific area of the page.
						we randomly calculate the top, left, and rotation angle for each one of them
					 */
					initPattern		= function() {
						for(var i = 0; i < 16 ; ++i) {
							//random opacity, top, left and angle
							var o		= 0.1,
							t		= Math.floor(Math.random()*196) + 5, // between 5 and 200
							l		= Math.floor(Math.random()*696) + 5, // between 5 and 700
							a		= Math.floor(Math.random()*101) - 50; // between -50 and 50
									
							$el		= $('<div>').css({
								opacity			: o,
								top				: t + 'px',
								left			: l + 'px'
							});
								
							if (!$.browser.msie)
								$el.transform({'rotate'	: a + 'deg'});
								
							$el.appendTo($mbPattern);
						}
						$mbPattern.children().draggable(); //just for fun
					},
					/*
						when the User closes a content item, we move the boxes back to the original place,
						with new random values for top, left and angle though
					 */
					disperse 		= function() {
						$mbPattern.children().each(function(i) {
							//random opacity, top, left and angle
							var o			= 0.1,
							t			= Math.floor(Math.random()*196) + 5, // between 5 and 200
							l			= Math.floor(Math.random()*696) + 5, // between 5 and 700
							a			= Math.floor(Math.random()*101) - 50; // between -50 and 50
							$el			= $(this),
							param		= {
								width	: '50px',
								height	: '50px',
								opacity	: o,
								top		: t + 'px',
								left	: l + 'px'
							};
									
							if (!$.browser.msie)
								param.rotate	= a + 'deg';
									
							$el.animate(param, 1000, 'easeOutExpo');
						});
					},
					initEventsHandler	= function() {
						/*
							click a link in the menu
						 */
						$menuItems.bind('click', function(e) {
							var $this	= $(this),
							pos		= $this.index(),
							speed	= $this.data('speed'),
							easing	= $this.data('easing');
							//if an item is not yet shown
							if(!$menu.data('open')){
								//if current animating return
								if($menu.data('moving')) return false;
								$menu.data('moving', true);
								$.when(openItem(pos, speed, easing)).done(function(){
									$menu.data({
										open	: true,
										moving	: false
									});
									showContentItem(pos);
									$mbPattern.children().fadeOut(500);
								});
							}
							else
								showContentItem(pos);
							return false;
						});
							
						/*
							click close makes the boxes animate to the top of the page
						 */
						$mbClose.bind('click', function(e) {
							$menu.data('open', false);
							/*
								if we would want to show the default image when we close:
								changeBGImage('images/default.jpg');
							 */
							$mbPattern.children().fadeIn(500, function() {
								$mbContentItems.hide();
								$mbWrapper.hide();
							});
								
							disperse();
							return false;
						});
							
						/*
							click an image from "Works" content item,
							displays the image on the background
						 */
						$works.bind('click', function(e) {
							var source	= $(this).children('img').data('bgimg');
							changeBGImage(source);
							return false;
						});
								
					},
					/*
						changes the background image
					 */
					changeBGImage		= function(img) {
						//if its the current one return
						if($mb_bgimage.attr('src') === img || $mb_bgimage.siblings('img').length > 0)
							return false;
									
						var $itemImage = $('<img src="'+img+'" alt="Background" class="mb_bgimage" style="display:none;"/>');
						$itemImage.insertBefore($mb_bgimage);
							
						$mb_bgimage.fadeOut(1000, function() {
							$(this).remove();
							$mb_bgimage = $itemImage;
						});
						$itemImage.fadeIn(1000);
					},
					/*
						This shows a content item when there is already one shown:
					 */
					showContentItem		= function(pos) {
						$mbContentItems.hide();
						$mbWrapper.show();
						$mbContentItems.eq(pos).show().children('.mb_content_inner').jScrollPane();
					},
					/*
						moves the boxes from the top to the center of the page,
						and shows the respective content item
					 */
					openItem			= function(pos, speed, easing) {
						return $.Deferred(
						function(dfd) {
							$mbPattern.children().each(function(i) {
								var $el			= $(this),
								param		= {
									width	: '100px',
									height	: '100px',
									top		: 154 + 100 * Math.floor(i/4),
									left	: 200 + 100 * (i%4),
									opacity	: 1
								};
										
								if (!$.browser.msie)
									param.rotate	= '0deg';
										
								$el.animate(param, speed, easing, dfd.resolve);
							});
						}
					).promise();
					};
						
					return {
						init : init
					};
					
				})();
			
				/*
					call the init method of Menu
				 */
				Menu.init();
			});
		</script>
    </body>
</html>