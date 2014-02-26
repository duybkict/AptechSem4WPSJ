<%--
    Document   : course
    Created on : Feb 25, 2014, 11:29:12 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="/WEB-INF/tlds/admindatacontext.tld" prefix="datacontext" %>
<!DOCTYPE html>

<c:set var="id" value="${param.id}" />
<c:if test="${empty id}"><c:redirect url="courses.jsp?error=update" /></c:if>

<c:set var="action" value="update" />
<c:set var="course" value="${datacontext:getCourseById(id)}" />
<c:if test="${empty course}"><c:set var="action" value="insert" /></c:if>

	<html>

	<c:choose>
		<c:when test="${action eq 'update'}"><c:set var="title" value="Edit Course"/></c:when>
		<c:otherwise><c:set var="title" value="New Course"/></c:otherwise>
	</c:choose>

    <jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="${title} | Administrator" />
	</jsp:include>

    <body>
		<jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="courses" />
		</jsp:include>

		<div class="container content">
			<div class="col-xs-12">
				<h3>${title}</h3>

				<form class="form-horizontal col-xs-6" action="AdminCourses" method="post">
					<div class="form-group">
						<label class="col-xs-3 control-label">ID</label>
						<div class="col-xs-9">
							<p class="form-control-static"><c:if test="${not empty course}">${course.id}</c:if></p>
							<input type="hidden" name="id" value="<c:if test="${not empty course}">${course.id}</c:if>">
							<input type="hidden" name="action" value="${action}">
						</div>
					</div>
					<div class="form-group">
						<label for="published" class="col-xs-3 control-label">Published</label>
						<div class="checkbox col-xs-9">
							<input type="checkbox" id="published" name="published" value="true" <c:if test="${not empty course && course.published eq true}">checked="checked"</c:if> style="margin-left: 0px">
						</div>
					</div>
					<div class="form-group">
						<label for="image" class="col-xs-3 control-label">Image</label>
						<div class="col-xs-9">
							<input type="text" required="required" class="form-control" id="image" name="image" value="<c:if test="${not empty course}">${course.image}</c:if>">
						</div>
					</div>
					<div class="form-group">
						<label for="title" class="col-xs-3 control-label">Title</label>
						<div class="col-xs-9">
							<input type="text" required="required" class="form-control" id="title" name="title" value="<c:if test="${not empty course}">${course.title}</c:if>">
						</div>
					</div>
					<div class="form-group">
						<label for="short_description" class="col-xs-3 control-label">Description</label>
						<div class="col-xs-9">
							<textarea required="required" class="form-control" rows="5" id="short_description" name="short_description" ><c:if test="${not empty course}">${course.shortDescription}</c:if></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="content" class="col-xs-3 control-label">Content</label>
						<div class="col-xs-9">
							<textarea required="required" class="form-control" rows="15" id="content" name="content" ><c:if test="${not empty course}">${course.content}</c:if></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="price" class="col-xs-3 control-label">Price</label>
						<div class="col-xs-9">
							<input required="required" type="text" class="form-control" id="price" name="price" value="<c:if test="${not empty course}">${course.price}</c:if>">
						</div>
					</div>
					<div class="form-group">
						<label for="status" class="col-xs-3 control-label">Status</label>
						<div class="col-xs-9">
							<select name="status" id="status" class="form-control">
								<option value="1" <c:if test="${not empty course && course.status eq 1}">selected="selected"</c:if> >Available</option>
								<option value="2" <c:if test="${not empty course && course.status eq 2}">selected="selected"</c:if> >Coming soon</option>
							</select>
						</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-3 col-xs-10">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a href="courses.jsp" class="btn btn-default">Cancel</a>
							</div>
						</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>
