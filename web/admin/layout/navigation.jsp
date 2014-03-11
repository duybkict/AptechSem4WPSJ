<%--
    Document   : navigation
    Created on : Feb 16, 2014, 5:41:02 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="active" value="${param.active}" />
<c:set var="user" value="${sessionScope.adminUser}" />

<c:if test="${empty user}">
	<jsp:forward page="../index.jsp?error=authentication" />
</c:if>

<nav class="navbar navbar-static-top navbar-inverse" role="navigation" style="margin-bottom: 0px">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="main.jsp">Administrator</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li <c:if test="${active eq 'courses'}"> class="active"</c:if>><a href="courses.jsp">Courses</a></li>
				<li <c:if test="${active eq 'events'}"> class="active"</c:if>><a href="events.jsp">News & Events</a></li>
				<li <c:if test="${active eq 'orders'}"> class="active"</c:if>><a href="orders.jsp">Orders</a></li>
				<li <c:if test="${active eq 'feedback'}"> class="active"</c:if> ><a href="feedback.jsp" >Feedback</a></li>
				<li <c:if test="${active eq 'users'}"> class="active"</c:if> ><a href="users.jsp" >Users</a></li>
			</ul>
			<form action="AdminLogin" method="post">
				<input type="hidden" name="action" value="logout" />
				<p class="navbar-text navbar-right">Signed in as <a href="user.jsp?id=${user.id}">${user.fullName}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<button class="btn-primary" style="border: none;">Logout</button></p>
			</form>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>