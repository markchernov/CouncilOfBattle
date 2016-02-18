
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>






<c:choose>
	<c:when test="${accessLevel == '1'}">



		<p>Create a New Ticket Record</p>
		<form action="createTicket.do" , method="POST">
			<div id="dropdown-content_left">
			
				<select name="subjects">
				
					<c:forEach var="subject" items="${subjects}">
						<option value = "${subject.name}">${subject.name}</option>
					</c:forEach>
	
				</select> <input type="hidden" value="${sessionUser.id}" name="studentId" /> 
					
					<input type = "text" name = "description"/> 
	
					<input type="submit" value="Submit New Ticket, Right Meow!" />

			</div>
		</form>
	<from action="showMyTickets", method="POST">
	<input type="submit" value="Show my Tickets"/>
	</from>


		<table>
			<tr>
				<th>Id</th>
				<th>Subject Name</th>
				<th>Student</th>
				<th>Instructor</th>
				<th>Date</th>
				<th>Submit Time</th>
				<th>Closed Time</th>
				<th>Available</th>
				<th>Description</th>



			</tr>
			<tr>
				<c:forEach var="ticket" items="${tickets}" varStatus="loop">
					<tr>
					<tr>
						<td>${ticket.id}</td>
						<td>${ticket.subject.name}</td>
						<td>${ticket.student.firstname} ${ticket.student.lastname}</td>
						<td>${ticket.instructor.firstname}</td>
						<td>${ticket.date}</td>
						<td>${ticket.submitTime}</td>
						<td>${ticket.closeTime}</td>
						<td>${ticket.available}</td>
						<td>${ticket.description}</td>


					</tr>
				</c:forEach>
			</tr>
		</table>
	</c:when>


</c:choose>





















