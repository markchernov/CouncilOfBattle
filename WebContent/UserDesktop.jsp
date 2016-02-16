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
<!--TODO: Choose CSS styling  -->
<!-- 
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/animate.css" type="text/css" rel="stylesheet" /> 
-->
</head>

<body>
<header>

    <div class="logo">Classroom Helper</div><br/>
		<h4>Welcome ${sessionUser.firstname}</h4>
        <nav>
            <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li><a href=UserDesktop.jsp>Home</a></li>
                <li><a href="attendance.do">Attendance</a></li>
                <li><a href="grades.do">Grades</a></li>
                <li><a href="tickets.do">Help Ticket</a></li>
            </ul>
        </nav>
</header>

<!--We can have the right .jsp called by the button, that hits the *.do and returns the name of the .jsp from the controller-->
<jsp:include page="${jspString}"></jsp:include>

<!--Or we can do it via a conditional statement  -->
<%-- <jsp:include page="attendance.jsp"></jsp:include>
<jsp:include page="grades.jsp"></jsp:include>
<jsp:include page="helpTickets.jsp"></jsp:include>
 --%>

</body>
</html>