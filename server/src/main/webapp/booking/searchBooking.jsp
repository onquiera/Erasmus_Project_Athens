<!DOCTYPE html>
<html lang="en">

<head>

	<link rel="shortcut icon" type="image/png" href="/resources/firstlogo.png" />
	<title>Booking</title>
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
	<link rel="stylesheet" href="/css/HomePage/flightSearchStyle.css">
	<link rel="stylesheet" href="/css/HomePage/homeStyle.css">
</head>


<body>

	<!--First Navbar, which contains the logo, language, contact, sign up and login section-->
	<nav id="homeBar"></nav>

	<!--Second navbar, which contains the differents parts of the website -->
	<nav id="navBar"></nav>

	<div id="form-container">
		<img src="/resources/peru.jpg">
		<div class="container" id="searchForm">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-8 col-xs-12">
					<div class="tabing">
						<div class="tab-content">
							<div id="1" class="tab1 active">
									<h3 id="searching">Search my Reservation</h3>
								<!--RoundTrip Form-->
								<form action="/MyBooking" method=post role="form class=form">

									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input required name="surname" class="form-control" value="" placeholder="Surname">
									</div>


									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input required class="form-control" name="bookingID" value=""
											placeholder="Booking ID">
									</div>

									<div class="col-lg-12">
										<input id="sendRequest" type="submit" class="srch"
											value="Find your reservation" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!--Footer -->
	<div id="footer"></div>
</body>

</html>