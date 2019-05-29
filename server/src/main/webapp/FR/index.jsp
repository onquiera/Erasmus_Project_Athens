<!DOCTYPE html>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="flights.Airport"%>
<%@page import="flights.AirportsDAO"%>
<html lang="en">

<head>

	<link rel="shortcut icon" type="image/png" href="/FR/resources/firstlogo.png" />
	<title>Air Asmus</title>
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
	<link rel="stylesheet" href="/css/HomePage/homeStyle.css" />
	<link rel="stylesheet" href="/css/HomePage/flightSearchStyle.css">

</head>

<body>
	<!--First Navbar, which contains the logo, language, contact, sign up and login section-->
	<nav id="homeBar"></nav>

	<!--Second navbar, which contains the differents parts of the website -->
	<nav id="navBar"></nav>


	<!-- airport list for formular -->
	<datalist id="airports">
		<%
			AirportsDAO dao = new AirportsDAO();
			List<Airport> listeAirports = dao.findAll();

			for(Airport airport : listeAirports) {
				out.println("<option value=\""+ airport.getName()+"\">");
			}	
			
			 %>
	</datalist>


	<% 
									DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
									LocalDate localDate = LocalDate.now();
									String actualDate = dtf.format(localDate); 		
									localDate = localDate.plusDays(1);
									String tomorrowDate = dtf.format(localDate); 													
									%>



	<!--The flight-searching form-->
	<div id="form-container">
		<img src="/resources/santorin.png">
		<div class="container" id="searchForm">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-8 col-xs-12">
					<div class="tabing">
						<ul>
							<li><a href="#1" id="rnd" class="active"><span><i class="fa fa-plane"
											aria-hidden="true"></i></span>Round Trip</a></li>
							<li><a href="#2" id="oneway"><span><i class="fa fa-plane"
											aria-hidden="true"></i></span>OneWay</a></li>
						</ul>
						<div class="tab-content">
						
						
<!-- roundtrip form--------------------------- -->					
						
							<div id="1" class="tab1 active">
								<!--RoundTrip Form-->
								<form action="/servlet-SearchFlight" method="get">
									<input type="hidden" name="flightType" value="research">

									<div class="triptype">
									</div>


									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input required list="airports" class="form-control" name="departure"
											value="Lille Airport" placeholder="Departing from">
									</div>


									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input required list="airports" class="form-control" name="destination"
											value="Madrid Barajas" placeholder="Arriving at">
									</div>

									<div class="col-sm-6 col-xs-6 ctrl">
										<i class="fa fa-calendar" aria-hidden="true"></i>

										<!--
										TODO
										uncomment when site finished > uses today's date
										
										<input required type="date" class="form-control" name="departureDate"
											value="<%=actualDate %>" min="2019-04-01" max="2025-04-01"
											placeholder="dd-mm-yyyy">
										-->

										<input required type="date" class="form-control" name="departureDate"
											value="2019-05-22" min="2019-04-01" max="2025-04-01"
											placeholder="dd-mm-yyyy">

									</div>

									<div class="col-sm-6 col-xs-6 ctrl hide_one-trip">
										<i class="fa fa-calendar" aria-hidden="true"></i>

										<!--
										TODO
										uncomment when site finished > uses today's date
										<input required type="date" class="form-control" name="returnDate"
											value="<%=tomorrowDate%>" min="2019-04-01" max="2025-04-01"
											placeholder="dd-mm-yyyy">
										-->

										<input required type="date" class="form-control" name="returnDate"
											value="2019-05-24" min="2019-04-01" max="2025-04-01"
											placeholder="dd-mm-yyyy">
									</div>

									<div class="select-wrap">
										<div class="adult-box">
											<span>Passengers</span>
											<select value="" name="numberOfPassengers">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
											</select>
										</div>

									</div>
									<div class="col-lg-12">
										<input type="submit" class="srch" value="Search Flights" />
									</div>
								</form>
							</div>

<!-- one way form--------------------------- -->			
							<div id="2" class="tab1">
								<!--OneWay Form-->
								<form action="/servlet-SearchFlight" method="get">
									<input type="hidden" name="flightType" value="research">

									<div class="triptype">
									</div>


									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input required list="airports" class="form-control" name="departure"
											value="Lille Airport" placeholder="Departing from">
									</div>


									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input required list="airports" class="form-control" name="destination"
											value="Madrid Barajas" placeholder="Arriving at">
									</div>

									<div class="col-sm-6 col-xs-6 ctrl">
										<i class="fa fa-calendar" aria-hidden="true"></i>

										<!--
										TODO
										uncomment when site finished > uses today's date
										
										<input required type="date" class="form-control" name="departureDate"
											value="<%=actualDate %>" min="2019-04-01" max="2025-04-01"
											placeholder="dd-mm-yyyy">
										-->

										<input required type="date" class="form-control" name="departureDate"
											value="2019-05-22" min="2019-04-01" max="2025-04-01"
											placeholder="dd-mm-yyyy">

									</div>

									<div class="select-wrap">
										<div class="adult-box">
											<span>Passengers</span>
											<select value="" name="numberOfPassengers">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
											</select>
										</div>

									</div>
									<div class="col-lg-12">
										<input type="submit" class="srch" value="Search Flights" />
									</div>
								</form>
							</div>
<!-- end of one way form--------------------------- -->			
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--
		TODO

		write about deals and trips
		write about travel guides
	-->



	<!--Footer -->
	<div id="footer"></div>

</body>

</html>