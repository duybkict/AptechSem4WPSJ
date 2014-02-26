<%--
    Document   : user
    Created on : Feb 25, 2014, 11:29:12 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="/WEB-INF/tlds/admindatacontext.tld" prefix="datacontext" %>
<!DOCTYPE html>

<c:set var="id" value="${param.id}" />
<c:if test="${empty id}"><c:redirect url="users.jsp?error=update" /></c:if>

<c:set var="action" value="update" />
<c:set var="user" value="${datacontext:getUserById(id)}" />
<c:if test="${empty user}"><c:set var="action" value="insert" /></c:if>

<c:if test="${user.type eq 2 && user.id ne sessionScope.adminUser.id}"><c:redirect url="users.jsp?error=update" /></c:if>

	<html>

	<c:choose>
		<c:when test="${action eq 'update'}"><c:set var="title" value="Edit User"/></c:when>
		<c:otherwise><c:set var="title" value="New User"/></c:otherwise>
	</c:choose>

    <jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="${title} | Administrator" />
	</jsp:include>

    <body>
		<jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="users" />
		</jsp:include>

		<div class="container content">
			<div class="col-xs-12">
				<h3>${title}</h3>

				<c:choose>
					<c:when test="${empty user}">
						<form class="form-horizontal col-xs-6" action="AdminUsers" method="post">
							<div class="form-group">
								<label class="col-xs-3 control-label">ID</label>
								<div class="col-xs-9">
									<input type="hidden" name="action" value="${action}">
								</div>
							</div>
							<div class="form-group">
								<label for="type" class="col-xs-3 control-label">Type</label>
								<div class="col-xs-9">
									<select name="type" id="type" class="form-control">
										<option value="1" <c:if test="${user.type eq 1}">selected="selected"</c:if> >User</option>
										<option value="2" <c:if test="${user.type eq 2}">selected="selected"</c:if> >Administrator</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="full_name" class="col-xs-3 control-label">Full Name</label>
								<div class="col-xs-9">
									<input type="text" required="required" class="form-control" id="full_name" name="full_name" />
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-xs-3 control-label">Email</label>
								<div class="col-xs-9">
									<input type="email" required="required" class="form-control" id="email" name="email" />
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-xs-3 control-label">Password</label>
								<div class="col-xs-9">
									<input type="text" required="required" class="form-control" id="password" name="password" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-offset-3 col-xs-10">
									<button type="submit" class="btn btn-primary">Submit</button>
									<a href="users.jsp" class="btn btn-default">Cancel</a>
								</div>
							</div>
						</form>
					</c:when>

					<c:otherwise>
						<form class="form-horizontal col-xs-6" action="AdminUsers" method="post">
							<div class="form-group">
								<label class="col-xs-3 control-label">ID</label>
								<div class="col-xs-9">
									<p class="form-control-static">${user.id}</p>
									<input type="hidden" name="id" value="${user.id}">
									<input type="hidden" name="action" value="${action}">
								</div>
							</div>
							<div class="form-group">
								<label for="type" class="col-xs-3 control-label">Type</label>
								<div class="col-xs-9">
									<p class="form-control-static">
										<c:choose>
											<c:when test="${user.type eq 1}">User</c:when>
											<c:when test="${user.type eq 2}">Administrator</c:when>
										</c:choose>
									</p>
								</div>
							</div>
							<div class="form-group">
								<label for="full_name" class="col-xs-3 control-label">Full Name</label>
								<div class="col-xs-9">
									<p class="form-control-static">${user.fullName}</p>
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-xs-3 control-label">Email</label>
								<div class="col-xs-9">
									<p class="form-control-static">${user.email}</p>
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-xs-3 control-label">Password</label>
								<div class="col-xs-9">
									<input type="text" required="required" class="form-control" id="password" name="password" value="${user.password}">
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-offset-3 col-xs-10">
									<button type="submit" class="btn btn-primary">Submit</button>
									<a href="users.jsp" class="btn btn-default">Cancel</a>
								</div>
							</div>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

</body>
</html>
