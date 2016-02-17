<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>


<c:when test="${accessLevel == '1'}">
<div id ="studentTable">
	<form action="attendanceStudent.do" method="GET">
		Enter Start Date: <input type="date" name="startDate">YYYY-MM-DD
		<br />
		Enter End Date: <input type="date" name="endDate" />YYYY-MM-DD
		<input type="submit" value="Search Dates" />
	</form>
	
	
	<table>
		<tr>			 	
		    <th>Date</th>
		    <th>Present</th>
		    <th>Late</th>
		    <th>Excused</th>
		    <th>Check-in Time</th>
		    <th>Check-Out Time</th>
		</tr>
		  <tr>
		<c:forEach var="attendance" items="${userAttendance}" varStatus="loop"><tr> 
		  <tr>
		    <td>${attendance.date}</td>
		    <td>${attendance.present}</td>
		    <td>${attendance.late}</td>
		    <td>${attendance.excused}</td>
		    <td>${attendance.checkin}</td>
		    <td>${attendance.checkout}</td>
		  </tr>
		</c:forEach>
		  </tr>
	</table>
</c:when>

<c:when test="${accessLevel == '2' || accessLevel == '3'}">
<div id="instructorTable">
	<!--search attendance date function -->
	
	<p>Create a New Attendance Record</p>
	<form action="createClassAttendances.do" method="POST">
		Cohort: <input type="text" name="cohort">
		<input type="submit" value="GO!">
	</form>
	
	<form action= "attendanceAdminAndTA.do", method="GET">
	<select name="lastname">
		<c:if test="${! empty studentLastnameList}">
	          <c:forEach var="lastName" items="${studentLastnameList}">
	            <option value="${lastName}">${lastName}</option>
	          </c:forEach>
	    </c:if>      
    </select>
		Enter Start Date: <input type="date" name="startDate">
		<br />
		Enter End Date: <input type="date" name="endDate" />
		<input type="submit" value="Search Dates" />
	</form>
	
	<table>
		 <tr>			 	

		    <th>ID</th>
			<th>Name</th>
		    <th>Date</th>
		    <th>Present</th>
		    <th>Late</th>
		    <th>Excused</th>
		    <th>Check-in Time</th>
		    <th>Check-Out Time</th>
		  </tr>
		<c:forEach var="attendance" items="${userAttendance}" varStatus="loop">
		<tr>
		   <form action="modifyAttendanceRecord.do" method="POST">
		    
		    <td>${attendance.student.id}</td>
		    <td>${attendance.student.firstname}  ${ attendance.student.lastname } </td>
		    <td>${attendance.date}</td>
		    <td><form:input path="${attendance.present}"/></td>		    
		    <td><form:input path="${attendance.late}"/></td>		    
		    <td><form:input path="${attendance.excused}"/></td>		    
		    <td>${attendance.checkin}</td>
		    <td>${attendance.checkout}</td>
		    <td><input type="submit" value="Edit Record"></form></td>
		    <td><form action="deleteAttendanceRecord.do" method="POST"><input type="submit" value="Delete Record"></form></td>
		   </form>
		</c:forEach>
	</table>
	
</div>
</c:when>

<c:otherwise>
	<p>You need to be logged in fool!</p>
</c:otherwise>
</c:choose>