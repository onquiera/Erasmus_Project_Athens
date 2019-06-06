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
    <link rel="stylesheet" href="/css/progress/classesOption.css" />

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
						<label>Search <span class="glyphicon glyphicon-ok"></span></label>
					</li>
					<li class="nav-item passive">
						<label>Departing Flight <span class="glyphicon glyphicon-ok"></span></label>
					</li>
					<li class="nav-item passive">
						<label>Return Flight <span class="glyphicon glyphicon-ok"></span></label>
					</li>

					<li class="nav-item passive">
						<label>Seats <span class="glyphicon glyphicon-ok"></span></label>
					</li>

					<li class="nav-item passive">
						<label>Passengers <span class="glyphicon glyphicon-ok"></span></label>
					</li>

					<li class="nav-item passive">
						<label>Extra Options <span class="glyphicon glyphicon-ok"></span></label>
					</li>

					<li class="nav-item active">
						<label>Confirmation <span class="glyphicon glyphicon-arrow-right"></span></label>
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
		
		String flightOption=null;
		String insurance=null;
		
		int totalPrice = -1;
		
		
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
			
			
			flightOption = (String) httpSession.getAttribute("flightOption");
			insurance = (String) httpSession.getAttribute("insurance");
			
			totalPrice = (Integer)httpSession.getAttribute("price");
			
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

		<b> Before processing to payment, please check that everything is correct, especially your contact informations.
		</b>
		<br><br>


		<div style="border-style: solid; padding:20px ;margin-bottom:1px;">
			<h3>Outward flight:</h3>

			<h4>Departure : <%=outwardFlight.getDeparture() %></h4>
			<h4>Arrival : <%=outwardFlight.getArrival() %></h4>
			<h4>DepartureDate : <%=outwardFlight.getDepartureDate() %></h4>
			<h4>DepartureTime : <%=outwardFlight.getDepartureTime() %></h4>
			<h4>ArrivalDate : <%=outwardFlight.getArrivalDate() %></h4>
			<h4>ArrivalTime : <%=outwardFlight.getArrivalTime() %></h4>
			<h4>price : <%=outwardFlight.getPrice() %> € per person</h4>

			<br>

			<h4>outward seats : </h4>

			<%
				PrintSeats.printSeatsSelected(out, outwardFlightID, outwardSeats);
			%>
			<br>
		</div>

		<%if(returnFlight!=null){ %>
		<div style="border-style: solid; padding:20px;">
			<h3>Return flight:</h3>

			<h4>Departure : <%=returnFlight.getDeparture() %></h4>
			<h4>Arrival : <%=returnFlight.getArrival() %></h4>
			<h4>DepartureDate : <%=returnFlight.getDepartureDate() %></h4>
			<h4>DepartureTime : <%=returnFlight.getDepartureTime() %></h4>
			<h4>ArrivalDate : <%=returnFlight.getArrivalDate() %></h4>
			<h4>ArrivalTime : <%=returnFlight.getArrivalTime() %></h4>
			<h4>price : <%=returnFlight.getPrice() %> € per person </h4>
			<br>

			<h4>return seats :</h4>
			<%
					PrintSeats.printSeatsSelected(out, returnFlightID, returnSeats);
				%>
		</div>
		<%} %>

	</div>

	<% for (int i = 0; i < listOfPassengers.size(); i++) {
		Passenger passenger = listOfPassengers.get(i);
		String title="";
		if(passenger.getTitle()==0){
			title="Mrs";
		}else{
			title="Mr";
		}
	%>

	<div class="container" id="pInfoForm">
		<h2>Personnal informations:</h2>

		<% if(i+1==1){
			out.println("<h3>Passenger 1(person who is booking): </h3>");
		}else{	
			out.println("<h3>Passenger "+(i+1)+": </h3>");
		}	
		%>

		<h4><span class="glyphicon glyphicon-envelope"></span> Title: <%=title %></h4>
		<h4><span class="glyphicon glyphicon-user"></span> Firstname: <%=passenger.getFirstName()%></h4>
		<h4><span class="glyphicon glyphicon-user"></span> Surname: <%=passenger.getSurname() %></h4>
		<h4><span class="glyphicon glyphicon-calendar"></span> Date of Birth: <%=passenger.getDateOfBirth() %></h4>

	</div>

	<%	}%>

	<div class="container" id="pInfoForm">
		<h2>Others:</h2>

		<h3>Contact informations:</h3>
		<div style="border:solid ;padding-left: 5px;">
			<h4><span class="glyphicon glyphicon-envelope"></span> E-mail :
				<%=listOfPassengers.get(0).getEmail()%> </h4>
			<h4><span class="glyphicon glyphicon-phone"></span> Phone number:
				<%=listOfPassengers.get(0).getPhoneNumber() %> </h4>
			<br>
		</div>

		<h3>Flight option:</h3>
		
		<%if(flightOption.equals("Eco")){ %>
			<div class="col-xl-4">
	              <div class="single-price">
	                  <div class="price-title">
	                      <h4>Eco</h4>
	                  </div>
	                  <div class="price-tag">
	                      <h2>Basic option</h2>
	                  </div>
	                  <div class="price-item">
	                      <ul>
	                          <li>1 hand baggage (12kg)</li>
	                          <li>Seat choice</li>
	                          <li>Meals</li>
	                          <li>Rebooking not possible</li>
	                          <li>No refund if you missed the flight</li>
	                      </ul>
	                  </div>
	              </div>
	          </div>
	       <%}else if(flightOption.equals("EcoFlex")){ %>   
                            <div class="col-xl-4">
                                <div class="single-price">
                                    <div class="price-title">
                                        <h4>ECO FLEX</h4>
                                    </div>
                                    <div class="price-tag">
                                        <h2>25€</h2>
                                    </div>
                                    <div class="price-item">
                                        <ul>
                                            <li>1 hand baggage (12kg)</li>
                                            <li>1 check-in baggage (20kg)</li>
                                            <li>Seat choice</li>
                                            <li>Meals</li>
                                            <li>Change fee</li>
                                            <li>No refund if you missed the flight</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
    	<%}else{ %>                        
                <div class="col-xl-4">
                    <div class="single-price">
                        <div class="price-title">
                            <h4>business</h4>
                        </div>
                        <div class="price-tag">
                            <h2>50€</h2>
                        </div>
                        <div class="price-item">
                            <ul>
                                <li>2 hand baggage (12kg)</li>
                                <li>1 check-in baggage (20kg)</li>
                                <li>Seat choice</li>
                                <li>Meals</li>
                                <li>Change free</li>
                                <li>Refund if you missed the flight</li>
                                <li>Priority Check-In</li>
                                <li>Priority Security</li>
                                <li>Priority Boarding</li>
                            </ul>
                        </div>
                    </div>
                </div>
		<%} %>
		
		
		<br><br>
		<h3>Insurance:</h3>
		
		<%if(insurance.equals("yes")){ %>
			<div class="form-check" style = "border-style:solid; width:50%;">
	             <span class="form-check-label">
	                 <span style="color: #ff6600; font-weight: bold;">Comprehensive travel Insurance</span>
	                 (16€ per person)
	                 <br>
	                 <span>
	                     Covers:
	                     <ul>
	                         <li>
	                             Medical and hospitalization expenses up to 150.000 Euros
	                         </li>
	                         <li>
	                             Damage/loss or theft of luggage up to 1.000 Euros
	                         </li>
	                         <li>
	                             Departure cancellation due to sickness or accident up to 500 Euros
	                         </li>
	                         <li>
	                             24 hour assistance abroad
	                         </li>
	                     </ul>
	                 </span>
	             </span>
	         </div>
		<%}else{ %>
		
			<h4 style="margin-left:40px;">Not taken</h4>
		
		<%} %>
		<br>

		<h3>Total: <%=totalPrice %> €</h3>
		<br>
		
		<input type="submit" value="Process to paiement" onclick="window.location.href = '/booking/payment.jsp';">


	</div>
	<!--Footer -->
	<div id="footer"></div>
</body>

</html>