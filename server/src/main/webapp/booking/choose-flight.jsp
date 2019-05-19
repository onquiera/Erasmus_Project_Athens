<!DOCTYPE html>
<%@page import="java.beans.DesignMode"%>
<%@page import="connexion.DS"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<html lang="en">

<head>

	<link rel="shortcut icon" type="image/png" href="/resources/firstlogo.png" />
	<title>Booking</title>
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

<%
String flight = request.getParameter("flight");%>

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

					<li class="nav-item <%

					if(flight.equals("outward")) {
						out.println("active");
					}else{
						out.println("passive");
					}%>">
						<label>Departing Flight</label>
					</li>
					<li class="nav-item <%

					if(!flight.equals("outward")) {
						out.println("active");
					}%>">
						<label>Return Flight</label>
					</li>

					<li class="nav-item">
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
			try (Connection con = DS.getConnection()) {
			
				HttpSession httpSession = request.getSession(false);
				//check if session is valid
				if(httpSession==null || !request.isRequestedSessionIdValid() ){
					System.out.println("\n\n\n session is invalid \n\n\n");
					response.sendRedirect("/error/sessionError.html");
				}
	
				String departure = (String)httpSession.getAttribute("departure");
				String destination = (String)httpSession.getAttribute("destination");
				String departureDate = (String)httpSession.getAttribute("departureDate");
				String returnDate = (String)httpSession.getAttribute("returnDate");
				
				//requete de recherche
				
				PreparedStatement ps=null;
				java.sql.Date flightDate=null;
				if(flight.equals("outward")) {

					// departure date from string to sql
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date departureDateUtil = dateFormat.parse(departureDate);
					flightDate = new java.sql.Date(departureDateUtil.getTime());

					// -----------------------------------------------------------------------------------
					// research in database

					String query = "Select flightID, a1.name as departure, a2.name as arrival,departureDate, departureTime, arrivalDate, arrivalTime, placesLeft "
							+ "FROM flights fl " + "LEFT JOIN airports a1 ON fl.departurecitycode = a1.code "
							+ "LEFT JOIN airports a2 ON fl.arrivingcitycode = a2.code " + "WHERE a1.name = ? "
							+ "and a2.name = ? " + "and fl.departuredate=?";
					ps = con.prepareStatement(query);
					ps.setString(1, departure);
					ps.setString(2, destination);
					ps.setDate(3, flightDate);

				out.println("<div id=\"textArea2\"><h1>Available <u>" + flight + "</u> flights </h1>");
				
				}else { //RETURN FLIGHT
					// return date from string to sql
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date returnDateUtil = dateFormat.parse(returnDate);
					flightDate = new java.sql.Date(returnDateUtil.getTime());

					// -----------------------------------------------------------------------------------
					// research in database

					String query = "Select flightID, a1.name as departure, a2.name as arrival,departureDate, departureTime, arrivalDate, arrivalTime, placesLeft "
							+ "FROM flights fl " + "LEFT JOIN airports a1 ON fl.departurecitycode = a1.code "
							+ "LEFT JOIN airports a2 ON fl.arrivingcitycode = a2.code " + "WHERE a1.name = ? "
							+ "and a2.name = ? " + "and fl.departuredate=?";
					ps = con.prepareStatement(query);
					ps.setString(1, destination);
					ps.setString(2, departure);
					ps.setDate(3, flightDate);
									


				out.println("<div id=\"textArea2\"><h1>Available <u>" + flight + "</u> flights </h1>");
	
				}

				ResultSet rs = ps.executeQuery();

				// out.println("|||| ps :"+ ps+" ||||");

				ResultSetMetaData rsmd = rs.getMetaData();

				out.println("<h2>On date: " + flightDate + "</h2></div>");

				
				while (rs.next()) {

				

					// titre des colonnes
					out.println("<div class=\"container\" id=\"pInfoForm\">");


				
					//for (int i = 1; i <= rsmd.getColumnCount(); i++) {

					//		out.println(rsmd.getColumnLabel(i) + ": " + rs.getString(i) + "  ");

					//}
					
					out.println("<div  class=\"flightsInfos\"><h4 class=\"h4ChooseFlight\"> ");
					//Affichage des données du vol
					
					//Enlever les secondes-----
					
					String dateD = rs.getString("departureTime");
					dateD = dateD.substring(0,5);
					
					String dateA = rs.getString("arrivalTime");
					dateA = dateA.substring(0,5);

					//-----------------------------------------------------------------------------------

					out.println(dateD+" - " + dateA +"<br>");
					out.println("From: " + rs.getString("departure")+"<br>");
					out.println("To: " + rs.getString("arrival")+"<br>");
					out.println("</div>  ");
					//	out.println("Places left: " + rs.getString("placesLeft")+"<br>");
					out.println("</h4>");

					//bouton de validation
					//gestion si vol retour ou non
					out.println("<div  class=\"confirmButton\">  ");
					out.println(""
							+ "<form action=\"/servlet-SearchFlight\" method=\"get\">");
					//reste des options du bouton
					out.println(""
							+ "<input type=\"hidden\" name=\"flightType\" value=\"" + flight + "\">"
							+ "<input type=\"hidden\" name=\"flightID\" value=\"" + rs.getString("flightID") + "\">"
							+ "<input id=\"next\" class=\"btn btn-primary\" type=\"submit\" value=\"Choose this flight \">"
							+ "	</form> </div> </div>");
				}


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


	<!--Footer -->
	<div id="footer"></div>
</body>

</html>