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
	<meta charset="utf-8">
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

		int numberOfSeats = seatsDAO.numberOfSeats(flightID);
		ArrayList<String> listSeats = seatsDAO.bookedSeats(flightID);
		int longueurRangees = 4;
		String convert = "ABCDEFGHIJKL";
	%>


	<h2><u><b><%=flightType %></b></u> flight</h2>
	<p> number of seats for this flight: <%=numberOfSeats %></p>


	<h3> passenger 1's seat : </h3> <br>
	(only one seat selectable for now) <br>

	<%
		for (int i = 1; i <= numberOfSeats / longueurRangees; i++) {
			out.println("<br>");
			for (int j = 0; j < longueurRangees; j++) {
				String seat = i + "" + convert.charAt(j);
					if (!listSeats.contains(seat)) {
					String link = "/servlet-BookSeats?seat=" + seat +"&flightType=" + flightType;
					out.println(
							"&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-success\" onclick=\"window.location.href = '"
									+ link + "';\"    >" + seat + "</button>");
				} else {
					out.println("&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-danger\" disabled>" + seat
							+ "</button>");
				}
			}
		}
		out.println("<br>");
	%>



</body>

</html>