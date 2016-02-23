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

<title>Cole Frock</title>
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
<img src="Cole.jpg"/>
</div> 
<h3>Bio</h3>
<p>Cole Frock, born "Susan McMurphy", has enjoyed almost as much success in the Java
Development world as he did at his last job: one of the entertainers employed at
Dandy Dan's, a gentlemen's club in the ghetto.  But eventually, the "dancer" life got
old for Ms. McMurphy, so she decided on a career change.  Along with other, somewhat
more dramatic changes.  Tens of thousands of dollars, and a couple trips to Thailand
later, and Mr. Cole Frock was back in the US, ready to start Skill Distillery, a
bootcamp that teaches proper football-throwing techniques.</p>

<p>Hailing from Texas, Cole drives a truck so nice it should, by rights, belong to a
wealthy older woman.  He also claims to know good barbecue.  Of course, as anyone
from the real South knows, you never trust a Texan when it comes to barbecue or a
transparent death penalty appeals process.  Despite being from Texas, Cole can read
and has even begun to appreciate the wisdom behind indoor plumbing.</p>
</div>
</div>​

</body>
</html>
