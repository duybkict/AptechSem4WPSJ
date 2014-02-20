<%--
    Document   : about
    Created on : Feb 16, 2014, 5:55:01 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="datacontext" uri="/WEB-INF/tlds/datacontext.tld" %>
<!DOCTYPE html>

<html>
	<jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="Article Not Found | GoodCook" />
	</jsp:include>

    <body>
        <jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="articles" />
		</jsp:include>

		<div class="container content" >
			<div class="row padding">
				<div class="col-xs-8">
					<div>
						<h3>Article Not Found !!</h3>
						<p>Lorem ipsum dolor <a href="index.jsp">GoodCook</a> sit amet, consectetur adipiscing elit. Suspendisse fermentum ipsum vel ligula condimentum, a facilisis nisl adipiscing. Phasellus dui elit, <a href="contacts.jsp">send us email</a> porttitor in pulvinar porta, congue varius risus.</p>
						<p>Proin other <a href="articles.jsp">News & Events</a> aliquet massa vel mauris ultricies, vehicula accumsan ipsum auctor.</p>
					</div>
				</div>

				<div class="col-xs-4">
					<h3>What May Interest You</h3>
					<hr />

					<c:forEach var="article" items="${datacontext:getRandomArticles(4)}">
						<c:set var="link" value="#" />
						<strong>${article.title}</strong>
							${article.shortDescription}
						<a href="${link}" class="pull-right">Read more</a>
						<br/>
						<br/>
					</c:forEach>

					<a href="#" class="center-block">
						<img alt="" src="images/banner-1.jpg" style="display: block; width: 100%;"/>
					</a>
				</div>

			</div>
		</div>

		<jsp:include page="layout/footer.jsp" />
    </body>
</html>
