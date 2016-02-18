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
		    <th>ID</th>
		    <th>Name</th>
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
		  <form action="modifyGradesRecord.do" method="POST">
		    <td><input type="hidden" name="studentId" value="${grade.student.id}">${grade.student.id}</td>
            <td><input type="hidden" name="projectId" value="${grade.project.id}">${grade.project.id}</td>
		    <td>${grade.student.id}</td>		    
		    <td>${grade.student.firstname}  ${grade.student.lastname}</td>
		    <td>${grade.project.name}</td>
		    <select name="grade">
		    <option selected="${grade.grade}">${grade.grade}</option>
		    <c:forEach begin="0" end="100" var="val">
   			 <option value="${val}">${val}</option>
			</c:forEach>
			</select>
		    <c:forEach var="subjects" items="${grade.project.subjects}">
		    <td>${subjects.name}</td>
		    </c:forEach>
		     <td><input type="submit" value="Edit Grade"></td>
		    </form>
		    <form action="deleteGrade.do" method="POST">
		   <input type="submit" value="Delete Record">
		   <input type="hidden" name="projectId" value="${grade.project.id}"/>
		   <input type="hidden" name="studentId" value="${grade.student.id}"/>
		   </form>
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