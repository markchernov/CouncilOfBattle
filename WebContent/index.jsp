<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>





<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>Info</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<title>Classroom Helper</title>

<!-- CSS  -->





<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="css/animate.css" type="text/css" rel="stylesheet" />


<!-- JS  -->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/materialize.js"></script>
<script src="js/init.js"></script>


</head>


<body>


	<header>

		<nav>
			<div class="nav-wrapper deep-purple">
				<a href="#" class="brand-logo center">Classroom Helper </a>
				<ul id="nav-mobile" class="left hide-on-med-and-down">
					<li><a href=index.jsp>Home</a></li>
					<li><a href="index.jsp">About</a></li>
					<li><a href="index.jsp">Help</a></li>
				</ul>
			</div>
		</nav>

	</header>




	<main class="main">

	<div class="row">
		<div class="col s12 m12">
			<div class="card grey darken-1">
				<div class="card-content white-text">
					<span class="card-title"> Help Menu</span>



					<div class="card-action">

						<form action="GetUser.do" method="GET" class="myForm">

							<div class="row">
								<div class="input-field col s12">
									<input value="Click the SELECT button to see the USER #1" id="select" type="text"
										class="validate" name="input"> <label class="active"
										for="first_name2">Click the SELECT button to see the USER #1:</label>
										
										<p> ${user} </p>
								</div>
							</div>



							<button class="btn waves-effect waves-light deep-purple"
								type="submit">
								SELECT <i class="material-icons right">launch</i>
							</button>


						</form>

					</div>

                    <div class="card-action">

						<form action="SetUser.do" method="GET" class="myForm">

							<div class="row">
								<div class="input-field col s12">
									<input value="Click the CREATE button to create a USER" id="select" type="text"
										class="validate" name="input"> <label class="active"
										for="first_name2">Click the CREATE button to save a USER:</label>
										
										<p> ${user} </p>
								</div>
							</div>



							<button class="btn waves-effect waves-light deep-purple"
								type="submit">
								CREATE <i class="material-icons right">launch</i>
							</button>


						</form>

					</div>



				</div>

			</div>

		</div>
	</div>
	</main>
































	<footer class="page-footer deep-purple">
		<div class="container">
			<div class="row">
				<div class="col l6 s12">
					<h5 class="white-text">Classroom Helper Application</h5>
					<p class="grey-text text-lighten-4">This is the application to
						Create, Read ,Update and Delete information.</p>
				</div>
				<div class="col l4 offset-l2 s12">
					<h5 class="white-text">Links</h5>
					<ul>
						<li><a class="grey-text text-lighten-3" href="index.jsp">
								Home</a></li>

					</ul>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container">
				© 2016 Copyright Text <a class="grey-text text-lighten-4 right"
					href="index.jsp">MY HELPER APP</a>
			</div>
		</div>
	</footer>



</body>
</html>