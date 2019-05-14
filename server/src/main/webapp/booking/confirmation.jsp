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
<title>AirVacation</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/homeStyle.css" />
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
	
	
	<h1>Booking confirmation</h1>
	
	<%
	ArrayList<Passenger> listOfPassengers=null;
	
		try{
			HttpSession httpSession = request.getSession(false);
			//check if session is valid
			if(httpSession==null || !request.isRequestedSessionIdValid() ){
				System.out.println("\n\n\n session is invalid \n\n\n");
				response.sendRedirect("/error/sessionError.html");
			}

			//PARAMETERS management
			listOfPassengers = (ArrayList<Passenger>)httpSession.getAttribute("listOfPassengers");
			
			

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
		
	<% for (int i = 0; i < listOfPassengers.size(); i++) {
	
		Passenger passenger = listOfPassengers.get(i);
	%>
		<h2>Passengers : </h2>	
		
		<h3>Passenger <%=i+1 %>: </h3>
			<p>Firstname : <%=passenger.getName() %></p>
			<p>Surname : <%=passenger.getSurname() %></p>
			<p>Title : <%=passenger.getTitle() %></p>
			<p>Date of Birth : <%=passenger.getDateOfBirth() %></p>
				
			
	<%	}%>
	
	
	
		
		
		
	 <br>
	 <h1> Your booking informations : </h1>
	 
	 <h3>outward flight</h3>
	 <h3>(return flight)</h3>
	 <h3>Passengers : </h3>
	 
	 <%
	 
	  %>
	 
	 
	 <h3>Seats : </h3>
	 <h3>Other options: </h3>  
	 
	 
	
	<button type="button" class="btn btn-success" onclick="window.location.href = '../servlet-Confirmation';"> validate </button>
	
	

</body>

</html>