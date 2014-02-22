<%--
    Document   : navigation
    Created on : Feb 16, 2014, 5:41:02 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="active" value="${param.active}" />
<c:set var="user" value="${sessionScope.loginUser}" />

<header role="banner">
	<div class="container">
		<div class="row">
			<h1><a href="index.html">GoodCook</a></h1>
			<span class="navigation-control">
				<c:choose>
					<c:when test="${empty user}">
						<a href="members.jsp">Register</a>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<a href="members.jsp">Sign In</a>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					</c:when>
					<c:otherwise>
						Hello, ${user.fullName}
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<a href="#" onclick="jQuery('#form_logout').submit()">Sign Out</a>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					</c:otherwise>
				</c:choose>

				<a href="checkout.jsp" style="width: 145px; display: inline-block; text-align: right">
					<span class="glyphicon glyphicon-shopping-cart"></span>
					<c:choose>
						<c:when test="${empty sessionScope.shoppingCartSize}">
							<c:set var="cartSize" value="0" />
						</c:when>
						<c:otherwise>
							<c:set var="cartSize" value="${sessionScope.shoppingCartSize}" />
						</c:otherwise>
					</c:choose>
					Shopping Cart (${cartSize})
				</a>
			</span>
			<div class="navigation-search">
				<form class="form-inline">
					<div class="input-group input-group-sm">
						<input type="text" class="form-control" name="search" id="input-search" placeholder="Search our site">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
</header>
<nav class="navbar navbar-collapse" role="navigation">
	<div class="container">
		<div class="row">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp" <c:if test="${active eq 'index'}"> class="active"</c:if> >Home</a></li>
				<li><a href="about.jsp" <c:if test="${active eq 'about'}"> class="active"</c:if> >About Us</a></li>
				<li><a href="courses.jsp" <c:if test="${active eq 'courses'}"> class="active"</c:if> >Courses</a></li>
				<li><a href="articles.jsp" <c:if test="${active eq 'articles'}"> class="active"</c:if> >News & Events</a></li>
				<li><a href="contacts.jsp" <c:if test="${active eq 'contacts'}"> class="active"</c:if> >Contacts</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<form id="form_logout" style="display:hidden" action="Login" method="post">
		<input type="hidden" name="url" value="${pageContext.request.requestURL}?${pageContext.request.queryString}" />
	<input type="hidden" name="action" value="logout" />
</form>