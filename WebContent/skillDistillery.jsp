<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/animate.css" type="text/css" rel="stylesheet" /> 
<title>Skill Distillery</title>
</head>
<body class="body blue lighten-5">


	<header>

		<nav>
			<div class="nav-wrapper blue darken-3">
				<a href="#" class="brand-logo center">Classroom Helper </a>
			</div>
		</nav>

<div id="sign-in">

        <nav class="nav-wrapper deep-purple accent-4">
            <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li><a href=UserDesktop.jsp>Home</a></li>
                <li><a href="attendance.do">Attendance</a></li>
                <li><a href="grades.do">Grades</a></li>
                <li><a href="ticketing.do">Help Ticket</a></li>
                 <c:choose> 
                <c:when test="${accessLevel == '3'}"> 
                <li><a href="createUserView.do">Create User</a></li>
                </c:when>
                 </c:choose> 
                <li><a href="skillDistillery.jsp">About</a></li>
				<li><a href="http://www.lmgtfy.com/?q=what+is+the+internet%3F">Help</a></li>
                <li><a href="logout.do">Logout</a></li>
            </ul>
        </nav>
</div>
</header>
<div class="SD-logo">
		<img src="http://dev.skilldistillery.com/wiki/images/thumb/5/51/Skilldistillery_correct_box_trans.png/208px-Skilldistillery_correct_box_trans.png"/>
	</div>
<div class="bio">
<p>What began as a plot by former Green Berets to import heroin into the United States illegally 
following the Vietnam conflict has, over the years, evolved into the greatest Java Development Bootcamp in the entire 
Solarium building.  Every year, fresh, hopeful young minds are shipped in by the bushel, only to be warped
beyond recognition by the cruel, unblinking gaze of Jamie Romero and angry glowering of Rob Roselius, Skill Distillery's
senior-most goons.</p>  

<p>Skill Distillery is located in the lovely state of Colorado, but draws many students from all over 
the country.  In terms of elevation with respect to sea-level, these students often find themselves
higher than they've ever been in their entire lives.</p>
<br>
<h5>Meet our staff:</h5>
<div class="aboutme-box">
	<div class="staff">
		<ul>
			<li><a href="Cole.jsp">Cole Frock</a></li>
			<li><a href="rob.jsp">Rob Roselius</a></li>
			<li><a href="jamie.jsp">Jamie Romero</a></li>
			<li><a href="Andrew.jsp">Andrew Conlin</a></li>
			<li><a href="Kris.jsp">Kris Kane</a></li>
		</ul>
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
</body>
</html>