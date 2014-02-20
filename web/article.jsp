<%--
    Document   : about
    Created on : Feb 16, 2014, 5:55:01 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="datacontext" uri="/WEB-INF/tlds/datacontext.tld" %>
<!DOCTYPE html>

<html>
	<c:if test="${empty param.id}" >
		<c:redirect url="article_not_found.jsp" />
	</c:if>

	<c:set var="articleId" value="${param.id}" />
	<c:set var="article" value="${datacontext:getArticleById(articleId)}" />
	<c:if test="${article eq null}" >
		<c:redirect url="article_not_found.jsp" />
	</c:if>

	<jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="${article.title} | GoodCook" />
	</jsp:include>

    <body>
		<c:set var="active" value="articles" />
		<c:if test="${article.category eq 2}">
			<c:set var="active" value="courses" />
		</c:if>

        <jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="${active}" />
		</jsp:include>

		<div class="container content" >
			<div class="row padding">
				<div class="col-xs-8">
					<div>
						<h3>${article.title}</h3>
						<strong>${article.shortDescription}</strong>
						<img src="${article.image}" alt="" class="pull-left img-thumbnail" style="margin-right: 20px;"/>
						${article.content}
					</div>

					<div class="clearfix"></div>

					<c:if test="${article.category eq 2}" >
						<div class="bg padding courses-bg-row">
							<c:choose>
								<c:when test="${article.status eq 1}" >
									<h3 class="pull-left" style="margin-top: 7px">Course is now available</h3>
									<a href="#" class="btn btn-orange pull-right col-xs-4 btn-lg">Enroll Now</a>
								</c:when>
								<c:otherwise>
									<h3 class="pull-left" style="margin-top: 7px">Coming soon</h3>
									<a class="btn btn-default pull-right col-xs-4 btn-lg" disabled="disabled">Now Unavailable</a>
								</c:otherwise>
							</c:choose>

							<div class="clearfix"></div>
							<br />
							<c:choose>
								<c:when test="${article.price gt 0.0}">
									<strong>Price: </strong>&dollar;${article.price}
								</c:when>
								<c:otherwise>
									<strong>Price: </strong>N/A
								</c:otherwise>
							</c:choose>
							<p>Course is not open for enrollment at the moment. Sed nec tellus vel dui imperdiet aliquam. Sed feugiat blandit tortor. <a href="contacts.jsp">Contact us</a> suspendisse metus lectus, fringilla a posuere ornare.</p>
						</div>

						<div class="clearfix"></div>
					</c:if>

					<div class="bg padding courses-bg-row">
						<c:choose>
							<c:when test="${article.category eq 2 && article.status eq 1}" >
								<h3>Another courses</h3>

								<c:forEach var="course" items="${datacontext:getAvailableCourses()}">
									<c:if test="${article.id ne course.id}" >
										<c:set var="link" value="article.jsp?id=${course.id}" />
										<div class="col-xs-12 courses-preview-row">
											<a href="${link}"><img class="pull-left img-thumbnail" src="${course.image}" alt="" /></a>
											<strong>${course.title}</strong>
											<br />
											${course.shortDescription}
											<a class="btn btn-primary" href="${link}">Read More</a>
										</div>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<h3>Available courses</h3>

								<c:forEach var="course" items="${datacontext:getAvailableCourses()}">
									<c:set var="link" value="article.jsp?id=${course.id}" />
									<div class="col-xs-12 courses-preview-row">
										<a href="${link}"><img class="pull-left img-thumbnail" src="${course.image}" alt="" /></a>
										<strong>${course.title}</strong>
										<br />
										${course.shortDescription}
										<a class="btn btn-primary" href="${link}">Read More</a>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>

						<div class="clearfix"></div>
					</div>
				</div>

				<div class="col-xs-4">
					<h3>What may interest you</h3>
					<hr />

					<c:forEach var="article" items="${datacontext:getRandomArticles(4)}">
						<c:set var="link" value="article.jsp?id=${article.id}" />
						<strong>${article.title}</strong>
						${article.shortDescription}
						<a href="${link}" class="pull-right">Read more</a>
						<br/>
						<br/>
					</c:forEach>

					<a href="#" class="center-block">
						<img alt="" src="images/banner-1.jpg" style="display: block; width: 100%;"/>
					</a>
				</div>

			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />
    </body>
</html>
