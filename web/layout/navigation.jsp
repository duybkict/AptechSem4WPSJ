<%--
    Document   : navigation
    Created on : Feb 16, 2014, 5:41:02 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="active" value="${param.active}" />

<header role="banner">
	<div class="container">
		<div class="row">
			<h1><a href="index.html">GoodCook</a></h1>
			<span class="navigation-control">
				<a href="members.jsp">Register</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="members.jsp">Sign In</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
				<a href="#" style="width: 145px; display: inline-block; text-align: right">
					<span class="glyphicon glyphicon-shopping-cart"></span>
					Shopping Cart (0)
				</a>
			</span>
		</div>
	</div>
</header>
<nav class="navbar navbar-collapse" role="navigation">
	<div class="container">
		<div class="row">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp" <c:if test="${active eq 'index'}"> class="active"</c:if> >Main</a></li>
				<li><a href="about.jsp" <c:if test="${active eq 'about'}"> class="active"</c:if> >About Us</a></li>
				<li><a href="courses.jsp" <c:if test="${active eq 'courses'}"> class="active"</c:if> >Courses</a></li>
				<li><a href="articles.jsp" <c:if test="${active eq 'articles'}"> class="active"</c:if> >News & Events</a></li>
				<li><a href="contacts.jsp" <c:if test="${active eq 'contacts'}"> class="active"</c:if> >Contacts</a></li>
			</ul>
		</div>
	</div>
</nav>