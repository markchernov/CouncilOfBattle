<c:choose>
<c:when test="${accessLevel == '1'}">
<div id ="studentTable">
			<table>
			 <tr>
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
</div>
</c:when>

<c:when>
<div id="instructorTable">
<form>
	<form action= "attendance.do", method="GET">
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
			    <td>Row 1: Col 1</td>
			    <td>Row 1: Col 2</td>
			    <td>Row 1: Col 3</td>
			    <td>Row 1: Col 4</td>
			    <td>Row 1: Col 5</td>
			  </tr>
			</table>
	<input type= "submit", value="Show Attendance"/>
</form>
</div>
</c:when>

<c:when>
<div id="adminTable">
<form>
	<form action= "attendance.do", method="GET">
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
			    <td>Row 1: Col 1</td>
			    <td>Row 1: Col 2</td>
			    <td>Row 1: Col 3</td>
			    <td>Row 1: Col 4</td>
			    <td>Row 1: Col 5</td>
			  </tr>
			</table>
	<input type= "submit", value="Show Attendance"/>
</form>
</div>
</c:when>

<c:otherwise>
<p>You need to be logged in fool!</p>
</c:otherwise>
</c:choose>