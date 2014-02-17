<%--
    Document   : about
    Created on : Feb 16, 2014, 5:55:01 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
	<jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="News & Events | GoodCook" />
	</jsp:include>

    <body>
        <jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="events" />
		</jsp:include>

		<div class="container content" >
			<div class="row padding">
				<div class="col-xs-8">
					<div class="bg padding" style="margin-left: -20px; padding-right: 20px">
						<h3>News & Events</h3>

						<div class="col-xs-12 events-preview-row">
							<img class="pull-left img-thumbnail" src="images/page5-img1.jpg" alt="" />
							<strong>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</strong>
							<br />
							<p>Totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas.</p>
							<a class="btn btn-primary" href="#">Read More</a>
						</div>

						<div class="col-xs-12 events-preview-row">
							<img class="pull-left img-thumbnail" src="images/page5-img2.jpg" alt="" />
							<strong>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</strong>
							<br />
							<p>Totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas.</p>
							<a class="btn btn-primary" href="#">Read More</a>
						</div>

						<div class="col-xs-12 events-preview-row">
							<img class="pull-left img-thumbnail" src="images/page5-img3.jpg" alt="" />
							<strong>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</strong>
							<br />
							<p>Totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas.</p>
							<a class="btn btn-primary" href="#">Read More</a>
						</div>

						<div class="col-xs-12 events-preview-row">
							<img class="pull-left img-thumbnail" src="images/page5-img4.jpg" alt="" />
							<strong>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</strong>
							<br />
							<p>Totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas.</p>
							<a class="btn btn-primary" href="#">Read More</a>
						</div>

						<div class="clearfix"></div>

						<ul class="pager">
							<li class="previous disabled"><a href="#">&larr; Newer</a></li>
							<li class="next"><a href="#">Older &rarr;</a></li>
						</ul>
					</div>
				</div>

				<div class="col-xs-4">
					<h3>Our Recipes</h3>
					<hr />

					<p>
						<strong>Sed perspiciatis unde </strong><br />
						Omnis natus error sit voluptatem accusantium doloremque laudantium<br />
						<a href="#">Read more</a>
					</p>
					<br/>

					<p>
						<strong>Sed perspiciatis unde </strong><br />
						Omnis natus error sit voluptatem accusantium doloremque laudantium<br />
						<a href="#">Read more</a>
					</p>
					<br/>

					<p>
						<strong>Abillo inventore veritatis </strong><br />
						Et corporis suscipit laboriotecto beatae vitae dicta sunt explicabo.<br />
						<a href="#">Read more</a>
					</p>
					<br/>

					<p>
						<strong>Aut oditut fugit sed quia </strong><br />
						Consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. <br />
						<a href="#">Read more</a>
					</p>
					<br/>

					<p>
						<strong>Abillo inventore veritatis </strong><br />
						Et corporis suscipit laboriotecto beatae vitae dicta sunt explicabo.<br />
						<a href="#">Read more</a>
					</p>
					<br/>

					<a href="#">
						<img alt="" src="images/banner-1.jpg" />
					</a>
				</div>

			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />
    </body>
</html>
