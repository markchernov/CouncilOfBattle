<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${accessLevel} Portal</title>
</head>
<body>
	<title>userLoginVersionPA</title>
	<meta httep-equiv="Content-Type" content="text/html" charset="UTF-8">
	<div class="logo">Classroom Helper</div><br/>
	<h2>Welcome,${sessionUser.firstname}</h2>
		<nav>
			<ul id="nav-mobile" class="left hide-on-med-and-down">
				<li><form:form action="userDesktop.jsp"></form:form></li>
				<li><a href=userDesktop.jsp>Home</a></li>
				<li><a href="attendance.do">Attendance</a></li>
				<li><a href="grades.do">Grades</a></li>
				<li><a href="tickets.do">Help Ticket</a></li>
			</ul>
		</nav>
<form>
<form action= "grades.do", method="GET">
<input type="submit", value="View Grades"/>
</form>
<form action="ticketing.do", method="GET"/>
<input type="submit", value="TA Help Ticket"/>
</form>
<form action= "home.do", method="GET">
<input type= "submit", value="Home"/>
</form>

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

</body>
</html>