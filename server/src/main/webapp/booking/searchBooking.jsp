<!DOCTYPE html>
<%@page import="connexion.UsersDAO"%>
<html lang="en">

<head>
<title>AirVacation</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/homeStyle.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!--
	<script type="module" src="build/main.js"></script>
	<script type="module" src="js/Popup/Login.js"></script>
-->
</head>

<body>
	<!--First Navbar, which contains the logo, language, contact, sign up and login section-->
	<nav class="navbar" id="HomeBar">
		<div class="container-fluid">
			<div class="navbar-header ">
				<a href="" class="navbar-left"><img
					src="/resources/firstlogo.png" alt="logo" id=logo-img></a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">language</a></li>
				<%
					//gestion login
					String login = (String) session.getAttribute("login");
					
					if (login == null) {
						out.println(
						"<li><a href=\"sign-in.html\"><span class=\"glyphicon glyphicon-user\"></span>"
						+"Sign in</a></li>"
						+"<li><a href=\"login.html\"><span"
						+"class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>");
					}else{
						out.println("<li><p><b>connected</b></p></li>");
						out.println("<li><a href=\"servlet-Deconnecte\">Disconnect</a></li>");
					}
				%>				
			</ul>
		</div>
	</nav>



	<!--Second navbar, which contains the differents parts of the website -->
	<nav class="navbar" id="navigationBar">
		<div class="container-fluid">
			<div class="navbar-header ">
				<a class="navbar-brand" href="#">AirVacation</a>
			</div>
			<ul class="nav navbar-nav" id="sectionBar">
				<li class="active"><a href="#">Home</a></li>

				<li><a href="#">Purchase a ticket</a></li>
				<li><a href="#">Check-in</a></li>
				<li><a href='#'>My bookings</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Information <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Prepare your trip</a></li>
						<li><a href="#">Luggages</a></li>
						<li><a href="#">Flights Informations</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		
			<div class="row">
					<div class="col-md-6">
						<h3>Search my Reservation</h3>
						<br>
						<form action="MyBooking" method=post role="form class=form">
							<div class="form-group">
								<label for="usrmail"><span class="glyphicon"></span> Your surname</label>
								<input type="text" name="surname" class="form-control" placeholder="Enter surname">
							</div>
							<div class="form-group">
								<label for="psw"><span class="glyphicon"></span> Your reservation ID</label>
								<input type="text" name="reservationID" class="form-control" placeholder="Enter reservation ID">
							</div>
							<button id="sendRequest" type="submit" class="btnSubmit"><span class="glyphicon glyphicon-search"></span> search</button>
							<br>
							
							<div class="form-group">
								<a href="contact.html" class="ForgetPwd">reservation not found ?</a>
							</div>
						</form>
					</div>
				</div>

	</div>
	
</body>

</html>