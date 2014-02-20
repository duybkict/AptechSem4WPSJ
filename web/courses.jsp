<%--
    Document   : courses
    Created on : Feb 16, 2014, 5:55:01 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="datacontext" uri="/WEB-INF/tlds/datacontext.tld" %>
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
						<h3>Available Courses</h3>

						<c:forEach var="course" items="${datacontext:getAvailableCourses()}">
							<div class="col-xs-12 courses-preview-row">
								<img class="pull-left img-thumbnail" src="${course.image}" alt="" />
								<strong>${course.title}</strong>
								<br />
								${course.shortDescription}
								<a class="btn btn-primary" href="#">Read More</a>
							</div>
						</c:forEach>

						<div class="clearfix"></div>
					</div>
				</div>

				<div class="col-xs-4">
					<h3>Starting Soon</h3>
					<hr />

					<p class="text-justify">
						<strong class="text-orange">At vero eos et accusamus et iusto odio dignissimos</strong><br />
						Qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.
					</p>

					<img src="images/page3-img3.jpg" alt="" style="width: 100%; display: block" />

					<br />
					<ul class="list-arrow">
						<c:forEach var="course" items="${datacontext:getStartingSoonCourses()}" varStatus="status">
							<li><a href="#">${course.title}</a></li>
							<c:if test="${((status.index + 1) % 5) eq 0}" ><br /></c:if>
						</c:forEach>
					</ul>
				</div>

			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />
    </body>
</html>
