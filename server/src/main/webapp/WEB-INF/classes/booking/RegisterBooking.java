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
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{

		String lang = null;
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
			lang = req.getParameter("lang");
			HttpSession httpSession = req.getSession(false);
			//check if session is valid
			if (httpSession == null || !req.isRequestedSessionIdValid()) {
				if(lang!=null && lang.equals("fr")) {
					res.sendRedirect("/FR/error/sessionError.html");
				}else {
					res.sendRedirect("/error/sessionError.html");
				}
			}
			MailService mailService = new MailService();
		
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

			//passenger registration

			PassengerDAO passengerDAO = new PassengerDAO();

			//when user connexion works :
			//if(connected){   }  (passenger 1 already exists if user is connected so we don't have to create a new passenger) 
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
			

			//-----------------------------------------------------------
			
			

			if(lang!=null && lang.equals("fr")) {
				//in french
				
				
				String emailMessage = 
						" <h2>Merci pour votre achat sur Air Asmus</h2>"
								+ "<h3>Voici tout les détails de votre réservation :</h3> "
								+ "<br>"
								+ "<div style = \"border-style: solid;\">"
								+ "<h4><b>Vol aller :</b> <br>"
								+ "ID de la réservation: " + outwardBooking.getBookingID() +"<br>"
								+ "Vol de : "+ outwardFlight.getDeparture() + "<br>"
								+ "vers : " + outwardFlight.getArrival() + "<br>"
								+ outwardFlight.getDepartureDate()+ " à "+ outwardFlight.getDepartureTime()+"<br>"
								+ "<br>"
								+ "Sièges: <br>";
				int cpt=1;
				for (String seat : outwardSeats) {
					emailMessage+= "siège "+cpt + ": "+ seat +"<br>";
					cpt++;
				}

				if(returnFlight!=null) {
					emailMessage+=
							"<br><br>"
							+ "<b>Vol retour : </b><br>"
							+ "ID de la réservation : " + returnBooking.getBookingID() +"<br>"
									+ "Vol de : "+ returnFlight.getDeparture() + "<br>"
									+ "vers : " + returnFlight.getArrival() + "<br>"
									+ returnFlight.getDepartureDate()+ " à "+ returnFlight.getDepartureTime()+"<br>"
									+ "Seats: <br>";

					cpt=1;
					for (String seat : returnSeats) {
						emailMessage+= "siège "+cpt + ": "+ seat +"<br>";
						cpt++;
					}
				}
				emailMessage+="<br>";
				emailMessage +="Passager :<br>";

				cpt=1;
				for (Passenger passenger : listOfPassengers) {
					emailMessage+= "passager no "+cpt+": <br>";
					if(passenger.getTitle()==0) {
						emailMessage+="Mme ";
					}else {
						emailMessage+="M ";
					}
					emailMessage+=passenger.getFirstName()+" "+passenger.getSurname()+""
							+ "<br>date de naissance : " +passenger.getDateOfBirth() +"<br><br>";
					cpt++;
				}
				
				emailMessage+="<br>"
						+ "<u>Informations de contact</u> associées à votre réservations :<br> "
						+ "email : " + listOfPassengers.get(0).getEmail()+"<br>";
				
				String phoneNumber = listOfPassengers.get(0).getPhoneNumber();
				if(phoneNumber!=null && phoneNumber.length()>0) {
					emailMessage+= "numéro de téléphone : " + phoneNumber+"<br>";
				}
				
				String customersSurname = listOfPassengers.get(0).getSurname();

				emailMessage+="<br>"
						+ "Prennez en compte que le nom associé à votre réservation est : " +listOfPassengers.get(0).getSurname()+"<br>"
						+ "Cela vous sera utile sur la page "
						+ "<a href=\"http://localhost:8080/booking/searchBooking.jsp?surname="+customersSurname+"&bookingID="+outwardBooking.getBookingID()+ "\">Ma réservation</a>"
						+ ".<br>"
						+ "<br>"
						+ "<br>"
						+ "Vous recevrez un mail avec les informations sur le checkin quelques jours avant votre vol.<br>"
						+ "<br>"
						+ "Nous vous remercions d'utiliser notre compagnie pour voyager autour du monde.<br>"
						+ "<b>Air Asmus</b>";
				
				emailMessage+="</h4></div>";
				
				mailService.sendTo(listOfPassengers.get(0).getEmail(), "Réservation de vol effectuée" , emailMessage);
		
			
			
			}else {
				//in english
				
				String emailMessage = 
						" <h2>Thank you for your purchase on air Asmus</h2>"
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
					emailMessage+= "seat "+cpt + ": "+ seat +"<br>";
					cpt++;
				}

				if(returnFlight!=null) {
					emailMessage+=
							"<br><br>"
							+ "<b>Return Flight : </b><br>"
							+ "Booking ID : " + returnBooking.getBookingID() +"<br>"
									+ "flight from : "+ returnFlight.getDeparture() + "<br>"
									+ "to : " + returnFlight.getArrival() + "<br>"
									+ returnFlight.getDepartureDate()+ " at "+ returnFlight.getDepartureTime()+"<br>"
									+ "Seats: <br>";

					cpt=1;
					for (String seat : returnSeats) {
						emailMessage+= "seat "+cpt + ": "+ seat +"<br>";
						cpt++;
					}
				}
				emailMessage+="<br>";
				emailMessage +="Passengers :<br>";

				cpt=1;
				for (Passenger passenger : listOfPassengers) {
					emailMessage+= "passenger no "+cpt+": <br>";
					if(passenger.getTitle()==0) {
						emailMessage+="Mrs ";
					}else {
						emailMessage+="Mr ";
					}
					emailMessage+=passenger.getFirstName()+" "+passenger.getSurname()+""
							+ "<br>date of birth : " +passenger.getDateOfBirth() +"<br><br>";
					cpt++;
				}
				
				emailMessage+="<br>"
						+ "<u>Contact informations</u> assiociated to your purchase :<br> "
						+ "email : " + listOfPassengers.get(0).getEmail()+"<br>";
				
				String phoneNumber = listOfPassengers.get(0).getPhoneNumber();
				if(phoneNumber!=null && phoneNumber.length()>0) {
					emailMessage+= "phone number : " + phoneNumber+"<br>";
				}
				
				String customersSurname = listOfPassengers.get(0).getSurname();

				emailMessage+="<br>"
						+ "Please take note that the name assiocated to this booking is : " +listOfPassengers.get(0).getSurname()+"<br>"
						+ "This can be usefull on the "
						+ "<a href=\"http://localhost:8080/booking/searchBooking.jsp?surname="+customersSurname+"&bookingID="+outwardBooking.getBookingID()+ "\">My booking</a>"
						+ " page.<br>"
						+ "<br>"
						+ "<br>"
						+ "You will receive an email with the checkin informations a few days before your flight.<br>"
						+ "<br>"
						+ "We thank you for using our compagny to fly around the world.<br>"
						+ "<b>Air Asmus</b>";
				
				emailMessage+="</h4></div>";
				
				
				
				
				
				
				mailService.sendTo(listOfPassengers.get(0).getEmail(), "Booking done" , emailMessage);
			}


			if(lang!=null && lang.equals("fr")) {
				res.sendRedirect("/FR/booking/bookingDone.jsp");
			}else {
				res.sendRedirect("/booking/bookingDone.jsp");
			}

		}catch(java.lang.NumberFormatException e ){
			e.printStackTrace();
			
			if(lang!=null && lang.equals("fr")) {
				res.sendRedirect("/FR/error/parameterError.html");
			}else {
				res.sendRedirect("/error/parameterError.html");
			}
		}catch(NullPointerException e ){
			e.printStackTrace();
			if(lang!=null && lang.equals("fr")) {
				res.sendRedirect("/FR/error/parameterError.html");
			}else {
				res.sendRedirect("/error/parameterError.html");
			}
		}catch(Exception e2 ){
			e2.printStackTrace();
			if(lang!=null && lang.equals("fr")) {
				res.sendRedirect("/FR/error/error.html");
			}else {
				res.sendRedirect("/error/error.html");
			}
		}
	}
}
