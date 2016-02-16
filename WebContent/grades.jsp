
<c:choose>
<c:when test="${accessLevel == '1'}">
<div id ="studentTable">
			<table>
			 <tr>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>? Time</th>
			    <th>? Time</th>
			  </tr>
			<c:forEach var="grades" items="${usergrades}" varStatus="loop"><tr> 
			  <tr>
			    <td>${grades.id}</td>
			    <td>${grades.?}</td>
			    <td>${grades.?}</td>
			    <td>${grades.?}</td>
			    <td>${grades.?}</td>
			    <td>${grades.checkin}</td>
			    <td>${grades.checkout}</td>

			  </tr>
			</c:forEach>
			</table>
</div>
</c:when>

<c:when test="${accessLevel == '2'}">
<div id="instructorTable">
<form>
	<form action= "grades.do", method="GET">
			<table>
			  <tr>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>? Time</th>
			    <th>? Time</th>
			  </tr>
			  <tr>
			    <td>Row 1: Col 1</td>
			    <td>Row 1: Col 2</td>
			    <td>Row 1: Col 3</td>
			    <td>Row 1: Col 4</td>
			    <td>Row 1: Col 5</td>
			  </tr>
			</table>
	<input type= "submit", value="Show grades"/>
</form>
</div>
</c:when>

<c:when test="${accessLevel == '3'}">
<div id="adminTable">
<form>
	<form action= "grades.do", method="GET">
			<table>
			  <tr>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>? Time</th>
			    <th>? Time</th>
			  </tr>
			  <tr>
			    <td>Row 1: Col 1</td>
			    <td>Row 1: Col 2</td>
			    <td>Row 1: Col 3</td>
			    <td>Row 1: Col 4</td>
			    <td>Row 1: Col 5</td>
			  </tr>
			</table>
	<input type= "submit", value="Show grades"/>
</form>
</div>
</c:when>

<c:otherwise>
<p>You need to be logged in fool!</p>
</c:otherwise>
</c:choose>