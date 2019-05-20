package booking;

public class Booking {
	
	private int bookingID;
	private String flightid;
	private int category;
	private int insurance;
	private int mainPassengerNO;
	
	public Booking(int bookingID, String flightid, int category, int insurance, int mainPassengerNO) {
		super();
		this.bookingID = bookingID;
		this.flightid = flightid;
		this.category = category;
		this.insurance = insurance;
		this.mainPassengerNO = mainPassengerNO;
	}
	
	public int getBookingID() {
		return bookingID;
	}
	public void setBookingID(int bookingID) {
		this.bookingID = bookingID;
	}
	public String getFlightid() {
		return flightid;
	}
	public void setFlightid(String flightid) {
		this.flightid = flightid;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getInsurance() {
		return insurance;
	}
	public void setInsurance(int insurance) {
		this.insurance = insurance;
	}
	public int getMainPassengerNO() {
		return mainPassengerNO;
	}
	public void setMainPassengerNO(int mainPassengerNO) {
		this.mainPassengerNO = mainPassengerNO;
	}
}