<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>

<!--conditional test for access level 1-->
<c:when test="${accessLevel == '1'}">
<div id ="studentTable">
	<form action="attendanceStudent.do" method="GET">
		Enter Start Date: <input type="date" name="startDate">
		<br />
		Enter End Date: <input type="date" name="endDate" />
		<input type="submit" value="Search Dates" />
	</form>
	<table>
		<tr>			 	
		    <th>Id</th>
		    <th>Date</th>
		    <th>Present</th>
		    <th>Late</th>
		    <th>Excused</th>
		    <th>Check-in Time</th>
		    <th>Check-Out Time</th>
		</tr>
		<c:forEach var="attendance" items="${userAttendance}" varStatus="loop"><tr> 
		  <tr>
		    <td>${attendance.id}</td>
		    <td>${attendance.date}</td>
		    <td>${attendance.present}</td>
		    <td>${attendance.late}</td>
		    <td>${attendance.excused}</td>
		    <td>${attendance.checkin}</td>
		    <td>${attendance.checkout}</td>
		  </tr>
		</c:forEach>
	</table>

			<form action="attendanceStudent.do" method="GET">
			Enter Start Date: <input type="date" name="startDate">
			<br />
			Enter End Date: <input type="date" name="endDate" />
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
			<c:forEach var="attendance" items="${userAttendance}">
			  <tr>

			    <td>${attendance.date}</td>
			    <td>${attendance.present}</td>
			    <td>${attendance.late}</td>
			    <td>${attendance.excused}</td>
			    <td>${attendance.checkin}</td>
			    <td>${attendance.checkout}</td>

			  </tr>
			</c:forEach>
			</table>

</div>
</c:when>

<!--conditional test for access level 2 & 3-->
<c:when test="${accessLevel == '2' || accessLevel == '3'}">
<div id="instructorTable">
	<form action= "attendanceAdminAndTA.do", method="GET">
	<select name="lastname">
		<c:if test="${! empty lastname}">
	          <c:forEach var="lastName" items="${lastname}">
	            <option value="${lastname}">${lastname}</option>
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
		    <th>Id</th>
		    <th>Date</th>
		    <th>Present</th>
		    <th>Late</th>
		    <th>Excused</th>
		    <th>Check-in Time</th>
		    <th>Check-Out Time</th>
		  </tr>
		<c:forEach var="attendance" items="${userAttendance}" varStatus="loop"><tr> 
		  <tr>
		    <td>${attendance.id}</td>
		    <td>${attendance.date}</td>
		    <td>${attendance.present}</td>
		    <td>${attendance.late}</td>
		    <td>${attendance.excused}</td>
		    <td>${attendance.checkin}</td>
		    <td>${attendance.checkout}</td>
		  </tr>
		</c:forEach>
	</table>
	
<!--if we want to add the ability to view multiple cohorts  -->
<!--<form action= "attendanceAdminAndTA.do", method="GET">
		Cohort to view:<input type="text" name="cohort">
		<input type="submit" value="View Attendance Record" />
	</form>-->
			
<!--<form action= "attendanceAdminAndTA.do", method="POST">
		Enter new attendance Record<br/>
		<input type="text" name="userFirst">
		<input type="submit" value="Add New Attendance Record" />
	</form> -->
			g
</div>
</c:when>

<!--in the interest of keeping it simple for launch, we combining the lvl 2 & lvl 3 permissions into one for now  -->
<!-- <c:when test="${accessLevel == '3'}">
	<div id="adminTable">
	
	</div>
</c:when> -->

<c:otherwise>
	<p>You need to be logged in fool!</p>
</c:otherwise>
</c:choose>