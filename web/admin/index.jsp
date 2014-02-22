<%--
    Document   : index
    Created on : Feb 22, 2014, 11:20:34 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="Login | Administrator" />
	</jsp:include>

    <body>
		<div class="container">
			<div class="" style="float: none; width: 400px; margin: 80px auto;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Administrator Login</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" action="AdminLogin" method="post">
							<c:if test="${param.errorLogin eq true}">
							<div class="alert alert-danger">
								<ul>
									<li><label for="email"><strong>Login failed</strong> due to invalid email or password.</label></li>
								</ul>
							</div>
							</c:if>
							<div class="form-group">
								<label for="email" class="col-xs-3 control-label">Email</label>
								<div class="col-xs-9">
									<input type="text" class="form-control" id="email" name="email">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-xs-3 control-label">Password</label>
								<div class="col-xs-9">
									<input type="password" class="form-control" id="password" name="password" />
								</div>
							</div>
							<div class="form-group">
								<div class="pull-right" style="margin-right: 15px;">
									<input type="hidden" name="action" value="login" />
									<button type="submit" class="btn btn-primary" >Log In</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

    </body>
</html>
