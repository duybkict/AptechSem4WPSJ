<%--
    Document   : order
    Created on : Feb 25, 2014, 11:29:12 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="/WEB-INF/tlds/admindatacontext.tld" prefix="datacontext" %>
<!DOCTYPE html>

<c:set var="id" value="${param.id}" />
<c:if test="${empty id}"><c:redirect url="orders.jsp?error=update" /></c:if>

<c:set var="order" value="${datacontext:getOrderById(id)}" />
<c:if test="${empty order}"><c:redirect url="orders.jsp?error=update" /></c:if>

	<html>
    <jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="Edit Order | Administrator" />
	</jsp:include>

    <body>
		<jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="orders" />
		</jsp:include>

		<div class="container content">
			<div class="col-xs-12">
				<h3>Edit Order</h3>

				<form class="form-horizontal col-xs-6" action="AdminOrders" method="post">
					<div class="form-group">
						<label class="col-xs-3 control-label">ID</label>
						<div class="col-xs-9">
							<p class="form-control-static">${order.id}</p>
							<input type="hidden" name="id" value="${order.id}">
							<input type="hidden" name="action" value="update">
						</div>
					</div>
					<div class="form-group">
						<label for="status" class="col-xs-3 control-label">Status</label>
						<div class="col-xs-9">
							<select name="status" id="status" class="form-control">
								<option value="1" <c:if test="${order.status eq 1}">selected="selected"</c:if> >Pending</option>
								<option value="2" <c:if test="${order.status eq 2}">selected="selected"</c:if> >Confirmed</option>
								<option value="3" <c:if test="${order.status eq 3}">selected="selected"</c:if> >Canceled</option>
							</select>
						</div>
						</div>
						<div class="form-group">
							<div class="col-xs-offset-3 col-xs-10">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a href="orders.jsp" class="btn btn-default">Cancel</a>
							</div>
						</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>
