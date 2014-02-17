<%--
    Document   : courses
    Created on : Feb 16, 2014, 5:55:01 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
	<jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="Courses | GoodCook" />
	</jsp:include>

    <body>
        <jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="courses" />
		</jsp:include>

		<div class="container content" >
			<div class="row padding">
				<div class="col-xs-8">
					<div class="courses-brief-row">
						<h3>What we provide</h3>
						<p>
							<strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </strong><br />
							Lorem ipsum dolor sit amet, <span class="text-orange">consectetur adipiscing</span> elit. Suspendisse fermentum ipsum vel ligula condimentum, a facilisis nisl adipiscing. Phasellus dui elit, porttitor in pulvinar porta, congue varius risus. Morbi non lorem lobortis, cursus lorem ac, tempor lectus. Sed hendrerit vehicula sollicitudin. Vivamus porta eu justo fringilla feugiat. Sed in leo mauris.
						</p>
						<div class="col-xs-6">
							<ul class="list-arrow">
								<li>Lorem ipsum dolor amet consectetur</li>
								<li>Adipisicing eldo eiusmd tempor incididunt</li>
								<li>Labore et dolore magna aliqua</li>
								<li>Ut enim ad minim veniam, quis nostrud</li>
							</ul>
						</div>
						<div class="col-xs-6">
							<ul class="list-arrow">
								<li>Exercitation ullamco laboris nisi ut aliquip</li>
								<li>Duis aute irure dolor reprehenderit</li>
								<li>Voluptate vejlit esse cillum dolore eu fugiat</li>
								<li>Excepteur sint occaecat cupidatat non</li>
							</ul>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="bg padding courses-bg-row">
						<h3>Starting Soon</h3>

						<div class="col-xs-12 courses-preview-row">
							<img class="pull-left img-thumbnail" src="images/page5-img2.jpg" alt="" />
							<strong>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</strong>
							<br />
							<p>Totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas.</p>
							<a class="btn btn-primary" href="#">Read More</a>
						</div>

						<div class="col-xs-12 courses-preview-row last">
							<img class="pull-left img-thumbnail" src="images/page5-img2.jpg" alt="" />
							<strong>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</strong>
							<br />
							<p>Totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas.</p>
							<a class="btn btn-primary" href="#">Read More</a>
						</div>

						<div class="clearfix"></div>
					</div>
				</div>

				<div class="col-xs-4">
					<h3>All Courses</h3>
					<hr />

					<p class="text-justify">
						<strong class="text-orange">At vero eos et accusamus et iusto odio dignissimos</strong><br />
						Qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.
					</p>

					<img src="images/page3-img3.jpg" alt="" style="width: 100%; display: block" />

					<br />
					<ul class="list-arrow">
						<li><a href="#">Similique sunt in culpa qui officia</a></li>
						<li><a href="#">Saepe eveniet voluptates repudian</a></li>
						<li><a href="#">Deserunt mollitia animi id est</a></li>
						<li><a href="#">Laborum et dolorum fugait harum</a></li>
						<li><a href="#">Quidem rerum facilis expedita</a></li>
						<li><a href="#">Nam libero tempore cum soluta</a></li>
					</ul>
					<ul class="list-arrow">
						<li><a href="#">Nobis eligendi optio cumque nihil</a></li>
						<li><a href="#">Impedit quo minus id quod maxime</a></li>
						<li><a href="#">Placeat facere possimus, omnis</a></li>
						<li><a href="#">Voluptas assumenda omnis dolor</a></li>
						<li><a href="#">Temporibus autem quibusdam</a></li>
						<li><a href="#">Officiis debitis rerum necessitati</a></li>
					</ul>
				</div>

			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />
    </body>
</html>
