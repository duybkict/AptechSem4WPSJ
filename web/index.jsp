<%--
    Document   : index
    Created on : Feb 15, 2014, 11:53:06 AM
    Author     : Duy
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
	<jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="Home | GoodCook" />
	</jsp:include>

	<body>
		<jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="index" />
		</jsp:include>

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

			<div class="row home-articles-row padding bg">
				<div class="col-xs-4">
					<h3>Weight Loss Ideas</h3>
					<p>Good Cook is one of <a class="link" href="http://blog.templatemonster.com/free-website-templates/" target="_blank">free website templates</a> created by TemplateMonster.com team. This template is optimized for 1280X1024 screen resolution. It is also XHTML &amp; CSS valid.</p>
					<a class="btn btn-orange" href="#">Read More</a>
				</div>
				<div class="col-xs-4">
					<h3>Fast Food. Yes or No?</h3>
					<p>This <a class="link" href="http://blog.templatemonster.com/2011/09/26/free-website-template-slideshow-cooking/" target="_blank" rel="nofollow">Good Cook Template</a> goes with two pack ages – with PSD source files and without them. </p>
					<a class="btn btn-orange" href="#">Read More</a>
				</div>
				<div class="col-xs-4 last">
					<h3>Taste of Asia</h3>
					<p>This web template has several pages: <a class="link" href="index.html">Main</a>, <a class="link" href="about.html">About Us</a>, <a class="link" href="courses.html">Courses</a>, <a class="link" href="recipes.html">New Recipes</a>, <a class="link" href="calendar.html">Calendar</a>, <a class="link" href="contacts.html">Contact Us</a> (please note that contact us form – doesn’t work).</p>
					<a class="btn btn-orange" href="#">Read More</a>
				</div>
			</div>

			<div class="row home-preview-row padding">
				<div class="col-xs-8">
					<h4 class="font-lobster"><strong>Welcome</strong> <em>to Our Site!</em></h4>
					<p><strong>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudan tium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas:</strong><br /></p>
					<ul>
						<li>Sit aspernatur aut odit aut fugit quia consequuntur</li>
						<li>Magni dolores eos qui ratione voluptatem sequi nesciunt eque</li>
						<li>Qui dolorem ipsum quia dolor sit amet, consectetur adipisci</li>
						<li>Sed quia non numquam eius modi tempora incidunt</li>
					</ul>
				</div>
				<div class="col-xs-4">
					<a href="#"><img src="images/banner-1.jpg" alt="" /></a>
				</div>
			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />

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