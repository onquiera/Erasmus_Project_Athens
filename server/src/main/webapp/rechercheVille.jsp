<!DOCTYPE html>
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
<datalist id="airports">
			<%
			AirportsDAO dao = new AirportsDAO();
			List<Airport> listeAirports = dao.findAll();
			
			for (Airport airport : listeAirports) {
				out.println("<option value=\""+ airport.getName()+"\">");
			}	
			
			 %>
</datalist>
		

<h1>Recherche de vol : </h1>


	<form action="/servlet-SearchFlight" method="get">
		departure airport : 
		<input list="airports" name="departure" value ="Lille Airport"><br> 
		destination :
		<input list="airports" name="destination" value ="Madrid Barajas"><br> 
		departure date:
		<input type="date" name="departureDate" value="2019-04-22" min="2019-01-01" max="2020-12-31"><br> 
		return date :
		<input type="date" name="returnDate" value="2019-06-15" min="2019-01-01" max="2020-12-31"><br> 
		number of people : 
		<input type="number" name="numberOfPeople" value="1" min="1" max="30">
		
	
		
		<br> 
		<input type="submit" value="recherche vol">
	</form>




</body>

</html>