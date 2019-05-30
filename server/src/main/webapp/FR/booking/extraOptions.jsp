<!DOCTYPE html>
<%@page import="seats.SeatsDAO"%>
<%@page import="booking.Booking"%>
<%@page import="java.util.List"%>
<%@page import="flights.Airport"%>
<%@page import="java.util.ArrayList"%>
<%@page import="flights.AirportsDAO"%>
<%@page import="users.UsersDAO"%>
<html lang="en">


<head>

    <link rel="shortcut icon" type="image/png" href="/resources/firstlogo.png" />
    <title>Extra</title>
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

<%
	//check if session is still valid
	int price = -1;
	try{
		HttpSession httpSession = request.getSession(false);
		if(httpSession==null || !request.isRequestedSessionIdValid() ){
			response.sendRedirect("/error/sessionError.html");
		}
		price = (Integer)httpSession.getAttribute("price");
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

					<li class="nav-item active">
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


   

    <form action="/servlet-ExtraOptions" method="get" role="form class=form">
		<input type="hidden" name="lang" value="fr">

        <div id="textArea2">

            <div id="priceArea">
                <h4>Total: <%=price %> €</h4>
            </div>
            
            <h2> Options de vol</h2>
            <!--More Luggage side-->

            <div class="container" id="pInfoForm">

                <section class="pricing-area" id="pricing">
                    <div class="container">

                        <div class="row">
                            <div class="col-xl-4">

                                <div class="single-price">
                                    <input type="radio" class="form-check-input" name="flightOption" value="Eco"
                                        checked>
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
                            <div class="col-xl-4">
                                <div class="single-price">
                                    <input type="radio" class="form-check-input" name="flightOption" value="EcoFlex">
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
	                            <div class="col-xl-4">
	                                <div class="single-price">
	                                    <input type="radio" class="form-check-input" name="flightOption" value="business">
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
                        </div>
                    </div>
                </section>
            </div>

            <!------------------------------------------------------------------------------>

            <!--Insurance side-->
            <div class="container" id="pInfoForm">
                <h2><span class="glyphicon glyphicon-heart"></span> Assurance(recommandée)</h2>

                <div class="form-check">
                    <span class="form-check-label">
                        <input type="radio" class="form-check-input" name="insurance" value="yes"> <span
                            style="color: #ff6600; font-weight: bold;">	Assurance de voyage</span>
                        (16€ par personne)
                        <br>
                        <span>
                            Couvre:
                            <ul>
                                <li>
                                    Dépenses médicales et hospitalière jusque 150000€
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

                <div class="form-check">
                    <span class="form-check-label">
                        <input type="radio" class="form-check-input" name="insurance" value="no" checked> <span
                            style="color: #ff6600; font-weight: bold;">Je ne veux pas être assuré</span>
                    </span>
                </div>
            </div>

            <div class="container" id="pInfoForm">
                <div class="col-lg-12">
                    <input type="submit" class="srch" value="Valider" />
                </div>
            </div>
        </div>
    </form>

    <!--Footer -->
    <div id="footerFR"></div>
</body>

</html>