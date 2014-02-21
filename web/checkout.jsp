<%--
    Document   : contacts
    Created on : Feb 16, 2014, 5:55:01 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/datacontext.tld" prefix="datacontext"%>
<%@taglib uri="/WEB-INF/tlds/regex.tld" prefix="regex"%>
<!DOCTYPE html>

<html>
    <jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="Checkout | GoodCook" />
	</jsp:include>

    <body>
        <jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="checkout" />
		</jsp:include>

		<div class="container content" >
			<div class="row padding">
				<div class="col-xs-8">
					<div style="min-height: 383px">
						<h3>Shopping Cart</h3>

						<table class="table table-condensed table-cart">
							<thead>
								<tr>
									<th>Course</th>
									<th>Price</th>
									<th>Number</th>
									<th>Subtotal</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										Larry the Bird<br />
									</td>
									<td>$350.0</td>
									<td>2</td>
									<td>$700.0</td>
									<td>
										<a href="">Remove</a>
									</td>
								</tr>
								<tr>
									<td>
										Larry the Bird<br />
									</td>
									<td>$350.0</td>
									<td>2</td>
									<td>$700.0</td>
									<td>
										<a href="">Remove</a>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="5"><br/><br/><a href="courses.jsp" style="font-size: 12px;">&Lt; Go back to shopping</a></td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>

				<div class="col-xs-4">
					<div class="bg padding box-total" >
						<h3 class="pull-left">Total</h3>
						<span class="total pull-right">$1000.25</span>

						<div class="clearfix"></div>
						<hr />

						<c:set var="user" value="${sessionScope.loginUser}" />

						<c:choose>
							<c:when test="${not empty user}" >
								<table>
									<tr>
										<td style="width: 90px;"><strong>Full Name</strong></td>
										<td>${user.fullName}</td>
									</tr>
									<tr>
										<td><strong>Email</strong></td>
										<td>${user.email}</td>
									</tr>
								</table>
								<br/>
								<button class="btn btn-orange btn-lg"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;Checkout</button>
							</c:when>
						</c:choose>
					</div>
				</div>

			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />
    </body>
</html>
