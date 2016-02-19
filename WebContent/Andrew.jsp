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
<title>Andrew Conlin</title>
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
<img src="Andrew.jpg">
</div>
<h3>Bio</h3>
<p>Andrew Conlin was a model in Manhattan before coming to Skill Distillery.  His meteoric
rise shook the fashion world to its core, and was even documented in a documentary called
"Zoolander".  Eventually, it was decided that Andrew was simply too handsome, and that he
was making all the other models look bad.</p>

<p>So, some strings were pulled, a few no-questions-asked type deals went down,
and next thing you know, Andrew had "graduated" from "college" with a "degree" in
"engineering."  Soon thereafter, he found himself at Skill Distillery, owing less to his
Java acumen and more to the unlimited access to hot Manhattan parties that having him
around allows for.</p>
</div>
</div>​

</body>
</html>
