
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="flights.Airport"%>
<%@page import="flights.AirportsDAO"%>

<!-- airport list for formular -->
<datalist id="airports">
			<%
			AirportsDAO dao = new AirportsDAO();
			List<Airport> listeAirports = dao.findAll();
			
			for (Airport airport : listeAirports) {
				out.println("<option value=\""+ airport.getName()+"\">");
			}	
			
			 %>
</datalist>


<img src="./resources/santorin.png">
		<!--Form-->
		<div class="container" id="searchForm">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-8 col-xs-12">
					<div class="tabing">
						<ul>
							<li><span><i class="fa fa-plane" aria-hidden="true"></i></span>
								Purchase a ticket
							</li>
						</ul>
						<div class="tab-content">
							<div id="1" class="tab1 active">
								<form action="/servlet-SearchFlight" method="get">
									"<input type="hidden" name="flightType" value="outward">"
								
									<div class="triptype">
										<label class="rndTrip active"><input type="radio" name="Round" value="RoundTrip"
												checked> Round Trip
										</label>
										<!--TODO Add the next line if we make a simple trip-->
										<!--<label class="oneTrip"><input type="radio" name="Round" value="OneWay"> OneWay </label>-->
									</div>
									
									
									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input list="airports" class="form-control" name="departure" 
										value ="Lille Airport" placeholder="Departing from">	
									</div>
									
									
									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input list="airports" class="form-control" name="destination" 
										value ="Madrid Barajas" placeholder="Arriving at">	
									</div>



									<% 
									DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
									LocalDate localDate = LocalDate.now();
									String actualDate = dtf.format(localDate); 		
									localDate = localDate.plusDays(1);
									String tomorrowDate = dtf.format(localDate); 													
									%>
									<div class="col-sm-6 col-xs-6 ctrl">
										<i class="fa fa-calendar" aria-hidden="true"></i>
										
										<!--
										TODO
										uncomment when site finished > uses today's date
										
										<input id="departDate" type="date" class="form-control" name="departureDate"
											value="<%=actualDate %>" min="2019-04-01" max="2025-04-01"
											placeholder="dd-mm-yyyy">
										-->
										
										<input id="departDate" type="date" class="form-control" name="departureDate"
											value="2019-04-22" min="2019-04-01" max="2025-04-01"
											placeholder="dd-mm-yyyy">
										
									</div>
									
									<div class="col-sm-6 col-xs-6 ctrl hide_one-trip">
										<i class="fa fa-calendar" aria-hidden="true"></i>
										
										<!--
										TODO
										uncomment when site finished > uses today's date
										<input id="arrivalDate" type="date" class="form-control" name="returnDate"
											value="<%=tomorrowDate%>" min="2019-04-01" max="2025-04-01"
											placeholder="dd-mm-yyyy">
										-->
										
										<input id="arrivalDate" type="date" class="form-control" name="returnDate"
											value="2019-06-15" min="2019-04-01" max="2025-04-01"
											placeholder="dd-mm-yyyy">	
											
									</div>
									
									
									<div class="select-wrap">
										<div class="adult-box">
											<span>Passengers</span>
											<select id="nbPassengers" value="" name="numberOfPassengers">
												<option>1</option>
												<option>2</option>
												<option>2</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
											</select>
										</div>
										
										
										<div class="adult-box">
											<span>Class</span>
											<select id="class" value="" name="class">
												<option>Business</option>
												<option>Economy</option>
											</select>
										</div>
									</div>
									<div class="col-lg-12">
										<input type="submit" class="srch" value="Search Flights" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.Form-->