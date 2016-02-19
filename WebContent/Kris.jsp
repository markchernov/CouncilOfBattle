<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link style="text" rel="stylesheet" href="extra.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
<link href="css/animate.css" type="text/css" rel="stylesheet" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kris Kane</title>
</head>
<body class="body blue lighten-5">


<div class="content">
<header>

		<nav>
			<div class="nav-wrapper blue darken-3">
  
				<a href="#" class="brand-logo center">Classroom Helper </a>
			</div>
		</nav>

<div id="sign-in">

        <nav id="nav-wrapper" class="left hide-on-med-and-down green">
            <ul>
                <li><a href=UserDesktop.jsp>Home</a></li>
                <li><a href="attendance.do">Attendance</a></li>
                <li><a href="grades.do">Grades</a></li>
                <li><a href="ticketing.do">Help Ticket</a></li>
                 <c:choose> 
                <c:when test="${accessLevel == '3'}"> 
                <li><a href="createUserView.do">Create User</a></li>
                </c:when>
                 </c:choose> 
                <li><a href="skillDistillery.jsp">About</a></li>
				<li><a href="http://www.lmgtfy.com/?q=what+is+the+internet%3F">Help</a></li>
                <li><a href="logout.do">Logout</a></li>
                <!--TODO: ^^ create logout.do in the controller-->
            </ul>
        </nav>
      
</div>
</header>



<div class="SD-logo">
<img src="Kris.jpg"/>
</div>
<h3>Bio</h3>
<p>Kris Kane was raised by wolves in the mountains, where, as a child, he regularly ate
human flesh.  More animal than man, Kris Kane naturally became the subject of much study
by the scientific community.  He was flown all over the world to attend conference after
conference so scientists could marvel at him safely locked behind glass.  Over the years,
Kris was able to slowly teach himself human communication, using his new-found
communication skills to ask his scientist friends if he was ever going to get a paycheck.
Next thing he knew, the scientists had dumped him in a bus station at the edge of town
and sped off.</p>

<p>Kris wandered the streets of that city, shocked by his first glimpse of human
civilization, and frightening any nearby children.  Kris made his first real friend when
he mistook an ATM display reading "HELLO!  Welcome to 1st Bank" for a friendly gesture.
He decided that day that he would spend the rest of his life searching for a way to talk
to his new computer friend.  Eventually, he was found crawling through the duct system in
Skill Distillery and given a job killing rats.</p>

</div>
</div>​

</body>
</html>
