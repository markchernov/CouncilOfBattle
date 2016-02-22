<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:choose>


<c:when test="${accessLevel == '1'}">
<div id ="studentTable">
<div  class="container" class="row">
	<form action="attendanceStudent.do" method="GET">
		<div class="row">
		<div class="col s2" >
		Enter Start Date: <input type="date" name="startDate" value="">
		</div>
		<div class="col s2" >
		Enter End Date: <input type="date" name="endDate" value=""/>
		 <button  class="btn waves-effect waves-light deep-purple" value="Search Dates" type="submit" name="action">Submit
   		 <i class="material-icons right">send</i>
  		</button>
		</div>
		</div>
	</form>
	<c:if test="${! empty errorString}">
		<p class="Red-text text-darken-2">${errorString}</p>
		</c:if>
	</div>
	<div>
	<table class="container">
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
	</div>
</c:when>

<c:when test="${accessLevel == '2' || accessLevel == '3'}">
<div id="instructorTable">
<div class="container">
	<div class="row">
	<h4>Create an attendance record for today</h4>
	<form action="createClassAttendances.do" method="POST">
	<div class="col s2">
	<p>Enter in the cohort number:</p>
	</div>
	<div class="col s1">
		 <input type="text" name="cohort">
	</div>
	<div>
		<button  class="btn waves-effect waves-light deep-purple" value="Create today's attendance record" type="submit" name="action">Create today's attendance record
   				 <i class="material-icons right">send</i>
  				</button>
	</div>
	</form>
	</div>
	<c:if test="${! empty attendCconfirm}">
		<h4>${attendCconfirm}</h4>		
	</c:if>

	<c:if test="${! empty errorString}">
		<p class="Red-text text-darken-2"> ${errorString} </p>
	</c:if>
	<div class="row">
	<form action= "attendanceAdminAndTA.do", method="GET">
	<div class="col s2">
	<select class="browser-default" name="lastname">
		<c:if test="${! empty studentLastnameList}">
	          <c:forEach var="lastName" items="${studentLastnameList}">
	            <option value="${lastName}">${lastName}</option>
	          </c:forEach>
	    </c:if>      
    </select>
    </div>
    	<div class="col s1">
		<p>Start Date:</p> 
		</div>
		<div class="col s2">
		<input type="date" name="startDate">
		</div>
		<div class="col s1">
		<p>End Date:</p> 
		</div>
		<div class ="col s2">
		<input type="date" name="endDate" />
		</div>
		<button  class="btn waves-effect waves-light deep-purple" value="Search Dates" type="submit" name="action">Search Dates
   				 <i class="material-icons right">send</i>
  				</button>
	</form>
	</div>
</div>
	<c:if test="${! empty userAttendance}">
	<div class="container">
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
		    <div class="row">
		  		<div class="col s12">
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
   			 	</div>
   			 	</div>
   			</td>
		    <td>
		    <div class="row">
		  		<select class="browser-default" name="late">
		  		<div class ="col s6">
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
    				</div>
   			 	</select>
   			 	</div>
   			</td>
		    <td>
		    <div class="row">
		    <div class="col s12">
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
   			 	</div>
   			 	</div>
   			</td>
			<c:set var="startParts" value="${fn:split(attendance.checkin, ':')}" />
			<td>
			<div class="row">
			<div class="col s5">
			<select class="browser-default" name="startHour">
		    <option selected="${startParts[0]}">${startParts[0]}</option>
		    <c:forEach begin="0" end="23" var="val">
   			 <option><fmt:formatNumber minIntegerDigits="2" value="${val}"/></option>
			</c:forEach>
			</select>
			</div>
			<div class="col s1"><p>:</p></div>
			<div class="col s5">
			<select class="browser-default" name="startMinute">
		    <option selected="${startParts[1]}">${startParts[1]}</option>
		    <c:forEach begin="0" end="59" var="val">
   			 <option><fmt:formatNumber minIntegerDigits="2" value="${val}"/></option>
			</c:forEach>
			</select>
			</div>
			</div>
			</td>
			<c:set var="endParts" value="${fn:split(attendance.checkout, ':')}" />
			<td>
			<div class="row">
			<div class="col s5">
			<select class="browser-default" name="endHour">
		    <option selected="${endParts[0]}">${endParts[0]}</option>
		    <c:forEach begin="0" end="23" var="val">
   			 <option><fmt:formatNumber minIntegerDigits="2" value="${val}"/></option>
			</c:forEach>
			</select>
			</div>
			<div class="col s1"><p>:</p></div>
			<div class="col s5">
			<select class="browser-default" name="endMinute">
		    <option selected="${endParts[1]}">${endParts[1]}</option>
		    <c:forEach begin="0" end="59" var="val">
   			 <option><fmt:formatNumber minIntegerDigits="2" value="${val}"/></option>
			</c:forEach>
			</select>
			</div>
			</div>
			</td>
		    <td>
		    <form action="deleteGrade.do" method="POST">
					    <button  class="btn waves-effect waves-light deep-purple" value="Edit Record" type="submit" name="action">Edit Record
   		 <i class="material-icons right">send</i>
  		</button>
  		</td>
		   </form>
		  <td>  <form action="deleteAttendanceRecord.do" method="POST">
		   <input type="hidden" name="date" value="${attendance.date}"/>
		   <input type="hidden" name="studentId" value="${attendance.student.id}"/>
		   <form action="deleteGrade.do" method="POST">
					    <button  class="btn waves-effect waves-light deep-purple" value="Delete Record"" type="submit" name="action">Delete Record
   		 <i class="material-icons right">send</i>
  		</button>
  		
		   </form>
		   <td>
		   </tr>
		</c:forEach>
	</table>
	</div>
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