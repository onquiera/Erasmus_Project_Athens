<!DOCTYPE html>
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
	<nav id="homeBar"></nav>

	<!--Second navbar, which contains the differents parts of the website -->
	<nav id="navBar"></nav>
	
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