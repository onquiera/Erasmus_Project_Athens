<!DOCTYPE html>
<%@page import="flights.FlightsDAO"%>
<%@page import="flights.FlightWithDetails"%>
<%@page import="seats.PrintSeats"%>
<%@page import="users.Passenger"%>
<%@page import="seats.SeatsDAO"%>
<%@page import="booking.Booking"%>
<%@page import="java.util.List"%>
<%@page import="flights.Airport"%>
<%@page import="java.util.ArrayList"%>
<%@page import="flights.AirportsDAO"%>
<html lang="en">

<head>

	<link rel="shortcut icon" type="image/png" href="/resources/firstlogo.png" />
	<title>Confirmation</title>
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
    <link rel="stylesheet" href="/css/progress/classesOption.css" />

</head>

<body>
	<div id="logo">
		<a href="/FR/index.jsp"><img src="/resources/logo.png" alt="Insert logo here" id="home"></a>
	</div>

	<nav id="progressBar" class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar10">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbar10">
				<ul class="navbar-nav nav-fill w-100">
					<li class="nav-item passive">
						<label>Recherche <span class="glyphicon glyphicon-ok"></span></label>
					</li>
					<li class="nav-item passive">
						<label>Vol aller <span class="glyphicon glyphicon-ok"></span></label>
					</li>
					<li class="nav-item passive">
						<label>Vol retour <span class="glyphicon glyphicon-ok"></span></label>
					</li>

					<li class="nav-item passive">
						<label>Sièges <span class="glyphicon glyphicon-ok"></span></label>
					</li>

					<li class="nav-item passive">
						<label>Passagers <span class="glyphicon glyphicon-ok"></span></label>
					</li>

					<li class="nav-item passive">
						<label>Options supplémentaires <span class="glyphicon glyphicon-ok"></span></label>
					</li>

					<li class="nav-item active">
						<label>Confirmation <span class="glyphicon glyphicon-arrow-right"></span></label>
					</li>

					<li class="nav-item">
						<label>Paiement</label>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div id="textArea2">
		<h1>Votre réservation :</h1>
		<br>
	</div>

	<%
		ArrayList<Passenger> listOfPassengers = null;
		String departure = null;
		String destination = null;
		String outwardFlightID = null;
		String returnFlightID = null;
		ArrayList<String> outwardSeats=null;
		ArrayList<String> returnSeats=null;
		FlightWithDetails outwardFlight=null;
		FlightWithDetails returnFlight=null;
		
		String flightOption=null;
		String insurance=null;
		
		int totalPrice = -1;
		
		
		FlightsDAO flightDAO = new FlightsDAO();
		
		try {
			HttpSession httpSession = request.getSession(false);
			//check if session is valid
			if (httpSession == null || !request.isRequestedSessionIdValid()) {
					response.sendRedirect("/error/sessionError.html");
			}

			//PARAMETERS management
			listOfPassengers = (ArrayList<Passenger>) httpSession.getAttribute("listOfPassengers");
			departure = (String) httpSession.getAttribute("departure");
			destination = (String) httpSession.getAttribute("destination");
			outwardFlightID=(String) httpSession.getAttribute("outwardFlightID");
			outwardFlight = flightDAO.findFlight(outwardFlightID);
			
			returnFlightID=(String) httpSession.getAttribute("returnFlightID");
			returnFlight = flightDAO.findFlight(returnFlightID);
			
			outwardSeats = (ArrayList<String>)httpSession.getAttribute("outward-seats");
			returnSeats = (ArrayList<String>)httpSession.getAttribute("return-seats");
			
			
			flightOption = (String) httpSession.getAttribute("flightOption");
			insurance = (String) httpSession.getAttribute("insurance");
			
			totalPrice = (Integer)httpSession.getAttribute("price");
			
		} catch (java.lang.NumberFormatException e) {
			e.printStackTrace();
			response.sendRedirect("/error/parameterError.html");
		} catch (NullPointerException e) {
			e.printStackTrace();
			response.sendRedirect("/error/parameterError.html");
		} catch (Exception e2) {
			e2.printStackTrace();
			response.sendRedirect("/error/error.html");
		}
	%>
	<div class="container" id="pInfoForm">
		<h2>Informations sur votre réservation:</h2>

		<b> Avant de procéder au paiement, vérifiez que toutes les informations sont correctes, en particulier les informations de contact.
		</b>
		<br><br>


		<div style="border-style: solid; padding:20px ;margin-bottom:1px;">
			<h3>Vol aller:</h3>

			<h4>Départ : <%=outwardFlight.getDeparture() %></h4>
			<h4>Arrivée : <%=outwardFlight.getArrival() %></h4>
			<h4>Date départ : <%=outwardFlight.getDepartureDate() %></h4>
			<h4>Heure de départ :<%=outwardFlight.getDepartureTime() %></h4>
			<h4>Date d'arrivée : <%=outwardFlight.getArrivalDate() %></h4>
			<h4>Heure d'arrivée : <%=outwardFlight.getArrivalTime() %></h4>
			<h4>Prix : <%=outwardFlight.getPrice() %> € par personne</h4>

			<br>

			<h4>Sièges aller : </h4>

			<%
				PrintSeats.printSeatsSelected(out, outwardFlightID, outwardSeats);
			%>
			<br>
		</div>

		<%if(returnFlight!=null){ %>
		<div style="border-style: solid; padding:20px;">
			<h3>Vol retour:</h3>

			<h4>Départ : <%=returnFlight.getDeparture() %></h4>
			<h4>Arrivée : <%=returnFlight.getArrival() %></h4>
			<h4>Date départ : <%=returnFlight.getDepartureDate() %></h4>
			<h4>Heure de départ : <%=returnFlight.getDepartureTime() %></h4>
			<h4>Date d'arrivée : <%=returnFlight.getArrivalDate() %></h4>
			<h4>Heure d'arrivée : <%=returnFlight.getArrivalTime() %></h4>
			<h4>Prix : <%=returnFlight.getPrice() %> € par personne</h4>
			<br>

			<h4>Sièges au retour :</h4>
			<%
					PrintSeats.printSeatsSelected(out, returnFlightID, returnSeats);
				%>
		</div>
		<%} %>

	</div>

	<% for (int i = 0; i < listOfPassengers.size(); i++) {
		Passenger passenger = listOfPassengers.get(i);
		String title="";
		if(passenger.getTitle()==0){
			title="Mme";
		}else{
			title="M";
		}
	%>

	<div class="container" id="pInfoForm">
		<h2>Informations personnelles:</h2>

		<% if(i+1==1){
			out.println("<h3>Passager 1(en train de commander) : </h3>");
		}else{	
			out.println("<h3>Passager "+(i+1)+": </h3>");
		}	
		%>
		<h4><span class="glyphicon glyphicon-envelope"></span> Titre: <%=title %></h4>
		<h4><span class="glyphicon glyphicon-user"></span> Prénom: <%=passenger.getFirstName()%></h4>
		<h4><span class="glyphicon glyphicon-user"></span> Nom: <%=passenger.getSurname() %></h4>
		<h4><span class="glyphicon glyphicon-calendar"></span> Date de naissance: <%=passenger.getDateOfBirth() %></h4>
	</div>

	<%}%>

	<div class="container" id="pInfoForm">
		<h2>Autres:</h2>

		<h3>Informations de contact</h3>
		<div style="border:solid ;padding-left: 5px;">
			<h4><span class="glyphicon glyphicon-envelope"></span> E-mail :
				<%=listOfPassengers.get(0).getEmail()%> </h4>
			<h4><span class="glyphicon glyphicon-phone"></span> Numéro de téléphone:
				<%=listOfPassengers.get(0).getPhoneNumber() %> </h4>
			<br>
		</div>

		<h3>Option de vol:</h3>
		
		<%if(flightOption.equals("Eco")){ %>
			<div class="col-xl-4">
	               <div class="single-price">
	                   <div class="price-title">
	                       <h4>Eco</h4>
	                   </div>
	                   <div class="price-tag">
	                       <h2>Basique</h2>
	                   </div>
	                   <div class="price-item">
	                       <ul>
	                           <li>1 baggage à main (12kg)</li>
	                           <li>Choix du siège</li>
	                           <li>Repas</li>
	                           <li>Changement impossible</li>
	                           <li>Pas de remboursement possible</li>
	                       </ul>
	                   </div>
	               </div>
	           </div>
	       <%}else if(flightOption.equals("EcoFlex")){ %>   
				<div class="col-xl-4">
                      <div class="single-price">
                          <div class="price-title">

                              <h4>ECO FLEX</h4>
                          </div>
                          <div class="price-tag">
                              <h2>25€</h2>
                          </div>
                          <div class="price-item">
                              <ul>
                                  <li>1 baggage à main (12kg)</li>
                                  <li>1 bagage en soute (20kg)</li>
                                  <li>Choix du siège</li>
                                  <li>Repas</li>
                                  <li>Frais de changement</li>
                                  <li>Pas de remboursement possible</li>
                              </ul>
                          </div>
                      </div>
                  </div>
    	<%}else{ %>
                  <div class="col-xl-4">
                      <div class="single-price">
                          <div class="price-title">
                              <h4>business</h4>
                          </div>
                          <div class="price-tag">
                              <h2>50€</h2>
                          </div>
                          <div class="price-item">
                              <ul>
                                  <li>2 baggages à main (12kg)</li>
                                  <li>1 bagage en soute (20kg)</li>
                                  <li>Choix du siège</li>
                                  <li>Repas</li>
                                  <li>Changement de vol gratuit</li>
                                  <li>Remboursement possible</li>
                                  <li>Priorité au Check-In </li>
                                  <li>Priorité passage de la sécurité</li>
                                  <li>Priorité à l'embarquement</li>
                              </ul>
                          </div>
                      </div>
                  </div>
		<%} %>
		
		
		<br><br>
		<h3>Assurance:</h3>
		
		<%if(insurance.equals("yes")){ %>
			 <div class="form-check">
                    <span class="form-check-label">
                       <span style="color: #ff6600; font-weight: bold;">	Assurance de voyage</span>
                        (16€ par personne)
                        <br>
                        <span>
                            Couvre:
                            <ul>
                                <li>
                                    Dépenses médicales et hospitalières jusque 150000€
                                </li>
                                <li>
                                    Dommage/pertes de baggage jusque 1000€
                                </li>
                                <li>
                                    Annulation du départ pour raison médicale ou accidentelle jusque 500€
                                </li>
                                <li>
                                    24 heures d'assistances à l'étranger
                                </li>
                            </ul>
                        </span>
                    </span>
                </div>
		<%}else{ %>
		
			<h4 style="margin-left:40px;">Non souscrite</h4>
		
		<%} %>
		<br>

		<h3>Total: <%=totalPrice %> €</h3>
		<br>
		
		<input type="submit" value="Procéder au paiement" onclick="window.location.href = '/FR/booking/payment.jsp';">

	</div>
	<!--Footer -->
	<div id="footerFR"></div>
</body>

</html>