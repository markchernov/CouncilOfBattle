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

<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/animate.css" type="text/css" rel="stylesheet" /> 
 -->
<!--TODO: ^^ Choose CSS styling  -->
</head>

<body>
<header>
<div id="sign-in">
    <div class="logo">Classroom Helper</div><br/>
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

		<h4>Welcome ${sessionUser.firstname}</h4>
        <nav>
            <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li><a href=UserDesktop.jsp>Home</a></li>
                <li><a href="attendance.do">Attendance</a></li>
                <li><a href="grades.do">Grades</a></li>
                <li><a href="ticketing.do">Help Ticket</a></li>
                <li><a href="logout.do">Logout</a></li>
                <!--TODO: ^^ create logout.do in the controller-->
            </ul>
        </nav>
</div>
</header>


<!--We are calling the specific .jsp segement by the buttons from the header menu-->
<!--The .do method calls the controller which returns the name of the .jsp segment-->
<c:choose>
<c:when test="${! empty jspString}">
<jsp:include page="${jspString}"></jsp:include>
</c:when>
</c:choose>

</body>
</html>