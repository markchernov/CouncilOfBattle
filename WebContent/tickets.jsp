<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href= "ticket.css"/>
<title>Help Ticket Portal</title>
</head>
<body>
<table>
<caption>Open Ticket(s)</caption>
<c:forEach var="ticket" items="${tickets}">
	<p>${ticket.id}</p>	
	<p>${ticket.subject.name}</p>
	
		


</c:forEach>
	
</body>
</html>