
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
					<input type = "text" name = "description" value="enter your comment"/> 
	
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
				<div>
			</tr>
			<tr>
				<c:forEach var="ticket" items="${tickets}" varStatus="loop">
					<tr>
						<td>${ticket.id}</td>
						<td>${ticket.subject.name}</td>
						<td>${ticket.student.firstname} ${ticket.student.lastname}</td>
						<td>${ticket.instructor.firstname}</td>
						<td>${ticket.date}</td>
						<td>${ticket.submitTime}</td>
						<td>${ticket.closeTime}</td>
						<td>${ticket.available}</td>
					</tr>
				</c:forEach>
			</tr>
		</table>
	</c:when>
	
	<!--access for intructors or admin -->
	<c:when test="${accessLevel == '2' || accessLevel == '3' }">
		<p>All Tickets:</p>
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
				<th>Close Ticket</th>
			</tr>
			<tr>
				<c:forEach var="ticket" items="${tickets}" varStatus="loop">
					<tr>
						<form action="modifyTicket.do" method="POST">
							<td><input type="hidden" name="ticketId" value="${ticket.id}">"${ticket.id}"</td>
							<td>${ticket.subject.name}</td>
							<td>${ticket.student.firstname} ${ticket.student.lastname}</td>
							<td>${ticket.instructor.firstname}</td>
							<td>${ticket.date}</td>
							<td>${ticket.submitTime}</td>
							<td>${ticket.closeTime}</td>
							<td>${ticket.available}</td>
							<td>${ticket.description}</td>
							<td>
									<select name="statusOpen">
									<c:choose>
										<c:when test="${ticket.statusOpen == 'Y'}">
											<option selected="true" value="Y">Y</option>
											<option value="N">N</option>
										</c:when>
										<c:otherwise>
											<option value="Y">Y</option>
											<option selected="true" value="N">N</option>
										</c:otherwise>
									</c:choose>
									</select>
									<input type="submit" value="Update Ticket">
							</td>
						</form>
					</tr>
				</c:forEach>
			</tr>
		</table>		
	</c:when>
	
<c:otherwise>
	<p>You need to be logged in fool!</p>
</c:otherwise>
</c:choose>

