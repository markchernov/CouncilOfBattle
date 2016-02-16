
<c:choose>
<c:when test="${accessLevel == '1'}">
<div id ="studentTable">
			<table>
			 <tr>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			  </tr>
			<c:forEach var="helpTickets" items="${userhelpTickets}" varStatus="loop"><tr> 
			  <tr>
			    <td>${helpTickets.id}</td>
			    <td>${helpTickets.date}</td>
			    <td>${helpTickets.?}</td>
			    <td>${helpTickets.?}</td>
			    <td>${helpTickets.?}</td>
			    <td>${helpTickets.?}</td>
			    <td>${helpTickets.?}</td>

			  </tr>
			</c:forEach>
			</table>
</div>
</c:when>

<c:when test="${accessLevel == 2}">
<div id="instructorTable">
<form>
	<form action= "helpTickets.do", method="GET">
			<table>
			  <tr>
			    <th>Date</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			  </tr>
			  <tr>
			    <td>Row 1: Col 1</td>
			    <td>Row 1: Col 2</td>
			    <td>Row 1: Col 3</td>
			    <td>Row 1: Col 4</td>
			    <td>Row 1: Col 5</td>
			  </tr>
			</table>
	<input type= "submit", value="Show helpTickets"/>
</form>
</div>
</c:when>

<c:when test="${accessLevel == 2}">
<div id="adminTable">
<form>
	<form action= "helpTickets.do", method="GET">
			<table>
			  <tr>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			    <th>?</th>
			  </tr>
			  <tr>
			    <td>Row 1: Col 1</td>
			    <td>Row 1: Col 2</td>
			    <td>Row 1: Col 3</td>
			    <td>Row 1: Col 4</td>
			    <td>Row 1: Col 5</td>
			  </tr>
			</table>
	<input type= "submit", value="Show helpTickets"/>
</form>
</div>
</c:when>

<c:otherwise>
<p>You need to be logged in fool!</p>
</c:otherwise>
</c:choose>