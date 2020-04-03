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

</head>

<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top md7-color">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
				src="<c:url value='assets/images/logo-base-color.png' />"
				height="100"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link scroll"
						href="${pageContext.request.contextPath}/employees">Login</a></li>
					<li class="nav-item"><a class="nav-link scroll"
						href="${pageContext.request.contextPath}/cadastro">Cadastro</a></li>
				</ul>
			</div>
		</nav>
		<br>
	</header>

	<main>
		<div id="md7-externa" class="md7-margin">

			<div id="md7-interna">

				<h2 class="md7-welcome">Access Denied - You are not authorized
					to access this resource.</h2>

				<hr>

				<a href="${pageContext.request.contextPath}/">Back to home page.</a>
			</div>
		</div>
	</main>

	<footer class="page-footer font-small pt-4 set-footer md7-color">
		<div class="footer-copyright text-center py-3">
			© 2020 Copyright: <a href=""> André Gustavo Barros - All Rights
				Reserved</a>
		</div>
	</footer>


</body>

</html>