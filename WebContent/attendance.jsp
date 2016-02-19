<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:choose>


<c:when test="${accessLevel == '1'}">
<div id ="studentTable">
	<form action="attendanceStudent.do" method="GET">
		Enter Start Date: <input type="date" name="startDate" value="">
		<br />
		Enter End Date: <input type="date" name="endDate" value=""/>
		<input type="submit" value="Search Dates" />
	</form>
	<c:if test="${! empty errorString}">
		<p>${errorString}</p>
		</c:if>
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
	
	<h4>Create an attendance record for today</h4>
	<form action="createClassAttendances.do" method="POST">
		Enter in the cohort number: <input type="text" name="cohort">
		<input type="submit" value="Create today's attendance record">
	</form>
	
	<c:if test="${! empty attendCconfirm}">
		<h4>${attendCconfirm}</h4>		
	</c:if>

	<c:if test="${! empty errorString}">
		<h4> ${errorString} </h4>
	</c:if>
	<form action= "attendanceAdminAndTA.do", method="GET">
	<select class="browser-default" name="lastname">
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
	
	<c:if test="${! empty userAttendance}">
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
		    <td><input type="hidden" name="studentId" value="${attendance.student.id}">${attendance.student.id}</td>
            <td>${attendance.student.firstname} ${ attendance.student.lastname }</td>
            <td><input type="hidden" name="date" value="${attendance.date}">${attendance.date}</td>
		    <td>
		  		<select class="browser-default" name="present">
		  			<c:choose> 
        				<c:when test="${attendance.present == 'Y'}"> 
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
		  		<select class="browser-default" name="late">
		  			<c:choose> 
        				<c:when test="${attendance.late == 'Y'}"> 
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
		  		<select class="browser-default" name="excused">
		  			<c:choose> 
        				<c:when test="${attendance.excused == 'Y'}"> 
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
			<c:set var="startParts" value="${fn:split(attendance.checkin, ':')}" />
			<td>
			<select class="browser-default" name="startHour">
		    <option selected="${startParts[0]}">${startParts[0]}</option>
		    <c:forEach begin="0" end="23" var="val">
   			 <option><fmt:formatNumber minIntegerDigits="2" value="${val}"/></option>
			</c:forEach>
			</select>
			:
			<select class="browser-default" name="startMinute">
		    <option selected="${startParts[1]}">${startParts[1]}</option>
		    <c:forEach begin="0" end="59" var="val">
   			 <option><fmt:formatNumber minIntegerDigits="2" value="${val}"/></option>
			</c:forEach>
			</select>
			</td>
			<c:set var="endParts" value="${fn:split(attendance.checkout, ':')}" />
			<td>
			<select class="browser-default" name="endHour">
		    <option selected="${endParts[0]}">${endParts[0]}</option>
		    <c:forEach begin="0" end="23" var="val">
   			 <option><fmt:formatNumber minIntegerDigits="2" value="${val}"/></option>
			</c:forEach>
			</select>
			:
			<select class="browser-default" name="endMinute">
		    <option selected="${endParts[1]}">${endParts[1]}</option>
		    <c:forEach begin="0" end="59" var="val">
   			 <option><fmt:formatNumber minIntegerDigits="2" value="${val}"/></option>
			</c:forEach>
			</select>
			</td>
		    <td><input type="submit" value="Edit Record"></td>
		   </form>
		  <td>  <form action="deleteAttendanceRecord.do" method="POST">
		   <input type="submit" value="Delete Record">
		   <input type="hidden" name="date" value="${attendance.date}"/>
		   <input type="hidden" name="studentId" value="${attendance.student.id}"/>
		   </form>
		   <td>
		   </tr>
		</c:forEach>
	</table>
	</c:if>

	<c:if test="${! empty attendMconfirm}">
		<h4>${attendMconfirm}</h4>		
	</c:if>
	<c:if test="${! empty attendDconfirm}">
		<h4>${attendDconfirm}</h4>		
	</c:if>
</div>
</c:when>

<c:otherwise>
	<p>You need to be logged in fool!</p>
</c:otherwise>
</c:choose>