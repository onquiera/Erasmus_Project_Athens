package booking;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import flights.FlightWithDetails;
import flights.FlightsDAO;
import mailing.MailService;
import seats.SeatsDAO;
import users.Passenger;
import users.PassengerDAO;

@SuppressWarnings("serial")
public class RegisterBooking extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{

		ArrayList<Passenger> listOfPassengers = null;
		String outwardFlightID = null;
		String returnFlightID = null;
		ArrayList<String> outwardSeats=null;
		ArrayList<String> returnSeats=null;
		FlightWithDetails outwardFlight=null;
		FlightWithDetails returnFlight=null;
		Booking returnBooking=null;

		FlightsDAO flightDAO = new FlightsDAO();

		try {
			HttpSession httpSession = req.getSession(false);
			//check if session is valid
			if (httpSession == null || !req.isRequestedSessionIdValid()) {
				res.sendRedirect("/error/sessionError.html");
			}

			//PARAMETERS management
			listOfPassengers = (ArrayList<Passenger>) httpSession.getAttribute("listOfPassengers");
			outwardFlightID=(String) httpSession.getAttribute("outwardFlightID");
			outwardFlight = flightDAO.findFlight(outwardFlightID);

			returnFlightID=(String) httpSession.getAttribute("returnFlightID");
			if(returnFlightID!=null) {
				returnFlight = flightDAO.findFlight(returnFlightID);
				returnSeats = (ArrayList<String>)httpSession.getAttribute("return-seats");
			}

			outwardSeats = (ArrayList<String>)httpSession.getAttribute("outward-seats");

			//registration in tables

			//passenger registration

			PassengerDAO passengerDAO = new PassengerDAO();

			//TODO when user connexion works :
			//if(connected){   }  (passenger 1 already exists if user is connected) 
			//else{
			passengerDAO.create(listOfPassengers.get(0));
		
			BookingDAO bookingDAO = new BookingDAO();
			Booking outwardBooking = new Booking(bookingDAO.maxBookingID()+1, outwardFlightID, 0, 0, listOfPassengers.get(0).getPno());
			bookingDAO.create(outwardBooking);

			if(returnFlightID!=null) {
				returnBooking = new Booking(bookingDAO.maxBookingID()+1, returnFlightID, 0, 0, listOfPassengers.get(0).getPno());
				bookingDAO.create(returnBooking);
			}
			
			bookingDAO.associatePassengerToBooking(listOfPassengers.get(0).getPno(), outwardBooking.getBookingID());
			if(returnFlightID!=null) {
				bookingDAO.associatePassengerToBooking(listOfPassengers.get(0).getPno(), returnBooking.getBookingID());
			}
			

			for (int i = 1; i < listOfPassengers.size(); i++) {
				passengerDAO.create(listOfPassengers.get(i));
				bookingDAO.associatePassengerToBooking(listOfPassengers.get(i).getPno(), outwardBooking.getBookingID());
				
				if(returnFlightID!=null) {
					bookingDAO.associatePassengerToBooking(listOfPassengers.get(i).getPno(), returnBooking.getBookingID());
				}
			}

			SeatsDAO seatsDAO = new SeatsDAO();

			for (String seat : outwardSeats) {
				seatsDAO.bookSeat(outwardFlightID, seat, outwardBooking.getBookingID());
			}
			if(returnFlightID!=null) {
				for (String seat : returnSeats) {
					seatsDAO.bookSeat(returnFlightID, seat, returnBooking.getBookingID());
				}
			}
			

			String message = 
					" <h2>Thank you for your purchase on air vacation</h2>"
							+ ""
							+ "<h3>Here are your booking details :</h3> "
							+ "<br>"
							+ "<div style = \"border-style: solid;\">"
							+ "<h4><b>Outward Flight :</b> <br>"
							+ "Booking ID : " + outwardBooking.getBookingID() +"<br>"
							+ "flight from : "+ outwardFlight.getDeparture() + "<br>"
							+ "to : " + outwardFlight.getArrival() + "<br>"
							+ outwardFlight.getDepartureDate()+ " at "+ outwardFlight.getDepartureTime()+"<br>"
							+ "<br>"
							+ "Seats: <br>";
			int cpt=1;
			for (String seat : outwardSeats) {
				message+= "seat "+cpt + ": "+ seat +"<br>";
				cpt++;
			}
			

			if(returnFlight!=null) {
				message+=
						"<br><br>"
						+ "<b>Return Flight : </b><br>"
						+ "Booking ID : " + returnBooking.getBookingID() +"<br>"
								+ "flight from : "+ returnFlight.getDeparture() + "<br>"
								+ "to : " + returnFlight.getArrival() + "<br>"
								+ returnFlight.getDepartureDate()+ " at "+ returnFlight.getDepartureTime()+"<br>"
								+ "Seats: <br>";

				cpt=1;
				for (String seat : returnSeats) {
					message+= "seat "+cpt + ": "+ seat +"<br>";
					cpt++;
				}
			}
			
			message+="<br>";
			
			message += "Passengers :<br>";

			cpt=1;
			for (Passenger passenger : listOfPassengers) {
				message+= "passenger n°"+cpt+": <br>";
				if(passenger.getTitle()==0) {
					message+="Mrs ";
				}else {
					message+="Mr ";
				}
				message+=passenger.getFirstName()+" "+passenger.getSurname()+""
						+ "<br>date of birth : " +passenger.getDateOfBirth() +"<br><br>";
				cpt++;
			}
			
			message+="<br>"
					+ "<u>Contact informations</u> assiociated to your purchase :<br> "
					+ "email : " + listOfPassengers.get(0).getEmail()+"<br>";
			
			String phoneNumber = listOfPassengers.get(0).getPhoneNumber();
			if(phoneNumber!=null && phoneNumber.length()>0) {
				message+= "phone number : " + phoneNumber+"<br>";
			}

			message+="<br>"
					+ "Please take note that the name assiocated to this booking is : " +listOfPassengers.get(0).getSurname()+"<br>"
					+ "This can be usefull on the <a href=\"http://localhost:8080/booking/searchBooking.jsp>\">My booking</a> page.<br>"
					+ "<br>"
					+ "<br>"
					+ "You will receive an email with the checkin informations a few days before your flight.<br>"
					+ "<br>"
					+ "We thank you for using our compagny to fly around the world.<br>"
					+ "<b>Air Asmus</b>";
			
			message+="</h4></div>";

			MailService mailService = new MailService();
			mailService.sendTo(listOfPassengers.get(0).getEmail(), "Booking done" , message);

			res.sendRedirect("/booking/bookingDone.jsp");

		}catch(java.lang.NumberFormatException e ){
			e.printStackTrace();
			res.sendRedirect("/error/parameterError.html");
		}catch(NullPointerException e ){
			e.printStackTrace();
			res.sendRedirect("/error/parameterError.html");
		}catch(Exception e2 ){
			e2.printStackTrace();
			res.sendRedirect("/error/error.html");
		}
	}
}
