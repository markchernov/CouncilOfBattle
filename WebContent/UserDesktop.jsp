<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${accessLevel} Portal</title>
</head>

<body>
<link style="text" rel="stylesheet" href="extra.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/animate.css" type="text/css" rel="stylesheet" /> 
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/materialize.js"></script>
<script src="js/init.js"></script>

</head>

<body class="body blue lighten-5">
	<header>

		<nav>
			<div class="nav-wrapper blue darken-3">
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
        <div class="SD-logo">
 			<img src="http://dev.skilldistillery.com/wiki/images/thumb/5/51/Skilldistillery_correct_box_trans.png/208px-Skilldistillery_correct_box_trans.png"/>
        </div>
</div>
</header>


<c:choose>
<c:when test="${! empty jspString}">
<jsp:include page="${jspString}"></jsp:include>
</c:when>
</c:choose>
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