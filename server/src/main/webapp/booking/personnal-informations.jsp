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
	<title>P.infos</title>
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
	<nav id="progBar">*

	</nav>
	<%
	int numberOfPassengers=-1;
	
	//parameter check
	try{
		HttpSession httpSession = request.getSession(false);
		//check if session is valid
		if(httpSession==null || !request.isRequestedSessionIdValid() ){
			System.out.println("\n\n\n session is invalid \n\n\n");
			response.sendRedirect("/error/sessionError.html");
		}
		numberOfPassengers = (Integer)httpSession.getAttribute("numberOfPassengers");
		
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


	<!-- TODO  Login for autocomplete -->

	<div class="container">
		<div class="row">
			<div class="col-md-6 login-form">



				<form action="/servlet-PersonnalInformations" method="get" role="form class=form">

					<%
			
			if(numberOfPassengers==-1){
				System.out.println("\n\nsession number of passengers error\n");
				response.sendRedirect("/error/parameterError.html");
			}
			%>

					<h1>Personnal Informations</h1>

					<h2>Passengers informations(<%=numberOfPassengers %> passengers) :</h2>

					<% for(int i = 1; i < numberOfPassengers+1; i++) { %>

					<%
				if(i==1){
					out.println("<h3>Passenger 1(person who is booking) : </h3>");
				}else{	
					out.println("<h3>Passenger "+i+" : </h3>");
				}	
			 %>
					<div class="form-group">
						<label><span class="glyphicon glyphicon-envelope"></span> Title</label>
						<select required name="passenger-<%=i%>-title">
							<option selected value="0">Mrs/Miss</option>
							<option value="1">Mr</option>
						</select>
					</div>

					<div class="form-group">
						<label><span class="glyphicon glyphicon-user"></span> First Name</label>
						<input value="a" required type="text" class="form-control" name="passenger-<%=i%>-name"
							placeholder="Enter First Name">
					</div>

					<div class="form-group">
						<label><span class="glyphicon glyphicon-user"></span> Last Name</label>
						<input value="a" required type="text" class="form-control" name="passenger-<%=i%>-surname"
							placeholder="Enter Last Name">
					</div>

					<div class="form-group">
						<label><span class="glyphicon glyphicon-calendar"></span> Date of birth</label>
						<input required type="date" class="form-control" name="passenger-<%=i%>-dateOfBirth"
							value="0005-05-05" max="2010-01-01" placeholder="dd-mm-yyyy">
					</div>
					<% } %>


					<br><br>

					<h2>Contact informations</h2>

					<div class="form-group">
						<label><span class="glyphicon glyphicon-envelope"></span> E-mail</label>
						<input value="a@g" required type="email" class="form-control" name="email"
							placeholder="Enter email">
					</div>

					<div class="form-group">
						<label><span class="glyphicon glyphicon-phone"></span> Phone number(optional)</label>
						<input type="tel" class="form-control" name="phoneNumber" placeholder="Enter phone number">
					</div>

					<br><br>

					<h2><span class="glyphicon glyphicon-heart"></span> Insurance(recommanded)</h2>
					<p>to come</p>


					<br>
					<h3>
						<div class="checkbox">
							<label><input required type="checkbox" value="">I accept the legal conditions of <a
									href="legalConditions.html">Air Vacation</a></label>
						</div>
					</h3>

					<button type="submit" class="btn btn-primary">Pay</button>


					<br> <br>
				</form>
			</div>
		</div>
	</div>

	
	<!--Footer -->
	<div id="footer"></div>
</body>

</html>