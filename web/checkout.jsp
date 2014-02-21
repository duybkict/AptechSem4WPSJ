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

		<c:set var="user" value="${sessionScope.loginUser}" />
		<c:set var="shoppingCart" value="${sessionScope.shoppingCart}" />

		<div class="container content" >
			<div class="row padding">
				<div class="col-xs-8">
					<div style="min-height: 383px">
						<h3>Shopping Cart</h3>

						<c:choose>
							<c:when test="${not empty shoppingCart}">
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
										<c:set var="totalPrice" value="0" />
										<c:forEach var="id" items="${shoppingCart.keySet()}">
											<c:set var="item" value="${datacontext:getArticleById(id)}" />
											<c:set var="itemnum" value="${shoppingCart.get(id)}" />
											<c:set var="totalPrice" value="${totalPrice + item.price * itemnum}" />
											<tr>
												<td>${item.title}</td>
												<td>&dollar;${item.price}</td>
												<td>
													<form id="form-update-${id}" action="ShoppingCart" method="post">
														<input type="hidden" name="itemid" value="${id}" />
														<input type="hidden" name="action" value="update" />
														<input type="hidden" id="input-itemnum-${id}" name="itemnum" value="${itemnum}" />
														<select id="select-itemnum-${id}">
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
															<option value="6">6</option>
															<option value="7">7</option>
															<option value="8">8</option>
															<option value="9">9</option>
															<option value="10">10</option>
														</select>
													</form>
													<script type="text/javascript">
														var selectBox = '#select-itemnum-${id}';

														jQuery(selectBox).val(${itemnum});
														jQuery(selectBox).change(function() {
															jQuery('#input-itemnum-${id}').val(jQuery(this).val());
															jQuery('#form-update-${id}').submit();
														});
													</script>
												</td>
												<td>&dollar;${item.price * itemnum}</td>
												<td>
													<form id="form-delete-${id}" action="ShoppingCart" method="post">
														<input type="hidden" name="item-price-${id}" value="${item.price}" />
														<input type="hidden" name="itemid" value="${id}" />
														<input type="hidden" name="action" value="delete" />
														<a href="#" onclick="jQuery('#form-delete-${id}').submit()" >Remove</a>
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<br/><a href="courses.jsp" style="font-size: 12px;">&Lt; Continue shopping</a>
							</c:when>
							<c:otherwise>
								Cart is empty. You might want to <a href="courses.jsp" style="font-size: 12px;">go back to shopping.</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="col-xs-4">
					<div class="bg padding box-total" >
						<c:choose>
							<c:when test="${not empty user}" >
								<h3 class="pull-left">Total</h3>
								<span class="total pull-right">&dollar;${totalPrice}</span>

								<div class="clearfix"></div>
								<hr />

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
								<form action="ShoppingCart" method="post">
									<input type="hidden" name="itemid" value="0" />
									<input type="hidden" name="action" value="checkout" />
									<button class="btn btn-orange btn-lg"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;Checkout</button>
								</form>
							</c:when>
							<c:otherwise>
								<h3 class="pull-left">Total</h3>
								<span class="total pull-right">$0</span>
								<div class="clearfix"></div>
								<hr />
								You have to <a href="members.jsp">Sign In</a> first if you want to Checkout<br/>
								Don't have an account yet? <a href="members.jsp">Create one</a>.
								<br/>
								<button class="btn btn-orange btn-lg" disabled="disabled"><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;Checkout</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />
    </body>
</html>
