<!DOCTYPE html>
<%@page import="flights.FlightsDAO"%>
<%@page import="flights.FlightWithDetails"%>
<%@page import="seats.PrintSeats"%>
<%@page import="users.Passenger"%>
<%@page import="seats.SeatsDAO"%>
<%@page import="booking.Booking"%>
<%@page import="java.util.List"%>
<%@page import="flights.Airport"%>
<%@page import="java.util.ArrayList"%>
<%@page import="flights.AirportsDAO"%>
<html lang="en">

<head>

	<link rel="shortcut icon" type="image/png" href="/resources/firstlogo.png" />
	<title>Confirmation</title>
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
					<li class="nav-item passive">
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

					<li class="nav-item active">
						<label>Confirmation</label>
					</li>

					<li class="nav-item">
						<label>Payment</label>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div id="textArea2">
		<h1>Booking confirmation</h1>
		<br>
	</div>

	<%
		ArrayList<Passenger> listOfPassengers = null;
		String departure = null;
		String destination = null;
		String outwardFlightID = null;
		String returnFlightID = null;
		ArrayList<String> outwardSeats=null;
		ArrayList<String> returnSeats=null;
		FlightWithDetails outwardFlight=null;
		FlightWithDetails returnFlight=null;
		
		FlightsDAO flightDAO = new FlightsDAO();
		
		try {
			HttpSession httpSession = request.getSession(false);
			//check if session is valid
			if (httpSession == null || !request.isRequestedSessionIdValid()) {
					response.sendRedirect("/error/sessionError.html");
			}

			//PARAMETERS management
			listOfPassengers = (ArrayList<Passenger>) httpSession.getAttribute("listOfPassengers");
			departure = (String) httpSession.getAttribute("departure");
			destination = (String) httpSession.getAttribute("destination");
			outwardFlightID=(String) httpSession.getAttribute("outwardFlightID");
			outwardFlight = flightDAO.findFlight(outwardFlightID);
			
			returnFlightID=(String) httpSession.getAttribute("returnFlightID");
			returnFlight = flightDAO.findFlight(returnFlightID);
			
			outwardSeats = (ArrayList<String>)httpSession.getAttribute("outward-seats");
			returnSeats = (ArrayList<String>)httpSession.getAttribute("return-seats");
			
		} catch (java.lang.NumberFormatException e) {
			e.printStackTrace();
			response.sendRedirect("/error/parameterError.html");
		} catch (NullPointerException e) {
			e.printStackTrace();
			response.sendRedirect("/error/parameterError.html");
		} catch (Exception e2) {
			e2.printStackTrace();
			response.sendRedirect("/error/error.html");
		}
	%>
	<div class="container" id="pInfoForm">
		<h2>Booking informations:</h2>
		
		<b> Before processing to payment, please check that everything is correct, especially your contact informations. </b>
		<br><br>
		
		
		<div style = "border-style: solid; padding:20px ;margin-bottom:1px;">
			<h3>Outward flight:</h3>
			
			<h4>Departure : <%=outwardFlight.getDeparture() %></h4>
			<h4>Arrival : <%=outwardFlight.getArrival() %></h4>
			<h4>SepartureDate : <%=outwardFlight.getDepartureDate() %></h4>
			<h4>SepartureTime : <%=outwardFlight.getDepartureTime() %></h4>
			<h4>ArrivalDate : <%=outwardFlight.getArrivalDate() %></h4>
			<h4>ArrivalTime : <%=outwardFlight.getArrivalTime() %></h4>
			<h4>price : <%=outwardFlight.getPrice() %> €</h4>
		
			<br>
			
			<h4>outward seats : </h4>
			
			<%
				PrintSeats.printSeatsSelected(out, outwardFlightID, outwardSeats);
			%>
			<br>
		</div>
		
		<%if(returnFlight!=null){ %>
			<div style = "border-style: solid; padding:20px;">
				<h3>Return flight:</h3>
				
				<h4>Departure : <%=returnFlight.getDeparture() %></h4>
				<h4>Arrival : <%=returnFlight.getArrival() %></h4>
				<h4>SepartureDate : <%=returnFlight.getDepartureDate() %></h4>
				<h4>SepartureTime : <%=returnFlight.getDepartureTime() %></h4>
				<h4>ArrivalDate : <%=returnFlight.getArrivalDate() %></h4>
				<h4>ArrivalTime : <%=returnFlight.getArrivalTime() %></h4>
				<h4>price : <%=returnFlight.getPrice() %> €</h4>
				<br>
			
				<h4>return seats :</h4>
				<%
					PrintSeats.printSeatsSelected(out, returnFlightID, outwardSeats);
				%>
			</div>
		<%} %>
		
	</div>

	<% for (int i = 0; i < listOfPassengers.size(); i++) {
		Passenger passenger = listOfPassengers.get(i);
	%>

	<div class="container" id="pInfoForm">
		<h2>Personnal informations:</h2>

		<% if(i+1==1){
			out.println("<h3>Passenger 1(person who is booking): </h3>");
		}else{	
			out.println("<h3>Passenger "+(i+1)+": </h3>");
		}	%>

		<h4><span class="glyphicon glyphicon-user"></span> Firstname: <%=passenger.getName() %></h4>
		<h4><span class="glyphicon glyphicon-user"></span> Surname: <%=passenger.getSurname() %></h4>
		<h4><span class="glyphicon glyphicon-envelope"></span> Title: <%=passenger.getTitle() %></h4>
		<h4><span class="glyphicon glyphicon-calendar"></span> Date of Birth: <%=passenger.getDateOfBirth() %></h4>

	</div>

	<%	}%>

	<div class="container" id="pInfoForm">
		<h2>Others:</h2>

		<h3>Contact informations:</h3>

		<h4><span class="glyphicon glyphicon-envelope"></span> E-mail :
			<%=listOfPassengers.get(0).getEmail()%> </h4>
		<h4><span class="glyphicon glyphicon-phone"></span> Phone number:
			<%=listOfPassengers.get(0).getPhoneNumber() %> </h4>
		<br>

		<h3>Options:</h3>

		<h4>None</h4>
		<br>
	
		<%//TODO : change to button > là c'est dégeu, c'est un input de formulaire %>
		<input type="submit" value="Process to paiement" onclick="window.location.href = '/booking/payment.jsp';">
		
		
	</div>
	<!--Footer -->
	<div id="footer"></div>
</body>

</html>