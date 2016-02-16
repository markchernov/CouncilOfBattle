<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- <jsp:include page="headAfterLogin".jsp"></jsp:include page> --%>
<%@include file="./headAfterLogin.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${user.level} Portal</title>
</head>
<body>

<h2>Welcome ${user.firstname}</h2>
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