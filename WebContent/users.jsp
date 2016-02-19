<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>

	<c:when test="${accessLevel == '3'}">

		<p>Create a New User Record</p>
		
		<form action="createUser.do" , method="POST">

			Enter First Name:	<input type = "text" name = "firstname" value = "John"/> 
			Enter Last Name:	<input type = "text" name = "lastname" value = "Doe"/>
			Enter Email:		<input type = "text" name = "email" value = "jd@gmail.com"/>
			Enter User Type:	<input type = "text" name = "usertype" value = "student"/>
			<input type="submit" value="Create New User" />
			
		</form>
	
	</c:when>

</c:choose>


