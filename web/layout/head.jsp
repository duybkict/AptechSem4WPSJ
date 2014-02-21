<%--
    Document   : layout_head
    Created on : Feb 16, 2014, 5:38:58 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${param.title == null}">
		<c:set var="title" value="GoodCook" />
	</c:when>

	<c:otherwise>
		<c:set var="title" value="${param.title}" />
	</c:otherwise>
</c:choose>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><c:out value="${title}" /></title>

	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap-glyphicon.min.css" type="text/css" />
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
	<link rel='stylesheet' href='css/font-lobster.css' type='text/css'>
	<link rel='stylesheet' href='css/font-myriadpro.css' type='text/css'>
</head>

<script src="js/jquery-1.6.3.min.js" type="text/javascript"></script>
<script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="js/tms-0.3.js" type="text/javascript"></script>
<script src="js/tms_presets.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$.noConflict();
</script>
