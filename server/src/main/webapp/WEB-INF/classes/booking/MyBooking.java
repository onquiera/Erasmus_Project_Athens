package booking;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import users.*;

@SuppressWarnings("serial")
public class MyBooking extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html,charset=UTF-8");
		PrintWriter out = res.getWriter();

		// Header
		out.println("" + "<link rel=\"shortcut icon\" type=\"image/png\" href=\"/resources/firstlogo.png\" />"
				+ "<title>Flights</title>" + "<meta charset=\"utf-8\">"
				+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"

				+ "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\">"
				+ "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js\"></script>"
				+ "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\"></script>"
				+ "<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\"></script>"

				+ "<link href=\"https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">"
				+ "<script src=\"https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js\"></script>"

				+ "<script src=\"/js/main.js\" defer></script>"
				+ "<link rel=\"stylesheet\" href=\"/css/basics.css\" />");

		// Content
		out.println("</head><body>" + "<div id=\"logo\">"
				+ "<a href=\"/\"><img src=\"/resources/logo.png\" alt=\"Insert logo here\" id=\"home\"></a>" + "</div>"

				+ "<nav id=\"navBar\"></nav>");

		// TODO ajouter détails > exemple pas flight id mais détails du vol

		try {
			// reservationnumber | flightid | seatnumber | clientname | clientemail

			int bookingID = -1;
			String email = "";

			bookingID = Integer.parseInt(req.getParameter("bookingID"));
			email = req.getParameter("email");

			BookingDAO bookingDAO = new BookingDAO();
			Booking booking = bookingDAO.find(bookingID);

			PassengerDAO passengerDAO = new PassengerDAO();
			Passenger passenger = passengerDAO.find(booking.getMainPassengerNO());
			
			
			
			if (booking == null) {
				out.println("<h1>Booking not found </h1>");
			} else if (!email.equals(passenger.getEmail())) {
				out.println("<h1>Email name doesn't match booking id</h1>");
			} else {
				out.println("<h1> Your reservation : </h1>");
				out.println("<h3> client : "+passenger.getName() +" " + passenger.getName() + "</h3>");
				out.println("<h3> Booking ID : " + booking.getBookingID() + "</h3>");
				out.println("<h3> flight id : " + booking.getFlightid() + "</h3>");
			}

		} catch (java.lang.NumberFormatException e1) {
			out.println("<h1>Invalid parameters </h1>");
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		out.println("" + "<a href=\"/booking/searchBooking.jsp\">Back to booking search</a>"
				+ "<nav id=\"footer\"></nav></body>");
	}
}
