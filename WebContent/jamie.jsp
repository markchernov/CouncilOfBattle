<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link style="text" rel="stylesheet" href="extra.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/animate.css" type="text/css" rel="stylesheet" /> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Jamie Romero</title>
</head>
<body class="body blue lighten-5">

<div class="content">
<header>

		<nav>
			<div class="nav-wrapper blue darken-3">
  
				<a href="#" class="brand-logo center">Classroom Helper </a>
			</div>
		</nav>

<div id="sign-in">

        <nav id="nav-wrapper" class="left hide-on-med-and-down green">
            <ul>
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
                <!--TODO: ^^ create logout.do in the controller-->
            </ul>
        </nav>
     
</div>
</header>



<div class="SD-logo">
<img src="Jamie.jpg">
</div>

<h3>Bio</h3>
<p>At one time in the 90's, every Federal Agent in the country knew the name 'Jamie
Romero.'  Widely acknowledged as the nicest gangster in the history of organized crime,
it was his personable demeanor and easy way with people that allowed Mr. Romero to
operate so long with impunity as the nation's premier bank robber.</p>

<p>Like Clyde Barrow before him, the law eventually caught up with Jamie.  While
incarcerated, Jamie researched a little-used codicil of Colorado State Law, known as the
"Java not Juvie" Program, meant to encourage at-risk youth in pursuit of tech careers.
It took years of letters to the warden, but eventually, Jamie got his big shot: he was
granted the opportunity to sit for the entrance exam to the Java Not Juvie program.
Jamie knew he had this one chance to leave a life of crime behind forever, and he wasn't
going to take any chances: as soon as he arrived at the testing facility, he stabbed the
proctor and escaped.</p>

<p>A few years later, he wound up at Skill Distillery due to a very lax background-check
policy, and has been here ever since.</p>

</div>
</div>​

</body>
</html>
