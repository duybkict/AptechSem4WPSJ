<%--
    Document   : contacts
    Created on : Feb 16, 2014, 5:55:01 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="Success | GoodCook" />
	</jsp:include>

    <body>
        <jsp:include page="layout/navigation.jsp"></jsp:include>

			<div class="container content" >
				<div class="row padding">
					<div class="col-xs-8">
						<div style="min-height: 383px">
						<c:set var="action" value="${param.action}" />
						<c:choose>
							<c:when test='${action eq "contacts"}'>
								<h3>Message sent successfully !!</h3>
							</c:when>

							<c:when test='${action eq "register"}'>
								<h3>Account registered successfully !!</h3>
							</c:when>

							<c:when test='${action eq "login"}'>
								<c:if test="${empty sessionScope.loginUser}">
									<c:redirect url="members.jsp" />
								</c:if>

								<h3>Welcome, <c:out value="${sessionScope.loginUser.fullName}" /></h3>
							</c:when>

							<c:when test='${action eq "checkout"}'>
								<h3>Checkout successfully !!</h3>
								<p>We will contact you soon for blah blah blah.</p>
							</c:when>

							<c:otherwise>
								<c:redirect url="index.jsp" />
							</c:otherwise>
						</c:choose>

						<p>Lorem ipsum dolor <a href="index.jsp">GoodCook</a> sit amet, consectetur adipiscing elit. Suspendisse fermentum ipsum vel ligula condimentum, a facilisis nisl adipiscing. Phasellus dui elit, <a href="courses.jsp">latest courses</a> porttitor in pulvinar porta, congue varius risus.</p>
						<p>Proin other <a href="articles.jsp">News & Events</a> aliquet massa vel mauris ultricies, vehicula accumsan ipsum auctor.</p>
						<p>Quisque quis nibh sed lacus vulputate dictum. Cras rutrum, turpis in consectetur placerat, magna purus sagittis mauris, non posuere nulla ipsum non lectus. Ut leo neque, pellentesque et pulvinar non, rutrum a risus. Nullam ultricies quam non cursus congue. Sed ullamcorper lacus vitae enim scelerisque ultricies. Aenean molestie quis lacus at mattis. Vivamus molestie facilisis velit, ut imperdiet nibh. </p>

					</div>

					<div class="clearfix"></div>

					<div class="bg padding about-bg-row">
						<h3>Miscellaneous info</h3>
						<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.</p>
					</div>
				</div>

				<div class="col-xs-4">
					<h3>Our contacts</h3>
					<hr />

					<address>
						<strong>USA</strong><br>
						8901 Marmora Road, Glasgow, D04<br/>
						<span>Telephone:</span> +1 959 603 6035<br/>
						<span>FAX:</span> +1 504 889 9898<br/>
						<span>E-mail:</span> <a href="mailto:usa@goodcook.com">usa@goodcook.com</a>
					</address>

					<address>
						<strong>Canada</strong><br>
						8901 Marmora Road, Glasgow, D04<br/>
						<span>Telephone:</span> +1 959 603 6035<br/>
						<span>FAX:</span> +1 504 889 9898<br/>
						<span>E-mail:</span> <a href="mailto:canada@goodcook.com">canada@goodcook.com</a>
					</address>

					<address>
						<strong>Great Britain</strong><br>
						8901 Marmora Road, Glasgow, D04<br/>
						<span>Telephone:</span> +1 959 603 6035<br/>
						<span>FAX:</span> +1 504 889 9898<br/>
						<span>E-mail:</span> <a href="mailto:uk@goodcook.com">uk@goodcook.com</a>
					</address>

					<address>
						<strong>Japan</strong><br>
						8901 Marmora Road, Glasgow, D04<br/>
						<span>Telephone:</span> +1 959 603 6035<br/>
						<span>FAX:</span> +1 504 889 9898<br/>
						<span>E-mail:</span> <a href="mailto:jp@goodcook.com">jp@goodcook.com</a>
					</address>
				</div>

			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />
    </body>
</html>
