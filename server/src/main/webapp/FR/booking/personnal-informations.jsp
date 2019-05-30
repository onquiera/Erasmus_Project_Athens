<!DOCTYPE html>
<%@page import="seats.SeatsDAO"%>
<%@page import="booking.Booking"%>
<%@page import="java.util.List"%>
<%@page import="flights.Airport"%>
<%@page import="java.util.ArrayList"%>
<%@page import="flights.AirportsDAO"%>
<html lang="en">

<head>

	<link rel="shortcut icon" type="image/png" href="/resources/firstlogo.png" />
	<title>Informations personnelles</title>
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

					<li class="nav-item active">
						<label>Passagers <span class="glyphicon glyphicon-arrow-right"></span></label>
					</li>

					<li class="nav-item">
						<label>Options supplémentaires <span class="glyphicon glyphicon-arrow-right"></span></label>
					</li>

					<li class="nav-item">
						<label>Confirmation <span class="glyphicon glyphicon-arrow-right"></span></label>
					</li>

					<li class="nav-item">
						<label>Paiement</label>
					</li>

				</ul>
			</div>
		</div>
	</nav>

	<%
	int numberOfPassengers=-1;
	
	//parameter check
	try{
		HttpSession httpSession = request.getSession(false);
		//check if session is valid
		if(httpSession==null || !request.isRequestedSessionIdValid() ){
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

	<div class="container">
		<div class="row">
			<div class="col-md-6 login-form">

				<form action="/servlet-PersonnalInformations" method="get" role="form class=form">
					<input type="hidden" name="lang" value="fr">

					<%
			
			if(numberOfPassengers==-1){
				response.sendRedirect("/error/parameterError.html");
			}
			%>

					<h1>Informations personnelles</h1>

					<h2>Informations des passagers :</h2><br>

					<% for(int i = 1; i < numberOfPassengers+1; i++) { %>

					<%
						if(i==1){
							out.println("<h3>Passager 1(en train de commander) : </h3> ");
						}else{	
							out.println("<h3>Passager "+i+" : </h3>");
						}	
					 %>
					<div class="container" id="pInfoForm">
						<div class="form-group">
							<label><span class="glyphicon glyphicon-envelope"></span> Titre</label>
							<select required name="passenger-<%=i%>-title">
								<option selected value="0">Mme</option>
								<option value="1">M</option>
							</select>
						</div>

						<div class="form-group">
							<label><span class="glyphicon glyphicon-user"></span> Prénom</label>
							<input value="" required type="text" class="form-control" name="passenger-<%=i%>-name"
								placeholder="Entrez prénom">
						</div>

						<div class="form-group">
							<label><span class="glyphicon glyphicon-user"></span> Nom</label>
							<input value="" required type="text" class="form-control" name="passenger-<%=i%>-surname"
								placeholder="Entrez nom de famille">
						</div>

						<div class="form-group">
							<label><span class="glyphicon glyphicon-calendar"></span> Date de naissance</label>
							<input required type="date" class="form-control" name="passenger-<%=i%>-dateOfBirth"
								 max="2010-01-01" placeholder="jj-mm-aaaa">
						</div>

					</div>
					<% } %>

					<br>

					<div class="container" id="pInfoForm">
						<h2>Informations de contact</h2>
						<div class="form-group">
							<label><span class="glyphicon glyphicon-envelope"></span> E-mail</label>
							<input required type="email" class="form-control" name="email"
								placeholder="Entrez email">
						</div>
						<div class="form-group">
							<label><span class="glyphicon glyphicon-phone"></span> Numéro de téléphone(optional)</label>
							<input type="tel" class="form-control" name="phoneNumber" placeholder="Entrez numéro de téléphone">
						</div>
						<br>
					</div>

					<div class="container" id="pInfoForm">
						<h4>
							<div class="checkbox">
								<label><input required type="checkbox" value="">J'accepte les conditions légales d'<a
										href="/FR/informations/legalConditions.html">Air Asmus</a></label>
							</div>
						</h4>
						<input type="submit" value="Confirmer">
					</div>
					<br> <br>
				</form>
			</div>
		</div>
	</div>

	<!--Footer -->
	<div id="footerFR"></div>
</body>

</html>