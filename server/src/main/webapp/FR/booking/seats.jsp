<!DOCTYPE html>
<%@page import="seats.SeatsDAO"%>
<%@page import="booking.Booking"%>
<%@page import="java.util.List"%>
<%@page import="flights.Airport"%>
<%@page import="java.util.ArrayList"%>
<%@page import="flights.AirportsDAO"%>
<html lang="en">

<head>

	<link rel="shortcut icon" type="image/png" href="/resources/firstlogo.png" />
	<title>Seats</title>
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
		<a href="/FR/index.jsp"><img src="/resources/logo.png" alt="Insert logo here" id="home"></a>
	</div>

	<nav id="progressBar" class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar10">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbar10">
				<ul class="navbar-nav nav-fill w-100">
					<li class="nav-item passive">
						<label>Recherche <span class="glyphicon glyphicon-ok"></span></label>
					</li>
					<li class="nav-item passive">
						<label>Departing Flight <span class="glyphicon glyphicon-ok"></span></label>
					</li>
					<li class="nav-item passive">
						<label>Return Flight <span class="glyphicon glyphicon-ok"></span></label>
					</li>

					<li class="nav-item active">
						<label>Seats <span class="glyphicon glyphicon-arrow-right"></span></label>
					</li>

					<li class="nav-item">
						<label>Passengers <span class="glyphicon glyphicon-arrow-right"></span></label>
					</li>

					<li class="nav-item">
						<label>Extra Options <span class="glyphicon glyphicon-arrow-right"></span></label>
					</li>

					<li class="nav-item">
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

		<%
			HttpSession httpSession = request.getSession(false);
			//check if session is valid
			if(httpSession==null || !request.isRequestedSessionIdValid() ){
				response.sendRedirect("/error/sessionError.html");
			}
			int numberOfPassengers = (Integer)httpSession.getAttribute("numberOfPassengers");
			int price = (Integer)httpSession.getAttribute("price");
			
			String flightType = request.getParameter("flightType");
			
			
			String flightID = null;
			if(flightType.equals("outward")){
				flightID = (String)httpSession.getAttribute("outwardFlightID");
			}else if(flightType.equals("return")){
				flightID = (String)httpSession.getAttribute("returnFlightID");
			}else{
				response.sendRedirect("/error/parameterError.html?error=flightType+incorrect+on+seats_jsp");
			}
				
				
			SeatsDAO seatsDAO = new SeatsDAO();
			int flightsNumberOfSeats = seatsDAO.numberOfSeats(flightID);
			ArrayList<String> alreadyBookedSeats = seatsDAO.findBookedSeatsInFlight(flightID);
			int rowSize = 4;
			String convert = "ABCDEFGHIJKL";
			
			ArrayList<String> selectedSeats = (ArrayList<String>)session.getAttribute("selectedSeats");
			if(selectedSeats==null) {
				selectedSeats = new ArrayList<>();
			}
			int seatsLeftToChoose = numberOfPassengers-selectedSeats.size();
			
			//seat selected management
			String seatSelected = request.getParameter("seatSelected");
			
			if(seatSelected!=null && seatSelected.length()>0){
				if(selectedSeats.contains(seatSelected)){
					selectedSeats.remove(seatSelected);
					seatsLeftToChoose++;
				}else if(seatsLeftToChoose>0){
					selectedSeats.add(seatSelected);
					seatsLeftToChoose--;
				}
			}
		%>
	
	<div id="priceArea">
		<h4>Total: <%=price %> €</h4>
	</div>
		<h2><u><b><%=flightType %></b></u> flight</h2>

		<h3>Number of seats left to choose : <%=seatsLeftToChoose%></h3>
		<div class="container" id="pInfoForm">

			<div id="seatChoice">
			
			<table style = "border: solid darkgray;">
				<%
				//seats :
				
				for (int i = 1; i <= flightsNumberOfSeats / rowSize; i++) {
					out.println("<tr>");
					for (int j = 0; j < rowSize; j++) {
						String seat = i + "" + convert.charAt(j);
						String linkToseatsjsp= "/FR/booking/seats.jsp?lang=fr&seatSelected=" + seat +"&flightType=" + flightType;
						
						//middle space
						if(j==rowSize/2){
							out.println("<td style = \"padding : 0px 10px 0 40px ;\">");
						}else{
							out.println("<td style = \"padding : 0 10px 0 10px;\">");
						}
						
						
						
						if (alreadyBookedSeats.contains(seat)) {
							//seat already booked so blocked
							out.println("&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-danger\" disabled>" + seat
									+ "</button>");
							
						} else if(selectedSeats.contains(seat)){
							//seat selected by customer
							out.println(
									"&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-primary\" onclick=\"window.location.href = '"
											+ linkToseatsjsp + "';\"    >" + seat + "</button>");
						}else {
							//seat not selected
							 
							if(seatsLeftToChoose==0){
								//if customer has chosen all his seats > he can't add one more
								out.println("&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-success\" disabled>" + seat
									+ "</button>");
							}else{
								out.println(
									"&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-success\" onclick=\"window.location.href = '"
											+ linkToseatsjsp + "';\"    >" + seat + "</button>");
							}
						}
						
						out.println("</td>");
					}
					out.println("</tr>");
				}
				
				session.setAttribute("selectedSeats", selectedSeats);
			
				%>
				
				</table>
				
				<!-- validation button : -->

				<% String validateLink = "/servlet-BookSeats?lang=fr&flightType=" + flightType;%>
				<br>
				
				<span style="margin-left : 82px;"> </span> <button type="button" class="btn btn-success"
					style="margin-top : 2rem; margin-left:10%;" onclick="window.location.href = '<%=validateLink %>';"
					<%if(seatsLeftToChoose>0){out.println("disabled");}%>>
					<h4>validate</h4> </button>
				<br>
			</div>
		</div>

		<div id=seatLegend>
			<div class="container" id="pInfoForm">
				<h4>Legend : </h4>

				&nbsp; <button type="button" class="btn btn-danger">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </button> : already
				booked

				&nbsp; <button type="button" class="btn btn-primary"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </button> :
				selected(click to unselect)

				&nbsp; <button type="button" class="btn btn-success"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </button> :
				disponible(click to select)
			</div>
		</div>
	</div>

	<!--Footer -->
	<div id="footer"></div>



</body>

</html>