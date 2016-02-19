<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>

	<c:when test="${accessLevel == '3'}">
	<div class="container">
		<h4>Create a New User Record</h4>
		
		<form action="createUser.do" , method="POST">
		<div class="row">
		<div class="col s6">
			Enter First Name:	<input type = "text" name = "firstname" value = "John"/> 
		</div>
		<div class="col s6">
			Enter Last Name:	<input type = "text" name = "lastname" value = "Doe"/>
		</div>
		<div class="row">
		<div class="col s6">
			Enter Email:		<input type = "text" name = "email" value = "jd@gmail.com"/>
			</div>
			<div class="col s6">
			Enter User Type:	<input type = "text" name = "usertype" value = "student"/>
			</div>
			<button  class="btn waves-effect waves-light deep-purple" value="Create New User" type="submit" name="action">Create New User
   		 <i class="material-icons right">send</i>
  		</button>
		</div>
		</form>
		</div>
	</div>
	</c:when>

</c:choose>


