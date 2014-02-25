<%--
    Document   : events
    Created on : Feb 25, 2014, 11:29:12 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="/WEB-INF/tlds/admindatacontext.tld" prefix="datacontext" %>
<!DOCTYPE html>
<html>
    <jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="News & Events | Administrator" />
	</jsp:include>

    <body>
		<jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="events" />
		</jsp:include>

		<c:choose>
			<c:when test="${empty param.page}" >
				<c:set var="page" value="1" />
			</c:when>

			<c:otherwise>
				<c:set var="page" value="${param.page}" />
			</c:otherwise>
		</c:choose>

		<c:set var="events" value="${datacontext:getEvents(page)}" />

		<div class="container content">
			<div class="col-xs-12">
				<h3>News & Events Management</h3>

				<c:choose>
					<c:when test="${not empty events}">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Image</th>
									<th>Title</th>
									<th>Short Description</th>
									<th>Published</th>
									<th>Created Date</th>
									<th>Modified Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${events}" >
									<tr>
										<td>${i.id}</td>
										<td><img src="${pageContext.request.contextPath}/${i.image}" /></td>
										<td>${i.title}</td>
										<td class="col-xs-3">${i.shortDescription}</td>
										<td class="text-center">
											<c:choose>
												<c:when test="${i.published eq true}">
													<span class="label label-primary">yes</span>
												</c:when>

												<c:otherwise><span class="label label-default">no</span></c:otherwise>
											</c:choose>
										</td>
										<td><fmt:formatDate value="${i.createdDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><fmt:formatDate value="${i.modifiedDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<ul class="pager">
							<c:choose>
								<c:when test="${page le 1}">
									<li class="disabled" ><a>Prev</a></li>
									</c:when>
									<c:otherwise>
									<li><a href="events.jsp?page=${page - 1}">Prev</a></li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${page gt datacontext:getEventsPages()}">
									<li class="disabled" ><a>Next</a></li>
									</c:when>
									<c:otherwise>
									<li><a href="events.jsp?page=${page + 1}">Next</a></li>
									</c:otherwise>
								</c:choose>
						</ul>
					</c:when>

					<c:otherwise>
						No items were found.
					</c:otherwise>
				</c:choose>
			</div>
		</div>

    </body>
</html>
