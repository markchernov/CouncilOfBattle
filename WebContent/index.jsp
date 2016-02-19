<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>

<meta httep-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>ClassroomHelper</title> 
<!--TODO: Choose CSS styling  -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/animate.css" type="text/css" rel="stylesheet" />

</head>
<body class="body blue lighten-5">
	<header>

		<nav>
			<div class="nav-wrapper blue darken-3">
				<a href="#" class="brand-logo center">Classroom Helper </a>
				<ul id="nav-mobile" class="left hide-on-med-and-down">
					<li><a href=index.jsp>Home</a></li>
					<li><a href="http://www.lmgtfy.com/?q=what+is+the+internet%3F">Help</a></li>
				</ul>
			</div>
		</nav>

	</header>
	<h2>Welcome to Skill Distillery's Classroom Helper</h2>
	      <div class="row"  class= "center-align">
        <div class="col s12 m6" class="center-align">
          <div class="card blue-grey darken-1" class="center-align">
            <div class="card-content white-text" class="center-align">
	<form action="login.do" method="POST">
		Username:<input type="text" name="username"><br/> 
		Password:<input type="password" name="password"><br/> 
		<a class="btn-floating btn-large waves-effect waves-light green"><i class="material-icons">
		<input type="submit" value="GO!" /></i></a>
		<c:if test="${! empty errorString}">
		<p>${errorString}</p>
		</c:if>
	</form>
</div>
</div>
</div>
</div>	
	<footer class="page-footer blue darken-3">
		<div class="container">
			<div class="row">
				<div class="col l6 s12">
					<h5 class="white-text">Classroom Helper Application</h5>
					<p class="grey-text text-lighten-4">This is the application to
						Create, Read ,Update and Delete information while keeping it real.  Hey, hey, parse data every day.</p>
					<p class="grey-text text-lighten-4">	Powered by coffee, burritos, and lack of sleep. Council of Battle @Copyright 2016</p>
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