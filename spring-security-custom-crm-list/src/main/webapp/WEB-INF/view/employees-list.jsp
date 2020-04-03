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
<link type="text/css" href="<c:url value='../assets/css/mdb.min.css' />"
	rel="stylesheet" />
<link type="text/css" href="<c:url value='../assets/css/mystyle.css' />"
	rel="stylesheet" />

</head>

<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top md7-color">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
				src="<c:url value='../assets/images/logo-base-color.png' />"
				height="100"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<!-- display user name--> <a class="nav-link scroll" href="">
							User: <security:authentication property="principal.username" />
							|
					</a> |
					</li>
					<li class="nav-item">
						<!-- display user role --> <a class="nav-link scroll" href="">
							Role(s): <security:authentication
								property="principal.authorities" />
					</a>
					</li>
					<li><form:form
							action="${pageContext.request.contextPath}/logout" method="POST">
							<input type="submit" value="Logout" />
						</form:form></li>
				</ul>
			</div>

		</nav>
		<br>
	</header>

	<main>
		<div id="md7-externa" class="md7-margin">

			<div id="md7-interna">

				<h2 class="md7-welcome">Employees List</h2>
				<hr>
				<p>This area is exclusive for MD7 system administrators.</p>

				<!-- Adicionando tabela com os usuários -->
				<div id="container">

					<div id="content">

						<!-- put new button: Add Customer -->

						<input type="button" value="Add Customer"
							onclick="window.location.href='showFormForAdd'; return false;"
							class="md7-button" />

						<!--  add our html table here -->

						<table class="table table-striped">
							<thead class="md7-thead">
								<tr>
									<th style="font-weight: bold;">First Name</th>
									<th>Last Name</th>
									<th>Email</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<!-- loop over and print our customers -->
								<c:forEach var="tempUsers" items="${users}">

									<!-- construct an "update" link with customer id -->
									<c:url var="updateLink" value="/systems/showFormForUpdate">
										<c:param name="userId" value="${tempUsers.id}" />
									</c:url>

									<!-- construct an "delete" link with customer id -->
									<c:url var="deleteLink" value="/systems/delete">
										<c:param name="userId" value="${tempUsers.id}" />
									</c:url>

									<tr>
										<td>${tempUsers.firstName}</td>
										<td>${tempUsers.lastName}</td>
										<td>${tempUsers.email}</td>

										<td>
											<!-- display the update link --> <a href="${updateLink}">Update</a>
											| <a href="${deleteLink}"
											onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
										</td>

									</tr>

								</c:forEach>
							</tbody>
						</table>

					</div>

				</div>
				
				<p>
					<a href="${pageContext.request.contextPath}/employees">Back to
						Home Page</a>
				</p>
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