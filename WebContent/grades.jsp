<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="js/materialize.js"></script>
<script src="js/init.js"></script>

<c:choose>

<c:when test="${accessLevel == '1'}">
<div class ="container">
	<table class="responsive-table">
		<tr class="centered"  >			 	
		    <th>Project Name</th>
		    <th>Grade</th>
		    <th>Comments</th>
		    <th>Subject(s)</th>
		    <th></th>
		    <th></th>
		    <th></th>
		</tr>
		<tr class="centered" >
			<c:forEach var="grade" items="${userGrades}" varStatus="loop"><tr> 
			  <tr class="centered" > 
			    <td>${grade.project.name}</td>
			    <td>${grade.grade}</td>
			    <td>${grade.comments}</td>
			    <c:forEach var="subjects" items="${grade.project.subjects}">
			    <td>${subjects.name}</td>
			    </c:forEach>
			  </tr>
			</c:forEach>
		    <td>Average grade = ${averageGrade}</td>
		</tr>
	</table>
</div>
</c:when>
<c:when test="${accessLevel == '2' || accessLevel == '3'}">
<div id="instructorTable">
	<div class="container">
	<div class="row">
	<p>Enter in a new grade:</p>
	<form action="createGrades.do" method="Get">
	<div class="col s2" >
		<select class="browser-default" name="lastName">
			<c:if test="${! empty studentLastnameList}">
		          <c:forEach var="lastName" items="${studentLastnameList}">
		            <option value="${lastName}">${lastName}</option>
		          </c:forEach>
		    </c:if>      
    	</select>
    </div>
    <div class="col s2" >
    	<select class="browser-default" name="project">
			<c:if test="${! empty projectList}">
		          <c:forEach var="project" items="${projectList}">
		            <option value="${project.id}">${project.name}</option>
		          </c:forEach>
		    </c:if>      
		</select>
    </div>
    <div class="col s1" >
		<select class="browser-default" name="grade">
		    <option selected="0">0</option>
		    <c:forEach begin="0" end="100" var="val">
   			<option value="${val}">${val}</option>
			</c:forEach>
		</select>
	</div>
	</div>
	<div class="row" >
	<div class="col s6">
	Comment:<input type="text" name="comments">
	</div>
			 <button  class="btn waves-effect waves-light deep-purple" value="Create Grade" type="submit" name="action">Create New Grade
   		 <i class="material-icons right">send</i>
  		</button>
	</div>
	</form>
	<c:if test="${! empty gradeCconfirm}">
		<p> ${gradeCconfirm} </p>	
	</c:if>
	
	<c:if test="${! empty errorString}">
		<p class="Red-text text-darken-2"> ${errorString} </p>
	</c:if>
	<div class="row">
	<form action= "gradesByLastNameAdminAndTA.do" method="GET">
	<div class="col s2">
	<select class="browser-default" name="lastname">
		<c:if test="${! empty studentLastnameList}">
	          <c:forEach var="lastName" items="${studentLastnameList}">
	            <option value="${lastName}">${lastName}</option>
	          </c:forEach>
	    </c:if>      
    </select>
    </div>
		 <button  class="btn waves-effect waves-light deep-purple" value="Search Grades"" type="submit" name="action">Show By Student
   		 <i class="material-icons right">send</i>
  		</button>
	</form>
	</div>
	</div>
	<c:if test="${! empty userGrades}">
	<div class="container">
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
			    	<button  class="btn waves-effect waves-light deep-purple" value="Edit Grade" type="submit" name="action">Edit Grade
   				 <i class="material-icons right">send</i>
  				</button>
			    </td>
			    </form>
			    <td>
				   <form action="deleteGrade.do" method="POST">
					    <button  class="btn waves-effect waves-light deep-purple" value="Delete Record" type="submit" name="action">Delete Record
   		 <i class="material-icons right">send</i>
  		</button>
					   <input type="hidden" name="projectId" value="${grade.project.id}"/>
					   <input type="hidden" name="studentId" value="${grade.student.id}"/>
				   </form>
				 </td>
			  </tr>
			</c:forEach>
		  </tr>
	</table>
	</div>
</div>
</c:if>

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