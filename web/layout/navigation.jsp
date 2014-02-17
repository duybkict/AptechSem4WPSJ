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
			<ul class="list-social">
				<li>Link to Us:</li>
				<li><a title="facebook" href="#"></a></li>
				<li><a title="twitter" href="#"></a></li>
				<li><a title="linkedin" href="#"></a></li>
			</ul>
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
				<li><a href="events.jsp" <c:if test="${active eq 'events'}"> class="active"</c:if> >News & Events</a></li>
				<li><a href="contacts.jsp" <c:if test="${active eq 'contacts'}"> class="active"</c:if> >Contacts</a></li>
			</ul>
		</div>
	</div>
</nav>