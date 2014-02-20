<%--
    Document   : contacts
    Created on : Feb 16, 2014, 5:55:01 PM
    Author     : Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
    <jsp:include page="layout/head.jsp">
		<jsp:param name="title" value="Contacts | GoodCook" />
	</jsp:include>

    <body>
        <jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="contacts" />
		</jsp:include>

		<div class="container content" >
			<div class="row padding">
				<div class="col-xs-8">
					<div>
						<h3>Contact form</h3>
						<form class="form-horizontal">
							<div class="form-group">
								<label for="fullname" class="col-xs-2 control-label">Full Name:</label>
								<div class="col-xs-7">
									<input type="text" class="form-control input-sm" id="fullname" >
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-xs-2 control-label">Email:</label>
								<div class="col-xs-7">
									<input type="email" class="form-control input-sm" id="email" >
								</div>
							</div>
							<div class="form-group">
								<label for="message" class="col-xs-2 control-label">Message:</label>
								<div class="col-xs-10">
									<textarea class="form-control input-sm" id="message" rows="10" ></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-xs-offset-2 col-xs-10">
									<button type="submit" class="btn btn-primary">Send</button>
									<button type="reset" class="btn btn-default">Clear</button>
								</div>
							</div>
						</form>
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
