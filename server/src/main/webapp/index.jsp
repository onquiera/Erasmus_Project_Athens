<!DOCTYPE html>
<html lang="en">

<head>
    <title>AirVacation</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./css/homeStyle.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="js/Popup/Login.js" defer></script>
</head>

<body>
    <!--First Navbar, which contains the logo, language, contact, sign up and login section-->
    <nav class="navbar" id="HomeBar">
        <div class="container-fluid">
            <div class="navbar-header ">
                <a href="" class="navbar-left"><img src="./resources/firstlogo.png" alt="Insert logo here" id=logo-img></a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Choose Your language</a></li>
                <li><a href="#">Contact us</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="#" id=loginModal><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>
        </div>
    </nav>

    <!--Login -->
	<div class="modal" id="popup" role="dialog">
	    <div class="modal-dialog"></div>
	</div>

<!--Second navbar, which contains the differents parts of the website -->
    <nav class="navbar" id="navigationBar">
        <div class="container-fluid">
            <div class="navbar-header ">
                <a class="navbar-brand" href="#">AirVacation</a>
            </div>
            <ul class="nav navbar-nav" id="sectionBar" >
                <li class="active"><a href="#">Home</a></li>

                <li><a href="#">Purchase a ticket</a></li>
                <li><a href="#">Check-in</a></li>
                <li><a href='#'>My bookings</a></li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Information <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Prepare your trip</a></li>
                        <li><a href="#">Luggages</a></li>
                        <li><a href="#">Flights Informations</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h3>Welcome on AirVacation !</h3>
        <p>We are unfortunatly currently under maintainance.</p>
    </div>

</body>

</html>