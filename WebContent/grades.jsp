
<c:choose>

<!--conditional test for access level 1-->
<c:when test="${accessLevel == '1'}">
<div id ="studentTable">
<!--TODO:verify .do name-->
	<form action="???attendanceStudent.do" method="GET">
		Enter Start Date: <input type="date" name="startDate">
		<br />
		Enter End Date: <input type="date" name="endDate" />
		<input type="submit" value="Search Grades" />
	</form>
	<table>
		 <tr>
		    <th>User Id</th>
		    <th>Project Id</th>
		    <th>Grade</th>
		  </tr>
	<c:forEach var="grades" items="${usergrades}" varStatus="loop"><tr> 
		  <tr>
		    <td>${grades.user_id}</td>
		    <td>${grades.project_id}</td>
		    <td>${grades.grade}</td>
		  </tr>
	</c:forEach>
	</table>
</div>
</c:when>

<!--conditional test for access level 2 & 3-->
<c:when test="${accessLevel == '2' || accessLevel == '3'}">
<div id="instructorTable">

<!--form for Instructor/Admin to select students by last name, from a drop down menu-->
	<form action= "gradesAdminAndTA.do", method="GET">
	<!--TODO: ^^ Verify .do name-->
		<select name="lastname">
			<c:if test="${! empty lastname}">
	        	<c:forEach var="lastName" items="${lastname}">
	            	<option value="${lastname}">${lastname}</option>
	          </c:forEach>
	    	</c:if>
    	</select>
		<input type="submit" value="Search Grades" />
	</form>
	
	<table>
		<tr>
			<th>User Id</th>
		    <th>Project Id</th>
		    <th>Grade</th>
		</tr>
	<c:forEach var="grades" items="${usergrades}" varStatus="loop"><tr> 
		<tr>
			<td>${grades.user_id}</td>
		    <td>${grades.project_id}</td>
		    <td>${grades.grade}</td>
		</tr>
	</c:forEach>
	</table>
</div>
</c:when>

<!--in the interest of keeping it simple for launch, we combining the lvl 2 & lvl 3 permissions into one for now  -->
<%-- <c:when test="${accessLevel == '3'}">
	<div id="adminTable">

	</div>
</c:when> --%>

<c:otherwise>
	<p>You need to be logged in fool!</p>
</c:otherwise>

</c:choose>