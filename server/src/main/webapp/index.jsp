<!DOCTYPE html>
<%@page import="connexion.UsersDAO"%>
<html lang="en">

<head>

	<link rel="shortcut icon" type="image/png" href="./resources/firstlogo.png" />
	<title>AirVacation</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">


	<!--Bootstrap links and scripts-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<!--Form header-->
	<link href="./css/HomePage/flightSearchStyle.css" rel="stylesheet">
	<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet"
		id="bootstrap-css">
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

	
	<!--Javascript-->
	<script src="./js/main.js" defer></script>

	<!--CSS Stylesheet-->
	<link rel="stylesheet" href="./css/basics.css" />
	<link rel="stylesheet" href="./css/HomePage/homeStyle.css" />
	

</head>

<body>
	<!--First Navbar, which contains the logo, language, contact, sign up and login section-->
	<nav id="homeBar">
	</nav>

	<!--Second navbar, which contains the differents parts of the website -->
	<nav id="navBar">
	</nav>


	<div id="form-container">
		<img src="./resources/santorin.png">
		<!--Form-->
		<div class="container" id="searchForm">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-8 col-xs-12">
					<div class="tabing">
						<ul>
							<li><span><i class="fa fa-plane" aria-hidden="true"></i></span>
								Purchase a ticket
							</li>
						</ul>
						<div class="tab-content">
							<div id="1" class="tab1 active">
								<form>
									<div class="triptype">
										<label class="rndTrip active"><input type="radio" name="Round" value="RoundTrip"
												checked> Round Trip
										</label>
										<!--TODO Add the next line if we make a simple trip-->
										<!--<label class="oneTrip"><input type="radio" name="Round" value="OneWay"> OneWay </label>-->
									</div>
									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input id="depart" type="text" class="form-control" name="depart" value=""
											placeholder="Departing from">
									</div>
									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input id="arrival" type="text" class="form-control" name="arrival" value=""
											placeholder="Arriving at">
									</div>
									<div class="col-sm-6 col-xs-6 ctrl">
										<i class="fa fa-calendar" aria-hidden="true"></i>
										<input id="departDate" type="date" class="form-control" name="departDate"
											value="2019-04-25" min="2019-04-01" max="2020-04-01"
											placeholder="dd-mm-yyyy">
									</div>
									<div class="col-sm-6 col-xs-6 ctrl hide_one-trip">
										<i class="fa fa-calendar" aria-hidden="true"></i>
										<input id="arrivalDate" type="date" class="form-control" name="arrivalDate"
											value="2019-04-25" min="2019-04-01" max="2020-04-01"
											placeholder="dd-mm-yyyy">
									</div>
									<div class="select-wrap">
										<div class="adult-box">
											<span>Passengers</span>
											<select id="nbPassengers" value="" name="nbPassengers">
												<option>1</option>
												<option>2</option>
												<option>2</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
											</select>
										</div>
										<div class="adult-box">
											<span>Class</span>
											<select id="class" value="" name="class">
												<option>Business</option>
												<option>Economy</option>
											</select>
										</div>
									</div>
									<div class="col-lg-12">
										<input type="submit" class="srch" value="Search Flights" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.Form-->
	</div>

	<footer>
			<br>
			test
			<br>
		</footer>
</body>

</html>