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
								<form>
									<div class="triptype">
										<label class="rndTrip active"><input type="radio" name="Round" value="RoundTrip"
												checked> Round Trip
										</label>
										<!--TODO Add the next line if we make a simple trip-->
										<!--<label class="oneTrip"><input type="radio" name="Round" value="OneWay"> OneWay </label>-->
									</div>
									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input id="depart" type="text" class="form-control" name="depart" value=""
											placeholder="Departing from">
									</div>
									<div class="col-sm-12 col-xs-12 ctrl">
										<i class="fa fa-map-marker" aria-hidden="true"></i>
										<input id="arrival" type="text" class="form-control" name="arrival" value=""
											placeholder="Arriving at">
									</div>
									<div class="col-sm-6 col-xs-6 ctrl">
										<i class="fa fa-calendar" aria-hidden="true"></i>
										<input id="departDate" type="date" class="form-control" name="departDate"
											value="2019-04-25" min="2019-04-01" max="2020-04-01"
											placeholder="dd-mm-yyyy">
									</div>
									<div class="col-sm-6 col-xs-6 ctrl hide_one-trip">
										<i class="fa fa-calendar" aria-hidden="true"></i>
										<input id="arrivalDate" type="date" class="form-control" name="arrivalDate"
											value="2019-04-25" min="2019-04-01" max="2020-04-01"
											placeholder="dd-mm-yyyy">
									</div>
									<div class="select-wrap">
										<div class="adult-box">
											<span>Passengers</span>
											<select id="nbPassengers" value="" name="nbPassengers">
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