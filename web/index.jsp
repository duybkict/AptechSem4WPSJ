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
								<a class="btn btn-primary btn-lg" href="article.jsp?id=10">Read More</a>
							</div>
						</li>
						<li>
							<img src="images/slider-img2.jpg" alt="" />
							<div class="banner">
								<strong class="title font-lobster">
									<strong>Lorem</strong><em>Lipsum</em>
								</strong>
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
								<a class="btn btn-primary btn-lg" href="article.jsp?id=8">Read More</a>
							</div>
						</li>
						<li>
							<img src="images/slider-img3.jpg" alt="" />
							<div class="banner">
								<strong class="title font-lobster">
									<strong>Sed</strong><em>Quia</em>
								</strong>
								<p>Neque porro quisquam estui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam.</p>
								<a class="btn btn-primary btn-lg" href="article.jsp?id=9">Read More</a>
							</div>
						</li>
					</ul>
					<span class="banner-2" href="#"></span>
				</div>
				<ul class="pags">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
				</ul>
			</div>

			<div class="row home-articles-row padding bg">
				<div class="col-xs-4">
					<h3>Weight loss ideas</h3>
					<p>orem ipsum dolor sit amet, consectetur adipiscing elit. Donec leo sem, rhoncus in consequat eu, lobortis vel quam. Pellentesque sit amet sagittis sem, in volutpat lacus.</p>
					<a class="btn btn-orange" href="courses.jsp">Read More</a>
				</div>
				<div class="col-xs-4">
					<h3>Fast food. Yes or no?</h3>
					<p>Mauris a eros a urna tincidunt pulvinar. Maecenas consequat, ligula ac eleifend placerat, neque tellus pretium tortor, a tristique metus nisl eu augue.</p>
					<a class="btn btn-orange" href="articles.jsp">Read More</a>
				</div>
				<div class="col-xs-4 last">
					<h3>Taste of Asia</h3>
					<p>Donec gravida lacus eu ipsum mattis, a aliquet eros varius. Sed aliquam pulvinar ligula. Donec sollicitudin sagittis odio non iaculis. </p>
					<a class="btn btn-orange" href="contacts.jsp">Read More</a>
				</div>
			</div>

			<div class="row home-preview-row padding">
				<div class="col-xs-8">
					<h4 class="font-lobster"><strong>Welcome</strong> <em>to Our Site!</em></h4>
					<p><strong>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudan tium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas. Nulla vestibulum venenatis pharetra. Curabitur viverra vitae nibh ac gravida:</strong><br /></p>
					<ul class="list-arrow">
						<li>Sit aspernatur aut odit aut fugit quia consequuntur</li>
						<li>Magni dolores eos qui ratione voluptatem sequi nesciunt eque</li>
						<li>Maecenas sollicitudin sagittis ligula</li>
						<li>Qui dolorem ipsum quia dolor sit amet, consectetur adipisci</li>
						<li>Sed quia non numquam eius modi tempora incidunt</li>
					</ul>
				</div>
				<div class="col-xs-4">
					<br/>
					<a href="courses.jsp"><img src="images/banner-1.jpg" alt="" style="display: block; width: 100%;" /></a>
				</div>
			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />

		<script type="text/javascript">
			jQuery(window).load(function() {
				jQuery('.slider')._TMS({
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