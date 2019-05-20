<!DOCTYPE html>
<%@page import="seats.SeatsDAO"%>
<%@page import="booking.Booking"%>
<%@page import="java.util.List"%>
<%@page import="flights.Airport"%>
<%@page import="java.util.ArrayList"%>
<%@page import="flights.AirportsDAO"%>
<%@page import="users.UsersDAO"%>
<html lang="en">


<head>

	<link rel="shortcut icon" type="image/png" href="/resources/firstlogo.png" />
	<title>Payment</title>
	<%@ page contentType="text/html; charset=UTF-8" %>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!--Bootstrap links and scripts-->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet"
		id="bootstrap-css">
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

	<!--Javascript-->
	<script src="/js/main.js" defer></script>

	<!--CSS Stylesheet-->
	<link rel="stylesheet" href="/css/basics.css" />
	<link rel="stylesheet" href="/css/progress/progressBarStyle.css" />
	<link rel="stylesheet" href="/css/progress/personnalInfosStyle.css" />

</head>

<body>
	<div id="logo">
		<a href="/"><img src="/resources/logo.png" alt="Insert logo here" id="home"></a>
	</div>

	<nav id="progressBar" class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar10">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbar10">
				<ul class="navbar-nav nav-fill w-100">
					<li id="number1" class="nav-item passive">
						<label>Search</label>
					</li>
					<li class="nav-item passive">
						<label>Departing Flight</label>
					</li>
					<li class="nav-item passive">
						<label>Return Flight</label>
					</li>

					<li class="nav-item passive">
						<label>Seats</label>
					</li>

					<li class="nav-item passive">
						<label>Passengers</label>
					</li>

					<li class="nav-item passive">
						<label>Extra Options</label>
					</li>

					<li class="nav-item passive">
						<label>Confirmation</label>
					</li>

					<li class="nav-item active">
						<label>Payment</label>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="textArea2">
		<div class="container" id="pInfoForm">
			<h1>Booking done</h1>
			<br>

			<h4>Your booking had been succesfully made !
<br><br>	
			<h4>We sent you the booking confirmation and your bill per mail.
			<br><br>
			Please follow the informations given to get your boarding tickets.
			
			
			<br><br><br><br>
			We thank you to travel the world with our flights and hope you will enjoy your journey ! 
			</h4>
			<br>
			Want more ? <a href="/">Look for another flight.</a>

		</div>
	</div>
	<!--Footer -->
	<div id="footer"></div>
</body>

</html>