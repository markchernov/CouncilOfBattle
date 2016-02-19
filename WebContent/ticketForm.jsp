
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
			
				<select name="subjects" class="browser-default">
				
					<c:forEach var="subject" items="${subjects}">
						<option value = "${subject.name}">${subject.name}</option>
					</c:forEach>
	
				</select> <input type="hidden" value="${sessionUser.id}" name="studentId" /> 
					<input type = "text" name = "description" value="enter your comment"/> 
	
					<input type="submit" value="Submit New Ticket, Right Meow!" />

			</div>
		</form>
	<form action="ticketing.do", method="GET">
	<input type="submit" value="Show All Tickets"/>
	</form>
		<table>
			<tr>
				<th>Id</th>
				<th>Subject Name</th>
				<th>Student</th>
				<th>Instructor</th>
				<th>Date</th>
			</tr>
			<tr>
				<c:forEach var="ticket" items="${tickets}" varStatus="loop">
					<tr>
						<td>${ticket.id}</td>
						<td>${ticket.subject.name}</td>
						<td>${ticket.student.firstname} ${ticket.student.lastname}</td>
						<td>${ticket.instructor.firstname}</td>
						<td>${ticket.date}</td>
					</tr>
				</c:forEach>
			</tr>
		</table>
	</c:when>
	
	<c:when test="${accessLevel == '2' || accessLevel == '3' }">
			<p>Create a New Ticket Record</p>
		<form action="createTicket.do", method="POST">
			<div id="dropdown-content_left">
			
				<select name="subjects" class="browser-default">
				
					<c:forEach var="subject" items="${subjects}">
						<option value = "${subject.name}">${subject.name}</option>
					</c:forEach>
	
				</select> <input type="hidden" value="${sessionUser.id}" name="studentId" /> 
					<input type = "text" name = "description" value="enter your comment"/> 
	
					<input type="submit" value="Submit New Ticket, Right Meow!" />

			</div>
		</form>
	<form action="ticketing.do", method="GET">
	<input type="submit" value="Show All Tickets"/>
	</form>

		<p>All Tickets:</p>
		<table>
			<tr>
				<th>Id</th>
				<th>Subject Name</th>
				<th>Student</th>
				<th>Instructor</th>
				<th>Date</th>
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
							<td>${ticket.description}</td>
							<td>
									<select name="statusOpen" class="browser-default">
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
							</td>
							<td>
								<input type="submit" value="Update Ticket">
							</td>
						</form>
							<td>
								<form action="deleteTicket.do" method="POST">
									<input type="hidden" name="ticketId" value="${ticket.id}">
									<input type="submit" value="Delete Ticket">
								</form>
							</td>
					</tr>
				</c:forEach>
			</tr>
		</table>
		<c:if test="${! empty ticketCconfirm}">
			<h3>${ticketCconfirm}</h3>		
		</c:if>
	</c:when>
	
<c:otherwise>
	<p>You need to be logged in fool!</p>
</c:otherwise>

</c:choose>

