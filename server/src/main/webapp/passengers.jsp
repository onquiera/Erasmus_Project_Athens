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
	//parameter check
	
	//+ TODO  session check :) > voir si une commande est en cours > sinon redirect vers error session et lien accueil
	
	int numberOfPassengers;
	
	try{
		numberOfPassengers = Integer.parseInt(getParameter("numberOfPassengers"));
		
		
		
		
	}catch(invalidformatexception e ){
		
		out.println("<h1>Parameter error </h1> ");
		out.println("<h1>page should be blocked or redirected to error.jsp </h1> ");
		out.println("<br> ");
		out.println("<br> ");
		out.println("<br> ");
		out.println("<br> ");
		
		//TODO redirect ou bloquer le reste de la page
	}



		
	 %>


	<h3>(on work) Login for autocomplete </h1>
	
	
	<form action="servlet-passenger" action=post>
	
		<h1>1st PASSENGER - Adult : </h1>
		
		
		
		
		
		
		
		<%
			for(int i = 1; i < numberOfPassengers ; i++){
				
				out.println("<h1>Next passenger(number "+ i + ") :");
				
				out.println("First name:<br>");
 				out.println("<input type=\"text\" name=\"firstname\"><br>");
 				out.println("Last name:<br>");
  				out.println("<input type=\"text\" name=\"lastname\">");
				
				
				
				
				
				
			}
		
		 %>
		
		
		
		
		<h1> Contact informations</h1>	
	
	
	
		<input type="submit" value="Submit">


	</form>
	


</body>

</html>