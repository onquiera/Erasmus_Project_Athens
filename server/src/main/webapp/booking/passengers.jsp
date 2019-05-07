<!DOCTYPE html>
<%@page import="seats.SeatsDAO"%>
<%@page import="flights.Booking"%>
<%@page import="java.util.List"%>
<%@page import="flights.Airport"%>
<%@page import="java.util.ArrayList"%>
<%@page import="flights.AirportsDAO"%>
<%@page import="connexion.UsersDAO"%>
<html lang="en">

<head>
<title>AirVacation</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/homeStyle.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!--
	<script type="module" src="build/main.js"></script>
	<script type="module" src="js/Popup/Login.js"></script>
-->
</head>
<body>

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
	
		<h1>Passengers : </h1>
	
	<!-- TODO  Login for autocomplete -->
	
	
	<form action="servlet-passengers" action=post>
			
		<%
		
		if(numberOfPassengers==-1){
			System.out.println("\n\nsession number of passengers error\n");
			response.sendRedirect("/error/parameterError.html");
		}
		
		 
			for(int i = 1; i <= numberOfPassengers ; i++){
				
				out.println("<h3>Passenger "+ i + " : </h3>");
				out.println("Title:<br>");
				//TODO change to select box 
 				out.println("<input type=\"text\" name=\"title\"><br>");
				out.println("Date of Birth:<br>");
 				out.println("<input type=\"text\" name=\"dateOfBirth\"><br>");
				out.println("First name:<br>");
 				out.println("<input type=\"text\" name=\"firstname\"><br>");
 				out.println("Last name:<br>");
  				out.println("<input type=\"text\" name=\"lastname\">");
				
			} 
		
		 %>
		
		
		
		
		<h2> Contact informations</h2>	

 			phone number:<br>
  			<input type="text" name="email"><br>

 			email:<br>
  			<input type="text" name="email"><br>
  			<!-- TODO check if they are the same (JS code) -->
  			confirm email :<br>
  			<input type="text" name="email"><br>
			
	

		<h2>Insurance(recommanded)</h2>	
		<h3>to come</h3>
	
	
		<p>checkbox - I have read the <a href="/informations/legalConditions.html">Legal notice</a>. I accept the full conditions of sale and the fare rules.</p>
	
		
		<button type="submit" class="btn btn-primary">Submit</button>
		
		
		<br>
		<br>
	</form>
	


</body>

</html>