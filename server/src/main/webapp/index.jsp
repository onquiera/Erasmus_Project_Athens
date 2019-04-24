<!DOCTYPE html>
<%@page import="connexion.UsersDAO"%>
<html lang="en">

<head>
	<link rel="shortcut icon" type="image/png" href="./resources/firstlogo.png" />
	<title>AirVacation</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="./css/homeStyle.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>

<body>
	<!--First Navbar, which contains the logo, language, contact, sign up and login section-->
	<nav class="navbar" id="HomeBar">
		<div class="container-fluid">
			<div class="navbar-header ">
				<a href="" class="navbar-left"><img src="./resources/secondLogo.png" alt="Insert logo here"
						id=logo-img></a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Choose Your language</a></li>
				<li><a href="#">Contact us</a></li>
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
				<a class="navbar-brand" href="index.jsp">Home</a>
			</div>
			<ul class="nav navbar-nav" id="sectionBar">
				<li><a href="#">Purchase a ticket</a></li>
				<li><a href="#">Check-in</a></li>
				<li><a href='#'>My bookings</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Information <span
							class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Prepare your trip</a></li>
						<li><a href="#">Luggages</a></li>
						<li><a href="#">Flights Informations</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<h3>Welcome on AirVacation !</h3>
		<p>We are unfortunatly under maintainance.</p>
	</div>


	<!-- Carousel, which include the simple search for flights form-->
	<div id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="./resources/beach.jpg">
				<div class="container">
					<div class="carousel-caption">
						<h3>Beach 1</h3>
						<p>Yeah it's a pretty beach</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="./resources/paris.jpg">
				<div class="container">
					<div class="carousel-caption">

					</div>
				</div>
			</div>
			<div class="item">
				<img src="./resources/santorin.png">
				<div class="container">
					<div class="carousel-caption">

					</div>
				</div>
			</div>
		</div>

		<!-- Search form -->
		<form class="col-sm-12" id="searchForm">
			<div class="form-group col-sm-4 col-sm-offset-4">
				<div class="input-group input-group-lg center-block">
					<input type="text" class="form-control" placeholder="Search">
					<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
				</div>
			</div>
		</form>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<i class="glyphicon glyphicon-chevron-left"></i>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<i class="glyphicon glyphicon-chevron-right"></i>
		</a>
	</div>
	<!-- /.carousel -->

</body>

</html>