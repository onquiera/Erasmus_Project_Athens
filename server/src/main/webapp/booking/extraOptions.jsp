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
                    <li id="number1" class="nav-item passive">
                        <label>Search</label>
                    </li>
                    <li class="nav-item passive">
                        <label>Departing Flight</label>
                    </li>
                    <li class="nav-item passive">
                        <label>Return Flight</label>
                    </li>

                    <li class="nav-item passive">
                        <label>Seats</label>
                    </li>

                    <li class="nav-item passive">
                        <label>Passengers</label>
                    </li>

                    <li class="nav-item active">
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




    <form action="/servlet-ExtraOptions" method="get" role="form class=form">


        <div id="textArea2">

            <!--More Luggage side-->

            <div class="container" id="pInfoForm">

                <h2> You need more luggages ?</h2>
                <p>We work on it !</p>




                <!------------------------------------------------------------------------------>





                <section class="pricing-area" id="pricing">
                    <div class="container">

                        <div class="row">
                            <div class="col-xl-4">

                                <div class="single-price">
                                    <input type="radio" class="form-check-input" name="classesOption" checked>
                                    <div class="price-title">
                                        <h4>Eco</h4>
                                    </div>
                                    <div class="price-tag">
                                        <h2>Basic option</h2>
                                    </div>
                                    <div class="price-item">
                                        <ul>
                                            <li>100GB Monthly Bandwidth</li>
                                            <li>100 Google AdWords</li>
                                            <li>100 Domain Hosting</li>
                                            <li>SSL Shopping Cart</li>
                                            <li>24/7 Live Support</li>
                                        </ul>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-4">

                                <div class="single-price">
                                    <input type="radio" class="form-check-input" name="classesOption">
                                    <div class="price-title">

                                        <h4>ECO FLEX</h4>
                                    </div>
                                    <div class="price-tag">
                                        <h2>25€</h2>
                                    </div>
                                    <div class="price-item">
                                        <ul>
                                            <li>100GB Monthly Bandwidth</li>
                                            <li>100 Google AdWords</li>
                                            <li>100 Domain Hosting</li>
                                            <li>SSL Shopping Cart</li>
                                            <li>24/7 Live Support</li>
                                        </ul>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-4">

                                <div class="single-price">
                                    <input type="radio" class="form-check-input" name="classesOption">
                                    <div class="price-title">
                                        <h4>business</h4>
                                    </div>
                                    <div class="price-tag">
                                        <h2>50€</h2>
                                    </div>
                                    <div class="price-item">
                                        <ul>
                                            <li>100GB Monthly Bandwidth</li>
                                            <li>100 Google AdWords</li>
                                            <li>100 Domain Hosting</li>
                                            <li>SSL Shopping Cart</li>
                                            <li>24/7 Live Support</li>
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
                    <h2><span class="glyphicon glyphicon-heart"></span> Insurance(recommanded)</h2>

                    <div class="form-check">
                        <span class="form-check-label">
                            <input type="radio" class="form-check-input" name="insurance"> <span
                                style="color: #ff6600; font-weight: bold;">Comprehensive travel Insurance</span>
                            (16€ per person)
                            <br>
                            <span>
                                Covers:
                                <ul>
                                    <li>
                                        Medical and hospitalization expenses up to 150.000 Euros
                                    </li>
                                    <li>
                                        Damage/loss or theft of luggage up to 1.000 Euros
                                    </li>
                                    <li>
                                        Departure cancellation due to sickness or accident up to 500 Euros
                                    </li>
                                    <li>
                                        24 hour assistance abroad
                                    </li>
                                </ul>
                            </span>
                        </span>
                    </div>

                    <div class="form-check">
                        <span class="form-check-label">
                            <input type="radio" class="form-check-input" name="insurance" checked> <span
                                style="color: #ff6600; font-weight: bold;">I do no wish to be insured</span>
                        </span>
                    </div>
                </div>

                <div class="container" id="pInfoForm">
                    <div class="col-lg-12">
                        <input type="submit" class="srch" value="Submit" />
                    </div>
                </div>

           
    </form>



    <!--Footer -->
    <div id="footer"></div>
</body>

</html>