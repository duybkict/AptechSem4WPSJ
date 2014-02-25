<%--
    Document   : feedback
    Created on : Feb 25, 2014, 11:29:12 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/admindatacontext.tld" prefix="datacontext" %>
<!DOCTYPE html>
<html>
    <jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="Login | Administrator" />
	</jsp:include>

    <body>
		<jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="feedback" />
		</jsp:include>

		<c:choose>
			<c:when test="${empty param.page}" >
				<c:set var="page" value="1" />
			</c:when>

			<c:otherwise>
				<c:set var="page" value="${param.page}" />
			</c:otherwise>
		</c:choose>

		<c:set var="feedback" value="${datacontext:getFeedbacks(page)}" />

		<div class="container content">
			<div class="col-xs-12">
				<h3>Feedback Management</h3>

				<c:choose>
					<c:when test="${not empty feedback}">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Full Name</th>
									<th>Email</th>
									<th>Message</th>
									<th>Created Date</th>
									<th>Modified Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${feedback}" >
									<tr>
										<td>${i.id}</td>
										<td>${i.fullName}</td>
										<td>${i.email}</td>
										<td class="col-xs-5">${i.message}</td>
										<td>${i.createdDate}</td>
										<td>${i.modifiedDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						No items were found.
					</c:otherwise>
				</c:choose>
			</div>
		</div>

    </body>
</html>
