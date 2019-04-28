package flights;

public class Booking {
	
	private int reservationnumber;
	private String flightid;
	private int seatnumber;
	private String clientname;
	private String clientemail;
	
//int reservationnumber, String flightid, int seatnumber, String clientname, String clientemail
	
	public Booking(int reservationnumber, String flightid, int seatnumber, String clientname, String clientemail) {
		super();
		this.reservationnumber = reservationnumber;
		this.flightid = flightid;
		this.seatnumber = seatnumber;
		this.clientname = clientname;
		this.clientemail = clientemail;
	}

	public int getReservationnumber() {
		return reservationnumber;
	}

	public void setReservationnumber(int reservationnumber) {
		this.reservationnumber = reservationnumber;
	}

	public String getFlightid() {
		return flightid;
	}

	public void setFlightid(String flightid) {
		this.flightid = flightid;
	}

	public int getSeatnumber() {
		return seatnumber;
	}

	public void setSeatnumber(int seatnumber) {
		this.seatnumber = seatnumber;
	}

	public String getClientname() {
		return clientname;
	}

	public void setClientname(String clientname) {
		this.clientname = clientname;
	}

	public String getClientemail() {
		return clientemail;
	}

	public void setClientemail(String clientemail) {
		this.clientemail = clientemail;
	}

}