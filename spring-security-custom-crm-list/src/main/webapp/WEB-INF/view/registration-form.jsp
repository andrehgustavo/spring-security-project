<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>New User</title>

<!-- Biblioteca Bootstrap. -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- Importando CSS -->
<link type="text/css" href="<c:url value='../assets/css/mdb.min.css' />"
	rel="stylesheet" />
<link type="text/css" href="<c:url value='../assets/css/mystyle.css' />"
	rel="stylesheet" />
<link type="text/css"
	href="<c:url value='../assets/css/open-iconic-master/font/css/open-iconic-bootstrap.css"' />"
	rel="stylesheet">

<!-- Importando JS -->
<script src="<c:url value='../assets/js/multi-select/multiselect.js' />"></script>
<script src="<c:url value='../assets/js/multi-select/myjs.js' />"></script>

</head>

<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top md7-color">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
				src="<c:url value='../assets/images/logo-base-color.png' />"
				height="100"></a>
		</nav>
		<br>
	</header>

	<main>
		<section id="login">
			<div id="md7-externa">

				<div id="md7-interna"
					style="margin-top: 150px; margin-bottom: 100px;"
					class="mainbox col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-lg-4 col-xl-4">

					<div class="md7-panel">

						<div class="md7-panel-heading">
							<div>Register New User</div>
						</div>

						<div style="padding-top: 30px" class="md7-panel-body">




							<!-- Registration Form -->
							<form:form
								action="${pageContext.request.contextPath}/register/processRegistrationForm"
								modelAttribute="crmUser" class="form-horizontal">

								<!-- need to associate this data with customer id -->
								<form:hidden path="id" />

								<!-- Place for messages: error, alert etc ... -->
								<div class="form-group">
									<div class="col-xs-15">
										<div>

											<!-- Check for registration error -->
											<c:if test="${registrationError != null}">

												<div class="alert alert-danger col-xs-offset-1 col-xs-10">
													${registrationError}</div>

											</c:if>

										</div>
									</div>
								</div>

								<!-- User name -->
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="oi oi-person"></i></span>
									</div>
									<form:input path="userName" placeholder="username (*)"
										class="form-control" />
								</div>
								<div class="error mb-3">
									<form:errors path="userName" />
								</div>




								<!-- Password -->
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="oi oi-lock-locked"></i></span>
									</div>
									<form:password path="password" placeholder="password (*)"
										class="form-control" />
								</div>
								<div class="error mb-3">
									<form:errors path="password" />
								</div>




								<!-- Confirm Password -->
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="oi oi-lock-locked"></i></span>
									</div>
									<form:password path="matchingPassword"
										placeholder="confirm password (*)" class="form-control" />
								</div>
								<div class="error mb-3">
									<form:errors path="matchingPassword" />
								</div>



								<!-- First name -->
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="oi oi-person"></i></span>
									</div>
									<form:input path="firstName" placeholder="first name (*)"
										class="form-control" />
								</div>
								<div class="error mb-3">
									<form:errors path="firstName" />
								</div>



								<!-- Last name -->
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="oi oi-person"></i></span>
									</div>

									<form:input path="lastName" placeholder="last name (*)"
										class="form-control" />
								</div>
								<div class="error mb-3">
									<form:errors path="lastName" />
								</div>


								<!-- Email -->
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="oi oi-envelope-closed"></i></span>
									</div>
									<form:input path="email" placeholder="email (*)"
										class="form-control" />
								</div>
								<div class="error mb-3">
									<form:errors path="email" />
								</div>

								<!-- Role Table -->
								<security:authorize access="hasRole('ADMIN')">
									<table>										
										<tr>
											<td>Roles :</td>
											<td><form:checkboxes path="formRoles" id="formRoles" items="${roleList}" itemLabel="name" itemValue="name"  element="div"/>
											<input type="hidden" name="ROLE_" value="on"></td>
											<td><form:errors path="formRoles" cssClass="error" /></td>
										</tr>
										

									</table>

								</security:authorize>

								<!-- Register Button -->
								<div id="md7-interna" style="margin-top: 10px"
									class="form-group">
									<div class="col-sm-6 controls">
										<button type="submit" class="button md7-button">Register</button>
									</div>
								</div>

							</form:form>
						</div>

					</div>

				</div>

			</div>

		</section>
	</main>

	<footer class="page-footer font-small pt-4 set-footer md7-color">
		<div class="footer-copyright text-center py-3">
			© 2020 Copyright: <a href=""> André Gustavo Barros - All Rights
				Reserved</a>
		</div>
	</footer>


</body>

</html>