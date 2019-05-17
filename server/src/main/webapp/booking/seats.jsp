<!DOCTYPE html>
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

	
	<%
	
	//TODO plus tard > adapter type d'avion avec rangee de 3 4 etc > + gerer multiples de 4 ..
	//TODO gerer plusieurs sieges selectionnables > en rappelant la meme jsp avec un parametre selectionne et list en session ..
	// bouton boostrap > https://getbootstrap.com/docs/4.0/components/buttons/
	
	//> ou si plusieurs sieges, le gerer avec un formulaire unique et une validation ?
	//> mais difficile de gerer le prix dans ce cas l�, si prix change
	
	
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
	
	
	<h2><%=flightType %> flight</h2>	
	<p> number of seats : <%=numberOfSeats %></p>
	
	
	
	<p> sieges verts : disponibles, sieges rouge : trop tard !</p>

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