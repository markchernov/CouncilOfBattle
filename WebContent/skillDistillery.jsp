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
<body>

	<header>

		<nav>
			<div class="nav-wrapper deep-purple">
    <c:choose> 
        <c:when test="${accessLevel == '1'}"> 
             Welcome ${sessionUser.firstname}, you are signed in as a Student
        </c:when>
        <c:when test="${accessLevel == '2'}"> 
             Welcome ${sessionUser.firstname}, you are signed in as a Instructor.
        </c:when>
        <c:when test="${accessLevel == '3'}"> 
             Welcome ${sessionUser.firstname}, you are signed in as a Administrator.
        </c:when>
        <c:otherwise>
      		<c:redirect url="index.jsp"/>
        </c:otherwise>
    </c:choose>
				<a href="#" class="brand-logo center">Classroom Helper </a>
			</div>
		</nav>

<div id="sign-in">

        <nav>
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
				<li><a href="http://www.lmgtfy.com">Help</a></li>
                <li><a href="logout.do">Logout</a></li>
                <!--TODO: ^^ create logout.do in the controller-->
            </ul>
        </nav>
</div>
</header>

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
View Staff Bios:
<a href="Cole.jsp">Cole Frock</a>
<a href="rob.jsp">Rob Roselius</a>
<a href="jamie.jsp">Jamie Romero</a>
<a href="Andrew.jsp">Andrew Conlin</a>
<a href="Kris.jsp">Kris Kane</a>
</div>
</body>
</html>