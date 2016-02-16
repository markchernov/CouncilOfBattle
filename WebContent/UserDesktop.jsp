<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
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
<h4>Welcome "**Username**"${user.firstname}</h4>
        <nav>
            <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li><a href=UserDesktop.jsp>Home</a></li>
                <li><a href="attendance.do">Attendance</a></li>
                <li><a href="grades.do">Grades</a></li>
                <li><a href="tickets.do">Help Ticket</a></li>
            </ul>
        </nav>
</header>

<jsp:include page="attendance.jsp"></jsp:include>

<!--this needs to go to attendance.jsp  -->
<form>
<form action= "attendance.do", method="GET">
<input type= "submit", value="Attendance"/>
</form>

<!--this needs to go to grades.jsp  -->
<form>
<form action= "grades.do", method="GET">
<input type="submit", value="View Grades"/>
</form>

<!--this needs to go to helpTicket.jsp  -->
<form>
<form action="helpTicket.do", method="GET"/>
<input type="submit", value="TA Help Ticket"/>
</form>

<br/>
**Table will show here**
<Div id="1.Student">
userId, date, present, late, excused, checkin, checkout
</Div>

<Div id="2.Instructor">
userId, date, present, late, excused, checkin, checkout
</Div>

<Div id="3.Admin">
userId, date, present, late, excused, checkin, checkout
</Div>

</body>

</html>