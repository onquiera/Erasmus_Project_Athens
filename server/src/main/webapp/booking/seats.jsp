<!DOCTYPE html>
<%@page import="seats.SeatsDAO"%>
<%@page import="flights.Booking"%>
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

					<li class="nav-item active">
						<label>Seats</label>
					</li>

					<li class="nav-item">
						<label>Passengers</label>
					</li>

					<li class="nav-item">
						<label>Extra Options</label>
					</li>

					<li class="nav-item">
						<label>Confirmation</label>
					</li>

					<li class="nav-item">
						<label>Payment</label>
					</li>


				</ul>
			</div>
		</div>
	</nav>


	<%
	
	//TODO plus tard > adapter type d'avion avec rangee de 3 4 etc > + gerer multiples de 4 ..
	//TODO gerer plusieurs sieges selectionnables > en rappelant la meme jsp avec un parametre selectionne et list en session ..
	// bouton boostrap > https://getbootstrap.com/docs/4.0/components/buttons/
	
	//> ou si plusieurs sieges, le gerer avec un formulaire unique et une validation ?
	//> mais difficile de gerer le prix dans ce cas la, si prix change
	
	
		HttpSession httpSession = request.getSession(false);
		//check if session is valid
		if(httpSession==null || !request.isRequestedSessionIdValid() ){
			System.out.println("\n\n\n session is invalid \n\n\n");
			response.sendRedirect("/error/sessionError.html");
		}
		
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
		ArrayList<String> alreadyBookedSeats = seatsDAO.bookedSeats(flightID);
		int rowSize = 4;
		String convert = "ABCDEFGHIJKL";
		
		
		
		int numberOfPassengers = (Integer)httpSession.getAttribute("numberOfPassengers");
		
		
		
		
		
		//TODO gerer siege en parametre si il y en a un
		/*
		si siege deja selectionn�> le virer de la liste
		
		> si siege libre > le choisir
		
		> si siege deja reserv� ou incorrect > ne rien faire
		
		
		
		
		
		
		*/
		
		
		//inactive > seat already booked
		
		//green > seats not booked
		//red but disablable > seats choosed but which can be canceled
		
		
		ArrayList<String> selectedSeats = (ArrayList<String>)session.getAttribute("selectedSeats");
		if(selectedSeats==null) {
			selectedSeats = new ArrayList<>();
		}
		int seatsLeftToChoose = numberOfPassengers-selectedSeats.size();
		
		
		
		
		
		
		//gestion du siege choisi
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

	<h2><u><b><%=flightType %></b></u> flight</h2>
	
	
	
	<h3>Number of seats left to choose : <%=seatsLeftToChoose%></h3>
	

<!-- validation button : -->
		
			<% String validateLink = "/servlet-BookSeats?flightType=" + flightType;%>
			
			<span style = "margin-left : 100px;"> </span>  <button type="button" class="btn btn-success" 
			onclick="window.location.href = '<%=validateLink %>';" 
			<%if(seatsLeftToChoose>0){out.println("disabled");}%>> validate </button>
			<br>


	<%
		//seats :
		for (int i = 1; i <= flightsNumberOfSeats / rowSize; i++) {
			out.println("<br>");
			for (int j = 0; j < rowSize; j++) {
				String seat = i + "" + convert.charAt(j);
				
				String linkToseatsjsp= "/booking/seats.jsp?seatSelected=" + seat +"&flightType=" + flightType;
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
			}
		}
		out.println("<br>");
		
		session.setAttribute("selectedSeats", selectedSeats);
		
	%>
	
	<br><br>
	<div id = seatLegend>
	<h4>Legend : </h4>
	
	&nbsp; <button type="button" class="btn btn-danger">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </button> : already booked

	&nbsp; <button type="button" class="btn btn-primary"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </button> : selected(click to unselect)

	&nbsp; <button type="button" class="btn btn-success"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </button> : disponible(click to select)

	</div>
	
	<br><br>


</body>

</html>