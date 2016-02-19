<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/materialize.js"></script>
<script src="js/init.js"></script>

<c:choose>

<c:when test="${accessLevel == '1'}">
	<table>
		<tr>			 	
		    <th>Project Name</th>
		    <th>Grade</th>
		    <th>Comments</th>
		    <th>Subject(s)</th>
		    <th>Average Grade</th>
		    <th></th>
		    <th></th>
		</tr>
		<tr>
			<c:forEach var="grade" items="${userGrades}" varStatus="loop"><tr> 
			  <tr>
			    <td>${grade.project.name}</td>
			    <td>${grade.grade}</td>
			    <td>${grade.comments}</td>
			    <c:forEach var="subjects" items="${grade.project.subjects}">
			    <td>${subjects.name}</td>
			    </c:forEach>
			    <td>${averageGrade}</td>
			  </tr>
			</c:forEach>
		</tr>
	</table>
</c:when>

<c:when test="${accessLevel == '2' || accessLevel == '3'}">
<div id="instructorTable">
	
	<p>Enter in a new grade:</p>
	<form action="createGrades.do" method="Get">
		<select class="browser-default" name="lastName">
			<c:if test="${! empty studentLastnameList}">
		          <c:forEach var="lastName" items="${studentLastnameList}">
		            <option value="${lastName}">${lastName}</option>
		          </c:forEach>
		    </c:if>      
    	</select>
    
    	<select class="browser-default" name="project">
			<c:if test="${! empty projectList}">
		          <c:forEach var="project" items="${projectList}">
		            <option value="${project.id}">${project.name}</option>
		          </c:forEach>
		    </c:if>      
		</select>
    
		<select class="browser-default" name="grade">
		    <option selected="0">0</option>
		    <c:forEach begin="0" end="100" var="val">
   			<option value="${val}">${val}</option>
			</c:forEach>
		</select>
	Comment:<input type="text" name="comments">
			<input type="submit" value="GO!">
	</form>
	
	<c:if test="${! empty gradeCconfirm}">
		<p> ${gradeCconfirm} </p>	
	</c:if>
	
	<c:if test="${! empty errorString}">
		<p> ${errorString} </p>
	</c:if>
	
	<form action= "gradesByLastNameAdminAndTA.do" method="GET">
	<select class="browser-default" name="lastname">
		<c:if test="${! empty studentLastnameList}">
	          <c:forEach var="lastName" items="${studentLastnameList}">
	            <option value="${lastName}">${lastName}</option>
	          </c:forEach>
	    </c:if>      
    </select>
		<input type="submit" value="Search Grades" />
	</form>
	<table>
		<tr>			 	
		    <th>ID</th>
		    <th>Name</th>
		    <th>Project Name</th>
		    <th>Grade</th>
		    <th>Comments</th>
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
			    <td>${grade.student.firstname}  ${grade.student.lastname}</td>	    
			    <td>${grade.project.name}</td>
			    <td>
			    	<input type="hidden" name="projectId" value="${grade.project.id}">
				    <select class="browser-default" name="grade">
				    	<option selected="${grade.grade}">${grade.grade}</option>
				    	<c:forEach begin="0" end="100" var="val">
		   			 	<option value="${val}">${val}</option>
						</c:forEach>
					</select>
				</td>
				<td>
			   		<input type="text" name="comment" value="${grade.comments}">
				</td>
			    	<c:forEach var="subjects" items="${grade.project.subjects}">
				<td>${subjects.name}</td>
			   		 </c:forEach>
			    <td>
			    	<input type="submit" value="Edit Grade">
			    </td>
			    </form>
			    <td>
				   <form action="deleteGrade.do" method="POST">
					   <input type="submit" value="Delete Record">
					   <input type="hidden" name="projectId" value="${grade.project.id}"/>
					   <input type="hidden" name="studentId" value="${grade.student.id}"/>
				   </form>
				 </td>
			  </tr>
			</c:forEach>
		  </tr>
	</table>
</div>

	<c:if test="${! empty gradeMconfirm}">
		<h4> ${gradeMconfirm} </h4>	
	</c:if>
		
	<c:if test="${! empty gradeDconfirm}">
		<h4> ${gradeDconfirm} </h4>	
	</c:if>

</c:when>

<c:otherwise>
	<h4>You need to be logged in fool!</h4>
</c:otherwise>

</c:choose>