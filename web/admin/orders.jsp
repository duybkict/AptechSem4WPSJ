<%--
    Document   : orders
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
		<jsp:param name="title" value="Orders | Administrator" />
	</jsp:include>

    <body>
		<jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="orders" />
		</jsp:include>

		<c:choose>
			<c:when test="${empty param.page}" >
				<c:set var="page" value="1" />
			</c:when>

			<c:otherwise>
				<c:set var="page" value="${param.page}" />
			</c:otherwise>
		</c:choose>

		<c:set var="orders" value="${datacontext:getOrders(page)}" />

		<div class="container content">
			<div class="col-xs-12">
				<h3>Orders Management</h3>

				<c:choose>
					<c:when test="${not empty orders}">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>User</th>
									<th class="col-xs-1 text-center">Status</th>
									<th>Created Date</th>
									<th>Modified Date</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${orders}" >
									<tr>
										<td>${i.id}</td>
										<td>${i.user.fullName}</td>
										<td class="text-center">
											<c:choose>
												<c:when test="${i.status eq 1}">
													<span class="label label-primary">pending</span>
												</c:when>

												<c:when test="${i.status eq 2}">
													<span class="label label-success">confirmed</span>
												</c:when>

												<c:otherwise><span class="label label-default">canceled</span></c:otherwise>
											</c:choose>
										</td>
										<td><fmt:formatDate value="${i.createdDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><fmt:formatDate value="${i.modifiedDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>
											<a class="btn btn-primary btn-sm" href="order.jsp?id=${i.id}">Edit</a>
											<form action="AdminOrders" method="post" style="display:inline-block">
												<input type="hidden" name="action" value="delete" />
												<input type="hidden" name="id" value="${i.id}" />
												<button class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">Delete</button>
											</form>
										</td>
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
									<li><a href="orders.jsp?page=${page - 1}">Prev</a></li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${page gt datacontext:getOrdersPages()}">
									<li class="disabled" ><a>Next</a></li>
									</c:when>
									<c:otherwise>
									<li><a href="orders.jsp?page=${page + 1}">Next</a></li>
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
