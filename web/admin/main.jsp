<%--
    Document   : main
    Created on : Feb 22, 2014, 11:20:34 AM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="Administrator" />
	</jsp:include>

    <body>
		<jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="" />
		</jsp:include>

		<div class="container content" style="height:400px">
			<div class="col-xs-12">
				<h3>Administrator</h3>
			</div>
		</div>

    </body>
</html>
