package booking;

import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import seats.PrintSeats;
import seats.SeatsDAO;
import users.*;

@SuppressWarnings("serial")
public class MyBooking extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html,charset=\"UTF-8\"");
		PrintWriter out = res.getWriter();

		// Header
		out.println("" + "<link rel=\"shortcut icon\" type=\"image/png\" href=\"/resources/firstlogo.png\" />"
				+ "<title>Flights</title>" + "<meta charset=\"UTF-8\">"
				+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"

				+ "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\">"
				+ "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js\"></script>"
				+ "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\"></script>"
				+ "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\"></script>"

				+ "<link href=\"https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">"
				+ "<script src=\"https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js\"></script>"

				+ "<script src=\"/js/main.js\" defer></script>"
				+ "<link rel=\"stylesheet\" href=\"/css/progress/personnalInfosStyle.css\"/>"
				+ "<link rel=\"stylesheet\" href=\"/css/basics.css\" />");

		// Content
		out.println("</head><body>" + "<div id=\"logo\">"
				+ "<a href=\"/\"><img src=\"/resources/logo.png\" alt=\"Insert logo here\" id=\"home\"></a>" + "</div>"

				+ "<nav id=\"navBar\"></nav>" + "<div id=\"textArea2\">"
				+ " <div class=\"container\" id=\"pInfoForm\">");

		try {

			int bookingID = -1;
			String surname = "";

			try {
				bookingID = Integer.parseInt(req.getParameter("bookingID"));
			} catch (java.lang.NumberFormatException e) {
				out.println("Wrong format for bookingID(should be a number)");
				bookingID = -1;
			}
			surname = req.getParameter("surname");

			BookingDAO bookingDAO = new BookingDAO();
			Booking booking = bookingDAO.find(bookingID);

			if (booking == null) {
				out.println("<h1>Booking not found </h1>");

				out.println("<br><br><br>");

			} else {

				PassengerDAO passengerDAO = new PassengerDAO();
				Passenger customer = passengerDAO.find(booking.getMainPassengerNO());

				if (!surname.equals(customer.getSurname())) {
					out.println("<h1>Surname doesn't match booking id</h1>");

				} else {
					SeatsDAO seatsDAO = new SeatsDAO();
					ArrayList<String> seatsSelected = seatsDAO.findBookedSeatsOnBooking(booking.getBookingID());

					out.println("<h3><b> Your booking informations : </b></h3>");
					out.println("Booking ID: " + booking.getBookingID() + "<br>");
					out.println("Flight ID: " + booking.getFlightid() + "<br>");

					out.println("Selected seats (in blue): <br>");
					PrintSeats.printSeatsSelected(out, booking.getFlightid(), seatsSelected);

					
					ArrayList<Passenger> listOfPassengers = bookingDAO.findAllPassengersOnBooking(bookingID);
					int cpt = 1;

					out.println("<br><h3>Passengers :</h3>");
					for (Passenger passenger : listOfPassengers) {
						out.println("Passenger No " + cpt + ": <br>");
						if (passenger.getTitle() == 1) {
							out.println("Mrs ");
						} else {
							out.println("Mr ");
						}
						out.println(passenger.getFirstName() + " " + passenger.getSurname() + ""
								+ "<br>Date of birth: " + passenger.getDateOfBirth() + "<br><br>");
						cpt++;
					}

					out.println("<u>Contact informations</u> assiociated to your booking:<br> " + "Email: "
							+ listOfPassengers.get(0).getEmail() + "<br>");

					String phoneNumber = listOfPassengers.get(0).getPhoneNumber();
					if (phoneNumber != null && phoneNumber.length() > 0) {
						out.println("Phone number : " + phoneNumber + "<br>");
					}

					out.println("</h3>");

				}
			}

			out.println("<br><h3>" + "<a href=\"/booking/searchBooking.jsp\">Back to booking research</a></h3>"
					+ "</div></div>");
			out.println("<nav id=\"footer\"></nav></body>");

		} catch (java.lang.NumberFormatException e) {
			e.printStackTrace();
			res.sendRedirect("/error/parameterError.html");
		} catch (NullPointerException e) {
			e.printStackTrace();
			res.sendRedirect("/error/parameterError.html");
		} catch (Exception e2) {
			e2.printStackTrace();
			res.sendRedirect("/error/error.html");
		}
	}
}
