<%--
    Document   : users
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
		<jsp:param name="title" value="Users | Administrator" />
	</jsp:include>

    <body>
		<jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="users" />
		</jsp:include>

		<c:choose>
			<c:when test="${empty param.page}" >
				<c:set var="page" value="1" />
			</c:when>

			<c:otherwise>
				<c:set var="page" value="${param.page}" />
			</c:otherwise>
		</c:choose>

		<c:set var="users" value="${datacontext:getUsers(page)}" />
		<c:set var="error" value="${param.error}" />
		<c:set var="success" value="${param.success}" />

		<div class="container content">
			<div class="col-xs-12">
				<c:if test="${not empty success}">
					<div class="alert alert-success">
						<c:choose>
							<c:when test="${success eq 'reset'}" >Reset password successfully.</c:when>
							<c:when test="${success eq 'setadmin'}" >Set admin successfully.</c:when>
							<c:when test="${success eq 'unsetadmin'}" >Unset admin successfully.</c:when>
						</c:choose>
					</div>
				</c:if>

				<c:if test="${not empty error}">
					<div class="alert alert-danger">
						<c:choose>
							<c:when test="${error eq 'reset'}" >Reset password failed.</c:when>
							<c:when test="${success eq 'setadmin'}" >Set admin failed.</c:when>
							<c:when test="${success eq 'unsetadmin'}" >Unset admin failed.</c:when>
						</c:choose>
					</div>
				</c:if>

				<h3>Users Management</h3>
				<a class="btn btn-primary" href="user.jsp?id=0" style="margin-bottom: 10px">
					<span class="glyphicon glyphicon-plus"></span>&nbsp;New User
				</a>

				<c:choose>
					<c:when test="${not empty users}">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>Full Name</th>
									<th>Email</th>
									<th>Password</th>
									<th>Type</th>
									<th>Created Date</th>
									<th>Modified Date</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${users}" >
									<tr>
										<td>${i.id}</td>
										<td>${i.fullName}</td>
										<td>${i.email}</td>
										<td>******</td>
										<td>
											<c:choose>
												<c:when test="${i.type eq 2}">
													<span class="label label-primary">admin</span>
												</c:when>

												<c:otherwise><span class="label label-default">user</span></c:otherwise>
											</c:choose>
										</td>
										<td><fmt:formatDate value="${i.createdDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><fmt:formatDate value="${i.modifiedDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td width="160px">
											<c:choose>
												<c:when test="${i.type eq 1}">
													<form action="AdminUsers" method="post" style="display:inline-block">
														<input type="hidden" name="action" value="setadmin" />
														<input type="hidden" name="id" value="${i.id}" />
														<button class="btn btn-primary btn-sm" onclick="return confirm('Are you sure?');">Set Admin</button>
													</form>
												</c:when>

												<c:otherwise>
													<form action="AdminUsers" method="post" style="display:inline-block">
														<input type="hidden" name="action" value="unsetadmin" />
														<input type="hidden" name="id" value="${i.id}" />
														<button class="btn btn-danger btn-sm <c:if test="${i.id eq sessionScope.adminUser.id}">disabled</c:if>" onclick="return confirm('Are you sure?');">Unset Admin</button>
														</form>
												</c:otherwise>
											</c:choose>

											<c:if test="${i.id eq sessionScope.adminUser.id || i.type eq 1}">
												<a class="btn btn-primary btn-sm" href="user.jsp?id=${i.id}">Edit</a>
											</c:if>
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
									<li><a href="events.jsp?page=${page - 1}">Prev</a></li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${page gt datacontext:getFeedbacksPages()}">
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
