<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MD7 Engenharia</title>

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
<link type="text/css" href="<c:url value='assets/css/mdb.min.css' />"
	rel="stylesheet" />
<link type="text/css" href="<c:url value='assets/css/mystyle.css' />"
	rel="stylesheet" />
<link type="text/css"
	href="<c:url value='assets/css/open-iconic-master/font/css/open-iconic-bootstrap.css"' />"
	rel="stylesheet">

</head>

<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top md7-color">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
				src="<c:url value='assets/images/logo-base-color.png' />"
				height="100"></a>
		</nav>
		<br>
	</header>

	<main>
		<section id="login">
			<div id="md7-externa">

				<div id="md7-interna" style="margin-top: 150px; margin-bottom: 100px;"
					class="mainbox col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-lg-4 col-xl-4">

					<div class="md7-panel">

						<div class="md7-panel-heading">
							<div>Sign In</div>
						</div>

						<div style="padding-top: 30px" class="md7-panel-body">

							<!-- Login Form -->
							<form:form
								action="${pageContext.request.contextPath}/authenticateTheUser"
								method="POST" class="form-horizontal">

								<!-- Place for messages: error, alert etc ... -->
								<div class="form-group">
									<div class="col-xs-15">
										<div>

											<!-- Check for login error -->

											<c:if test="${param.error != null}">

												<div class="alert alert-danger col-xs-offset-1 col-xs-10">
													Invalid username and password.</div>

											</c:if>

											<!-- Check for logout -->

											<c:if test="${param.logout != null}">

												<div class="alert alert-success col-xs-offset-1 col-xs-10">
													You have been logged out.</div>

											</c:if>

										</div>
									</div>
								</div>

								<!-- User name -->
								<div style="margin-bottom: 25px" class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="oi oi-person"></i></span>
									</div>
									<input type="text" name="username" placeholder="username"
										class="form-control">
								</div>


								<!-- Password -->
								<div style="margin-bottom: 25px" class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="oi oi-lock-locked"></i></span>
									</div>
									<input type="password" name="password" placeholder="password"
											class="form-control">
								</div>								
								

								<!-- Login/Submit Button -->
								<div id="md7-interna" class="form-group">
									<div class="col-sm-6 controls">
										<button type="submit" class="button md7-button">Login</button>
									</div>
								</div>

								<!-- I'm manually adding tokens ... Bro! -->

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />

							</form:form>

						</div>

					</div>
					<div class="button md7-button-a">
						<a
							href="${pageContext.request.contextPath}/register/showRegistrationForm"
							role="button" aria-pressed="true">Register New User</a>
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