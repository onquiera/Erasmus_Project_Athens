<!DOCTYPE html>
<%@page import="users.Passenger"%>
<%@page import="seats.SeatsDAO"%>
<%@page import="flights.Booking"%>
<%@page import="java.util.List"%>
<%@page import="flights.Airport"%>
<%@page import="java.util.ArrayList"%>
<%@page import="flights.AirportsDAO"%>
<html lang="en">

<head>

	<link rel="shortcut icon" type="image/png" href="/resources/firstlogo.png" />
	<title>confirmation</title>
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

	<h1>Booking confirmation</h1>

	<%
	ArrayList<Passenger> listOfPassengers=null;
	String departure=null;
	String destination=null;
		try{
			HttpSession httpSession = request.getSession(false);
			//check if session is valid
			if(httpSession==null || !request.isRequestedSessionIdValid() ){
				System.out.println("\n\n\n session is invalid \n\n\n");
				response.sendRedirect("/error/sessionError.html");
			}

			//PARAMETERS management
			listOfPassengers = (ArrayList<Passenger>)httpSession.getAttribute("listOfPassengers");
			 departure = (String)httpSession.getAttribute("departure");
			 destination = (String) httpSession.getAttribute("destination");
			
		}catch(java.lang.NumberFormatException e ){
			e.printStackTrace();
			response.sendRedirect("/error/parameterError.html");
		}catch(NullPointerException e ){
			e.printStackTrace();
			response.sendRedirect("/error/parameterError.html");
		}catch(Exception e2 ){
			e2.printStackTrace();
			response.sendRedirect("/error/error.html");
		}
		
	%>

	<h1> Your booking informations : </h1>

	<h3>outward flight</h3>
	<h4>departure : <%=departure %> </h4>
	<h4>destination : <%=destination %> </h4>
	<h3>(return flight)</h3>

	<% for (int i = 0; i < listOfPassengers.size(); i++) {
		Passenger passenger = listOfPassengers.get(i);
	%>
	<h2>Personnal informations : </h2>

	<% if(i+1==1){
			out.println("<h3>Passenger 1(person who is booking) : </h3>");
		}else{	
			out.println("<h3>Passenger "+(i+1)+" : </h3>");
		}	%>

	<p><label><span class="glyphicon glyphicon-user"></span> Firstname : <%=passenger.getName() %></p>
	<p><label><span class="glyphicon glyphicon-user"></span> Surname : <%=passenger.getSurname() %></p>
	<p><span class="glyphicon glyphicon-envelope"></span> Title : <%=passenger.getTitle() %></p>
	<p><span class="glyphicon glyphicon-calendar"></span> Date of Birth : <%=passenger.getDateOfBirth() %></p>


	<%	}%>

	<h2>Contact informations</h2>

	<p><label><span class="glyphicon glyphicon-envelope"></span></label> E-mail :
		<%=listOfPassengers.get(0).getEmail()%> </p>
	<p><label><span class="glyphicon glyphicon-phone"></span></label> Phone number(optional):
		<%=listOfPassengers.get(0).getPhoneNumber() %> </p>


	<br><br>
	<h3>Seats : </h3>
	<br>
	<h3>Other options: </h3>

	<button type="button" class="btn btn-success" onclick="window.location.href = '../servlet-Confirmation';"> validate
	</button>


	<!--Footer -->
	<div id="footer"></div>
</body>

</html>