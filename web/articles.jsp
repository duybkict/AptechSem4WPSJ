<%--
    Document   : events
    Created on : Feb 16, 2014, 5:55:01 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="datacontext" uri="/WEB-INF/tlds/datacontext.tld" %>
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

						<c:choose>
							<c:when test="${empty param.page}" >
								<c:set var="page" value="1" />
							</c:when>

							<c:otherwise>
								<c:set var="page" value="${param.page}" />
							</c:otherwise>
						</c:choose>

						<c:forEach var="event" items="${datacontext:getEvents(page)}">
							<c:set var="link" value="article.jsp?id=${event.id}" />
							<div class="col-xs-12 events-preview-row">
								<a href="${link}"><img class="pull-left img-thumbnail" src="${event.image}" alt="" /></a>
								<strong>${event.title}</strong>
								<br />
								${event.shortDescription}
								<a class="btn btn-primary" href="${link}">Read More</a>
							</div>
						</c:forEach>

						<div class="clearfix"></div>

						<ul class="pager">
							<c:choose>
								<c:when test="${page le 1}">
									<li class="previous disabled" ><a>&larr; Newer</a></li>
									</c:when>
									<c:otherwise>
									<li class="previous" ><a href="events.jsp?page=${page - 1}">&larr; Newer</a></li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${page gt datacontext:getEventsPages()}">
									<li class="next disabled" ><a>Older &rarr;</a></li>
									</c:when>
									<c:otherwise>
									<li class="next" ><a href="events.jsp?page=${page + 1}">Older &rarr;</a></li>
									</c:otherwise>
								</c:choose>
						</ul>
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

					<a href="courses.jsp">
						<img alt="" src="images/banner-1.jpg" style="display: block; width: 100%;"/>
					</a>
				</div>

			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />
    </body>
</html>
