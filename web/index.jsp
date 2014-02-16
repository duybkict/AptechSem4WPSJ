<%--
    Document   : index
    Created on : Feb 15, 2014, 11:53:06 AM
    Author     : Duy
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>

		<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<link rel='stylesheet' href='css/font-lobster.css' type='text/css'>
		<link rel='stylesheet' href='css/font-myriadpro.css' type='text/css'>

		<script src="js/jquery-1.6.3.min.js" type="text/javascript"></script>
		<script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
		<script src="js/tms-0.3.js" type="text/javascript"></script>
		<script src="js/tms_presets.js" type="text/javascript"></script>
	</head>

	<body>
		<header role="banner">
			<div class="container">
				<div class="row">
					<h1><a href="index.html">GoodCook</a></h1>
					<ul class="list-social">
						<li>Link to Us:</li>
						<li><a title="facebook" href="#"></a></li>
						<li><a title="twitter" href="#"></a></li>
						<li><a title="linkedin" href="#"></a></li>
					</ul>
				</div>
			</div>
		</header>
		<nav class="navbar navbar-collapse" role="navigation">
			<div class="container">
				<div class="row">
					<ul class="nav navbar-nav">
						<li><a class="active" href="index.html">Main</a></li>
						<li><a href="about.html">About Us</a></li>
						<li><a href="courses.html">Courses</a></li>
						<li><a href="events.html">News & Events</a></li>
						<li><a href="contacts.html">Contacts</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container content" >
			<div class="row">
				<div class="slider">
					<ul class="items">
						<li>
							<img src="images/slider-img1.jpg" alt="" />
							<div class="banner">
								<strong class="title font-lobster">
									<strong>Hot</strong><em>Recipe</em>
								</strong>
								<p class="p3">Lorem ipsum dolor sit amet consecteur adipising elit, sed do eiusmod tem por incididunt ut labore et dolore magna.</p>
								<a class="btn btn-primary btn-lg" href="#">Read More</a>
							</div>
						</li>
						<li>
							<img src="images/slider-img2.jpg" alt="" />
							<div class="banner">
								<strong class="title font-lobster">
									<strong>Lorem</strong><em>Lipsum</em>
								</strong>
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
								<a class="btn btn-primary btn-lg" href="#">Read More</a>
							</div>
						</li>
						<li>
							<img src="images/slider-img3.jpg" alt="" />
							<div class="banner">
								<strong class="title font-lobster">
									<strong>Sed</strong><em>Quia</em>
								</strong>
								<p>Neque porro quisquam estui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam.</p>
								<a class="btn btn-primary btn-lg" href="#">Read More</a>
							</div>
						</li>
					</ul>
					<a class="banner-2" href="#"></a>
				</div>
				<ul class="pags">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
				</ul>
			</div>

			<div class="row home-articles-row">
				<div class="col-xs-4">
					<h3>Weight Loss Ideas</h3>
					<p>Good Cook is one of <a class="link" href="http://blog.templatemonster.com/free-website-templates/" target="_blank">free website templates</a> created by TemplateMonster.com team. This template is optimized for 1280X1024 screen resolution. It is also XHTML &amp; CSS valid.</p>
					<a class="btn btn-orange" href="#">Read More</a>
				</div>
				<div class="col-xs-4">
					<h3>Fast Food. Yes or No?</h3>
					<p>This <a class="link" href="http://blog.templatemonster.com/2011/09/26/free-website-template-slideshow-cooking/" target="_blank" rel="nofollow">Good Cook Template</a> goes with two pack ages – with PSD source files and without them. PSD source files are available for free for the registered members of Templates.com.</p>
					<a class="btn btn-orange" href="#">Read More</a>
				</div>
				<div class="col-xs-4 last">
					<h3>Taste of Asia</h3>
					<p>This web template has several pages: <a class="link" href="index.html">Main</a>, <a class="link" href="about.html">About Us</a>, <a class="link" href="courses.html">Courses</a>, <a class="link" href="recipes.html">New Recipes</a>, <a class="link" href="calendar.html">Calendar</a>, <a class="link" href="contacts.html">Contact Us</a> (please note that contact us form – doesn’t work).</p>
					<a class="btn btn-orange" href="#">Read More</a>
				</div>
			</div>

			<div class="row home-preview-row">
				<div class="col-xs-8">
					<h4 class="font-lobster"><strong>Welcome</strong> <em>to Our Site!</em></h4>
					<p class="color-2 p1">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudan tium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas:</p>
					<ul>
						<li>Sit aspernatur aut odit aut fugit quia consequuntur</li>
						<li>Magni dolores eos qui ratione voluptatem sequi nesciunt eque</li>
						<li>Qui dolorem ipsum quia dolor sit amet, consectetur adipisci</li>
						<li>Sed quia non numquam eius modi tempora incidunt</li>
					</ul>
				</div>
				<div class="col-xs-4 aligncenter">
					<a href="#"><img src="images/banner-1.jpg" alt="" /></a>
				</div>
			</div>
		</div>

		<footer>
			<div class="container">
				<div class="row">
					<div class="col-xs-12 aligncenter">
						Lorem ipsum dolor sit amet, Consectetur adipiscing elit. <span>Inventore veritatis</span> et quasi ullamcorper ipsum.<br />
						<span>GoodCook</span> Copyright &copy; 2014
					</div>
				</div>
			</div>
		</footer>

		<script type="text/javascript">
			$(window).load(function() {
				$('.slider')._TMS({
					duration: 1000,
					easing: 'easeOutQuart',
					preset: 'simpleFade',
					slideshow: 10000,
					banners: 'fade',
					pauseOnHover: true,
					waitBannerAnimation: false,
					pagination: '.pags'
				});
			});
		</script>
	</body>
</html>