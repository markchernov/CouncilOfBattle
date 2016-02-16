<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--TODO: Choose CSS styling  -->
<!-- 
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/animate.css" type="text/css" rel="stylesheet" /> 
-->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${user.UserType} Portal</title>
</head>
<body>
<header>
    <div class="logo">Classroom Helper</div><br/>
<h4>Welcome "**Username**"${user.firstname}</h4>
        <nav>
            <ul id="nav-mobile" class="left hide-on-med-and-down">
                <li><a href=userDesktop.jsp>Home</a></li>
                <li><a href="attendance.do">Attendance</a></li>
                <li><a href="grades.do">Grades</a></li>
                <li><a href="tickets.do">Help Ticket</a></li>
            </ul>
        </nav>
</header>

<!--this needs to go to attendance.jsp  -->
<form>
<form action= "attendance.do", method="GET">
<input type= "submit", value="Attendance"/>
</form>

<!--this needs to go to attendance.jsp  -->
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