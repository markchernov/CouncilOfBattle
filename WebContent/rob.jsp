<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link style="text" rel="stylesheet" href="extra.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/animate.css" type="text/css" rel="stylesheet" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rob Roselius</title>
</head>
<body class="body blue lighten-5">

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
<div class="content">



<div class="SD-logo">
<img src="Rob.jpg"/>
</div>
    
<h3>Bio</h3>
   Very little is known about Rob Roselius before he burst onto the global stage in 1993
	 with what was hailed then as the worst rap album of all time.  Titled simply,
	 "Rob Raps", it featured no actual rapping, but rather several hours of SQL
	 database query strings read aloud.  Pitchfork gave it a 7.9.</p>

	<p>Realizing that a rap career perhaps wasn't for him, he decided to pursue his second
	passion: database manipulation.  In order, as he says, to "make that paper, son" he
	teaches at Skill Distillery, a Java-Development Bootcamp that teaches people how to
	survive on the mean streets.</p>
</div>
​

</body>
</html>
