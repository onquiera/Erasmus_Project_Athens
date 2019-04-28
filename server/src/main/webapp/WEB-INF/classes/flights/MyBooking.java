package flights;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;

import connexion.DS;

import javax.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/MyBooking")
public class MyBooking extends HttpServlet
{
	public void doPost( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{


		res.setContentType("text/html,charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println( "<head><title>My Booking</title></head>" );
		out.println( "</head><body>" );

//TODO ajouter détails > exemple pas flight id mais détails du vol
		
		try{

			//reservationnumber |  flightid  | seatnumber | clientname | clientemail 

			int reservationnumber=-1;
			String clientname="";

			reservationnumber = Integer.parseInt(req.getParameter("reservationID"));
			clientname = req.getParameter("surname");

			BookingDAO dao = new BookingDAO();
			Booking booking = dao.find(reservationnumber);

			if(booking==null) {
				out.println( "<h1>Booking not found </h1>" );
			}else if(!booking.getClientname().equals(clientname)) {
				out.println( "<h1>Client name doesn't match booking id</h1>" );
			}
			else {
				out.println( "<h1> Your reservation : </h1>" );
				out.println( "<h3> client : "+ booking.getClientname()  +"</h3>" );
				out.println( "<h3> reservation number : "+ booking.getReservationnumber()  +"</h3>" );
				out.println( "<h3> seat number : "+ booking.getSeatnumber()  +"</h3>" );
				out.println( "<h3> flight id : "+ booking.getFlightid()  +"</h3>" );

			}

		}catch(java.lang.NumberFormatException e1) {
			out.println( "<h1>Invalid parameters </h1>" );
		}
		catch(Exception e2){
			e2.printStackTrace();

		}

		out.println( ""
				+ "<a href=\"searchBooking.jsp\">Back to booking search</a>"
				+ "</body>" );
	}
}
