package flights;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

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

			int reservationnumber = -1;
			String clientname = "";

			reservationnumber = Integer.parseInt(req.getParameter("reservationID"));
			clientname = req.getParameter("surname");

			BookingDAO dao = new BookingDAO();
			Booking booking = dao.find(reservationnumber);

			if (booking == null) {
				out.println("<h1>Booking not found </h1>");
			} else if (!booking.getClientname().equals(clientname)) {
				out.println("<h1>Client name doesn't match booking id</h1>");
			} else {
				out.println("<h1> Your reservation : </h1>");
				out.println("<h3> client : " + booking.getClientname() + "</h3>");
				out.println("<h3> reservation number : " + booking.getReservationnumber() + "</h3>");
				out.println("<h3> seat number : " + booking.getSeatnumber() + "</h3>");
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
