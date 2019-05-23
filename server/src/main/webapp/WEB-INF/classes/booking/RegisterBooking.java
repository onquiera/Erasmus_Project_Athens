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
			returnFlight = flightDAO.findFlight(returnFlightID);
			
			outwardSeats = (ArrayList<String>)httpSession.getAttribute("outward-seats");
			returnSeats = (ArrayList<String>)httpSession.getAttribute("return-seats");
			
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
			
			Booking returnBooking = new Booking(bookingDAO.maxBookingID()+1, returnFlightID, 0, 0, listOfPassengers.get(0).getPno());
			bookingDAO.create(returnBooking);
			
			
			for (int i = 1; i < listOfPassengers.size(); i++) {
				passengerDAO.create(listOfPassengers.get(i));
				bookingDAO.associatePassengerToBooking(listOfPassengers.get(i).getPno(), outwardBooking.getBookingID());
				bookingDAO.associatePassengerToBooking(listOfPassengers.get(i).getPno(), returnBooking.getBookingID());
			}
			
			SeatsDAO seatsDAO = new SeatsDAO();
			
			for (String seat : outwardSeats) {
				seatsDAO.bookSeat(outwardFlightID, seat, outwardBooking.getBookingID());
			}
			for (String seat : returnSeats) {
				seatsDAO.bookSeat(returnFlightID, seat, returnBooking.getBookingID());
			}
			
			String message = 
					" <h2>Thank you for your purchase on air vacation</h2>"
					+ ""
					+ "<h3>Here are your booking details :</h3> "
					+ "<br>"
					+ "<div style = \"border-style: solid;\">"
					+ "<h4>Booking ID : " + outwardBooking.getBookingID() +"<br>"
					+ "<br>"
					+ "Outward flight : <br>"
					+ "Flight from : "+ outwardFlight.getDeparture() + "<br>"
					+ "to : " + outwardFlight.getArrival() + "<br>"
					+ "<br>"
					+ outwardFlight.getDepartureDate()+ " at "+ outwardFlight.getDepartureTime()+"<br>";
			
			if(returnFlight!=null) {
				message+=
						  ""
						  + "Return flight : <br><br>"
						  + "Flight from : "+ returnFlight.getDeparture() + "<br>"
						+ "to : " + returnFlight.getArrival() + "<br>"
						+ "<br>"
						+ returnFlight.getDepartureDate()+ " at "+ returnFlight.getDepartureTime();
			}
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
