<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link type="text/css" rel="stylesheet" href="ticket.css"/>
 -->
<title>Help Ticket Database for ${user.lastName},
	${user.firstName}</title>
</head>
<body>
	<div class="dropDown">
		<h3>Enter a new request for T/A Assistance</h3>
		<form action="createTicket.do" , method="POST">
			<div id ="dropdown-content_left">
				<select name="subjects">
					<option value="All">File Ticket</option>
					<option value="All"></option>
					<option value="HTML">HTML</option>
					<option value="JPA Exam">JPA Exam</option>
					<option value="Java">Java</option>
				</select> <input type="hidden" value="${user.userID}" name="userID" /> 
				<input	type="hidden" value="${user.cohortID}" name="cohortID" />
				Comments: 
				<input type="text" value="blah blah">
				<input	type="submit" value="Submit New Ticket, Right Meow!" />
				
			</div>
		</form>
		<div class="dropDown">
			<form action="ticketing.do">
				<div id ="dropdown-content_Center">
				<p>Choose All open tickets***insert button here*** or choose by Subject ***drop down menu***:</p>
					<select name="subjects">
						<option value="All">View All Open Tickets</option>
						<option value="All">Or</option>
						<option value="All">By Subject:</option>
						<option value="HTML">HTML</option>
						<option value="JPA Exam">JPA Exam</option>
						<option value="Java">Java</option>
					</select> 
						<input type="hidden" value="${user.userID}" name="userID"/> 
						<input type="hidden" value="${user.cohortID}" name="cohortID"/> 
						<input type="submit" value="Go!"/>
				</div>
			</form>
		</div>
		<div class="dropDown">
			<form action="ticketing.do" , method="GET">
				<div id ="dropdown-content_right">
					<select name="subjects">
						<option value="ALL">View All Closed Tickets</option>
						<option value="HTML">HTML</option>
						<option value="JPA Exam">JPA Exam</option>
						<option value="Java">Java</option>
					</select> 
						<input type="hidden" value="${user.userID}" name="userID"/> 
						<input type="hidden" value="${user.cohortID}" name="cohortID"/> 
						<input type="submit" value="Go!"/>
				</div>
			</form>
		</div>
</body>
</html>