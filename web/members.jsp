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
		<jsp:param name="title" value="Contacts | GoodCook" />
	</jsp:include>

    <body>
        <jsp:include page="layout/navigation.jsp">
			<jsp:param name="active" value="members" />
		</jsp:include>

		<c:if test="${pageContext.request.method eq 'POST'}">
			<c:set var="fullname" value="${param.fullname}" />
			<c:set var="email" value="${param.email}" />
			<c:set var="password" value="${param.password}" />
			<c:set var="repassword" value="${param.repassword}" />
			<c:set var="message" value="${param.message}" />
			<c:set var="acceptterm" value="${param.acceptterm}" />
			<c:set var="hasErrors" value="false" />
		</c:if>

		<c:set var="errorLogin" value="${param.errorLogin}" />

		<c:set var="regexEmail" value="(?:(?:\\r\\n)?[ \\t])*(?:(?:(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*))*@(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*|(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*)*\\<(?:(?:\\r\\n)?[ \\t])*(?:@(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*(?:,@(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*)*:(?:(?:\\r\\n)?[ \\t])*)?(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*))*@(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*\\>(?:(?:\\r\\n)?[ \\t])*)|(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*)*:(?:(?:\\r\\n)?[ \\t])*(?:(?:(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*))*@(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*|(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*)*\\<(?:(?:\\r\\n)?[ \\t])*(?:@(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*(?:,@(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*)*:(?:(?:\\r\\n)?[ \\t])*)?(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*))*@(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*\\>(?:(?:\\r\\n)?[ \\t])*)(?:,\\s*(?:(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*))*@(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*|(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*)*\\<(?:(?:\\r\\n)?[ \\t])*(?:@(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*(?:,@(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*)*:(?:(?:\\r\\n)?[ \\t])*)?(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\"(?:[^\\\"\\r\\\\]|\\\\.|(?:(?:\\r\\n)?[ \\t]))*\"(?:(?:\\r\\n)?[ \\t])*))*@(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*)(?:\\.(?:(?:\\r\\n)?[ \\t])*(?:[^()<>@,;:\\\\\".\\[\\] \\000-\\031]+(?:(?:(?:\\r\\n)?[ \\t])+|\\Z|(?=[\\[\"()<>@,;:\\\\\".\\[\\]]))|\\[([^\\[\\]\\r\\\\]|\\\\.)*\\](?:(?:\\r\\n)?[ \\t])*))*\\>(?:(?:\\r\\n)?[ \\t])*))*)?;\\s*)" />

		<div class="container content" >
			<div class="row padding">
				<div class="col-xs-6">
					<div style="height: 383px">
						<h3>Register for new account</h3>

						<c:if test="${pageContext.request.method eq 'POST'}">
							<div class="alert alert-danger">
								<ul>
									<c:if test="${empty fullname}" >
										<li><label for="fullname"><strong>Full Name</strong> must not be left blank.</label></li>
										<c:set var="hasErrors" value="true" />
									</c:if>

									<c:choose>
										<c:when test="${empty email}" >
											<li><label for="email"><strong>Email</strong> must not be left blank.</label></li>
											<c:set var="hasErrors" value="true" />
										</c:when>
										<c:otherwise>
											<c:if test="${not regex:matches(regexEmail, email)}" >
											<li><label for="email"><strong>Email</strong> is not valid.</label></li>
												<c:set var="hasErrors" value="true" />
											</c:if>
										</c:otherwise>
									</c:choose>

									<c:if test="${empty password}" >
										<li><label for="password"><strong>Password</strong> must not be left blank.</label></li>
										<c:set var="hasErrors" value="true" />
									</c:if>

									<c:choose>
										<c:when test="${empty repassword}" >
											<li><label for="repassword">You must confirm your <strong>password</strong>.</label></li>
											<c:set var="hasErrors" value="true" />
										</c:when>
										<c:otherwise>
											<c:if test="${password ne repassword}" >
												<li><label for="password"><strong>Passwords</strong> mismatch.</label></li>
												<c:set var="hasErrors" value="true" />
											</c:if>
										</c:otherwise>
									</c:choose>

									<c:if test="${empty acceptterm || acceptterm ne true}" >
										<li><label>You must accept our <strong>Terms and Conditions</strong> to create new account.</label></li>
										<c:set var="hasErrors" value="true" />
									</c:if>
								</ul>
							</div>
						</c:if>

						<c:if test="${hasErrors eq false}">
							<c:redirect url="contacts_success.jsp" />
						</c:if>

							<form class="form-horizontal" action="members.jsp" method="post">
								<div class="form-group">
									<label for="fullname" class="col-xs-3 control-label">Full Name</label>
									<div class="col-xs-8">
										<input type="text" class="form-control input-sm" id="fullname" name="fullname" value="<c:if test="${not empty fullname}" >${fullname}</c:if>" />
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="col-xs-3 control-label">Email</label>
									<div class="col-xs-8">
										<input type="email" class="form-control input-sm" id="email" name="email" value="<c:if test="${not empty email}" >${email}</c:if>" >
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-xs-3 control-label">Password</label>
									<div class="col-xs-8">
										<input type="password" class="form-control input-sm" id="password" name="password" value="<c:if test="${not empty password}" >${password}</c:if>" />
									</div>
								</div>
								<div class="form-group">
									<label for="repassword" class="col-xs-3 control-label">Confirm</label>
									<div class="col-xs-8">
										<input type="password" class="form-control input-sm" id="repassword" name="repassword" value="<c:if test="${not empty repassword}" >${repassword}</c:if>" />
									</div>
								</div>
								<div class="checkbox">
									<label>
										<input type="checkbox" name="acceptterm" value="true" <c:if test="${acceptterm eq true}" >checked="checked"</c:if> /> I have read and agree to the terms of GoodCook International.
									</label>
								</div>
								<br/>
								<div class="form-group">
									<div class="col-xs-offset-3 col-xs-8">
										<button type="submit" class="btn btn-primary">Register New</button>
										<button type="reset" class="btn btn-default">Clear</button>
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="col-xs-6">
						<div style="border-left: 1px solid #D4D1CB; margin-left: -24px; padding-left: 24px;">
							<h3>Sign in</h3>

							<c:if test="${errorLogin eq true}">
							<div class="alert alert-danger">
								<ul>
									<li><label for="email_signin"><strong>Login failed</strong> due to wrong email or password.</label></li>
								</ul>
							</div>
							</c:if>

							<form class="form-horizontal" action="contacts.jsp" method="post">
								<div class="form-group">
									<label for="email_signin" class="col-xs-3 control-label">Email</label>
									<div class="col-xs-8">
										<input type="email" required="required" class="form-control input-sm" id="email_signin" name="email_signin" value="<c:if test="${not empty email}" >${email}</c:if>" >
									</div>
								</div>
								<div class="form-group">
									<label for="password_signin" class="col-xs-3 control-label">Password</label>
									<div class="col-xs-8">
										<input type="password" required="required" class="form-control input-sm" id="password_signin" name="password_signin" value="<c:if test="${not empty fullname}" >${fullname}</c:if>" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-offset-3 col-xs-8">
										<button type="submit" class="btn btn-primary" disabled="disabled">Sign In</button>
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
				</div>
			</div>

		<jsp:include page="layout/footer.jsp" />
    </body>
</html>
