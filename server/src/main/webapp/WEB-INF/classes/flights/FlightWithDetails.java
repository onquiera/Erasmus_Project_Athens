package flights;

import java.sql.Date;
import java.sql.Time;

public class FlightWithDetails {
	//flightID, price, departure, arrival,departureDate, departureTime, arrivalDate, arrivalTime, placesLeft
	private String flightID;
	private String departure;
	private String arrival;
	private Date departureDate;
	private Time departureTime;
	private Date arrivalDate;
	private Time arrivalTime;
	private int price;
	private int placesLeft;
	public FlightWithDetails(String flightID, String departure, String arrival, Date departureDate, Time departureTime,
			Date arrivalDate, Time arrivalTime, int price, int placesLeft) {
		super();
		this.flightID = flightID;
		this.departure = departure;
		this.arrival = arrival;
		this.departureDate = departureDate;
		this.departureTime = departureTime;
		this.arrivalDate = arrivalDate;
		this.arrivalTime = arrivalTime;
		this.price = price;
		this.placesLeft = placesLeft;
	}
	public String getFlightID() {
		return flightID;
	}
	public void setFlightID(String flightID) {
		this.flightID = flightID;
	}
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		this.departure = departure;
	}
	public String getArrival() {
		return arrival;
	}
	public void setArrival(String arrival) {
		this.arrival = arrival;
	}
	public Date getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}
	public Time getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(Time departureTime) {
		this.departureTime = departureTime;
	}
	public Date getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	public Time getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(Time arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPlacesLeft() {
		return placesLeft;
	}
	public void setPlacesLeft(int placesLeft) {
		this.placesLeft = placesLeft;
	}
	
	
}
