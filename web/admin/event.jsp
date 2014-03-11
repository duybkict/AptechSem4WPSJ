<%--
    Document   : event
    Created on : Feb 25, 2014, 11:29:12 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="/WEB-INF/tlds/admindatacontext.tld" prefix="datacontext" %>
<!DOCTYPE html>

<c:set var="id" value="${param.id}" />
<c:if test="${empty id}"><c:redirect url="events.jsp?error=update" /></c:if>

<c:set var="action" value="update" />
<c:set var="event" value="${datacontext:getArticleById(id)}" />
<c:if test="${empty event}"><c:set var="action" value="insert" /></c:if>
<c:if test="${not empty event && event.category eq 2}"><c:redirect url="course.jsp?id=${event.id}" /></c:if>

	<html>

	<c:choose>
		<c:when test="${action eq 'update'}"><c:set var="title" value="Edit Event"/></c:when>
		<c:otherwise><c:set var="title" value="New Event"/></c:otherwise>
	</c:choose>

    <jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="${title} | Administrator" />
	</jsp:include>

    <body>
		<jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="events" />
		</jsp:include>

		<div class="container content">
			<div class="col-xs-12">
				<h3>${title}</h3>

				<form class="form-horizontal col-xs-6" action="AdminEvents" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="col-xs-3 control-label">ID</label>
						<div class="col-xs-9">
							<p class="form-control-static"><c:if test="${not empty event}">${event.id}</c:if></p>
							<input type="hidden" name="id" value="<c:if test="${not empty event}">${event.id}</c:if>">
							<input type="hidden" name="action" value="${action}">
						</div>
					</div>
					<div class="form-group">
						<label for="published" class="col-xs-3 control-label">Published</label>
						<div class="checkbox col-xs-9">
							<input type="checkbox" id="published" name="published" value="true" <c:if test="${not empty event && event.published eq true}">checked="checked"</c:if> style="margin-left: 0px">
							</div>
						</div>
						<div class="form-group form-group-file">
							<label for="image" class="col-xs-3 control-label">Image</label>
							<div class="col-xs-9">
								<div class="col-xs-4" style="position:relative;">
									<a class="btn btn-primary" href='javascript:;'>
										Choose File...
										<input type="file" class="input-file" name="image" id="image" onchange='jQuery("#upload-file-info").html(jQuery(this).val());' value="<c:if test="${not empty course}">${course.image}</c:if>" />
									</a>
								</div>
								<div class="col-xs-8">
									<span class="label label-info" id="upload-file-info"><c:if test="${not empty event}">${event.image}</c:if></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="title" class="col-xs-3 control-label">Title</label>
							<div class="col-xs-9">
								<input type="text" required="required" class="form-control" id="title" name="title" value="<c:if test="${not empty event}">${event.title}</c:if>">
							</div>
						</div>
						<div class="form-group">
							<label for="short_description" class="col-xs-3 control-label">Description</label>
							<div class="col-xs-9">
								<textarea class="form-control mceEditor" rows="5" id="short_description" name="short_description" ><c:if test="${not empty event}">${event.shortDescription}</c:if></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="content" class="col-xs-3 control-label">Content</label>
							<div class="col-xs-9">
								<textarea class="form-control mceEditor" rows="15" id="content" name="content" ><c:if test="${not empty event}">${event.content}</c:if></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-offset-3 col-xs-10">
							<button type="submit" class="btn btn-primary">Submit</button>
							<a href="events.jsp" class="btn btn-default">Cancel</a>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>
