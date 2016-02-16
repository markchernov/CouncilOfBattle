<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>

<meta httep-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>ClassroomHelper</title> 
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- 	<link href="css/materialize.css" type="text/css" rel="stylesheet"
	media="screen,projection" /> -->

<!-- 	<link href="css/style.css" type="text/css" rel="stylesheet"
	media="screen,projection" /> -->

<!-- 	<link href="css/animate.css" type="text/css" rel="stylesheet" />
 -->
</head>
<!--TODO: login.do  -->
<!--TODO: createUser.do  -->
<body>
	<h2>Welcome to Skill Distillery's Classroom Helper</h2>
	<form action="login.do" method="POST">
		Username:<input type="text" name="username"><br/> 
		Password:<input type="text" name="password"><br/> 
		<input type="submit" value="GO!" />
	</form>
	<!-- 	<a href="newUser.jsp">New User</a> -->
	
</body>

<footer> Classroom Helper powered by coffee and lack of sleep.
	Council of Battle @Copyright 2016 </footer>