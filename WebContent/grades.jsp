<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>


<c:when test="${accessLevel == '1'}">
	<table>
		<tr>			 	
		    <th>Project Name</th>
		    <th>Grade</th>
		    <th>Subject(s)</th>
		    <th></th>
		    <th></th>
		    <th></th>
		</tr>
		  <tr>
		<c:forEach var="grade" items="${userGrades}" varStatus="loop"><tr> 
		  <tr>
		    <td>${grade.project.name}</td>
		    <td>${grade.grade}</td>
		    <c:forEach var="subjects" items="${grade.project.subjects}">
		    <td>${subjects.name}</td>
		    </c:forEach>
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
	
	<form action= "gradesByLastNameAdminAndTA.do", method="GET">
	<select name="lastname">
		<c:if test="${! empty studentLastnameList}">
	          <c:forEach var="lastName" items="${studentLastnameList}">
	            <option value="${lastName}">${lastName}</option>
	          </c:forEach>
	    </c:if>      
    </select>
		<input type="submit" value="Search Dates" />
	</form>
	<table>
		<tr>			 	
		    <th>Project Name</th>
		    <th>Grade</th>
		    <th>Subject(s)</th>
		    <th></th>
		    <th></th>
		    <th></th>
		</tr>
		  <tr>
		<c:forEach var="grade" items="${userGrades}" varStatus="loop"><tr> 
		  <tr>
		    <td>${grade.project.name}</td>
		    <td>${grade.grade}</td>
		    <c:forEach var="subjects" items="${grade.project.subjects}">
		    <td>${subjects.name}</td>
		    </c:forEach>
		  </tr>
		</c:forEach>
		  </tr>
	</table>
</div>
</c:when>

<c:otherwise>
	<p>You need to be logged in fool!</p>
</c:otherwise>
</c:choose>