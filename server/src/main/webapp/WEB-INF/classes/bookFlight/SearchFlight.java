package bookFlight;

import java.io.*;
import java.sql.Connection;

import javax.servlet.*;
import javax.servlet.http.*;

import connexion.DS;
import flights.FlightWithDetails;
import flights.FlightsDAO;

@SuppressWarnings("serial")
public class SearchFlight extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html,charset=UTF-8");

		String flightType = req.getParameter("flightType");
		String lang = req.getParameter("lang");

		//traduction : vol aller = outward flight

		if (flightType.equals("research")) {
			try (Connection con = DS.getConnection()) {

				// PARAMETERS management
				String departure = req.getParameter("departure");
				String destination = req.getParameter("destination");
				String departureDate = req.getParameter("departureDate");
				String returnDate = req.getParameter("returnDate");
				int numberOfPassengers = Integer.parseInt(req.getParameter("numberOfPassengers"));
				String travelClass = req.getParameter("travelClass");

				HttpSession httpSession = req.getSession(false);

				// session reset if user starts or restarts a research
				if (httpSession != null) {
					httpSession.invalidate();
				}
				httpSession = req.getSession(true);
				//the sessin is 20 minutes long
				httpSession.setMaxInactiveInterval(20 * 60);

				httpSession.setAttribute("departure", departure);
				httpSession.setAttribute("destination", destination);
				httpSession.setAttribute("departureDate", departureDate);
				httpSession.setAttribute("returnDate", returnDate);
				httpSession.setAttribute("numberOfPassengers", numberOfPassengers);
				httpSession.setAttribute("travelClass", travelClass);
				httpSession.setAttribute("price", 0);
				

				if(lang!=null && lang.equals("fr")) {
					res.sendRedirect("/FR/booking/choose-flight.jsp?flight=outward");
				}else {
					res.sendRedirect("/booking/choose-flight.jsp?flight=outward");
				}
				
				res.sendRedirect("/booking/choose-flight.jsp?flight=outward");

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
			
		} else if(flightType.equals("outward")) {

			HttpSession httpSession = req.getSession(false);
			//check if session is valid
			if(httpSession==null || !req.isRequestedSessionIdValid() ){
					res.sendRedirect("/error/sessionError.html");
			}
			
			String flightID = req.getParameter("flightID");
			if(flightID==null) {
				res.sendRedirect("/error/parameterError.html?error=flightID+not+found");
			}
			
			httpSession.setAttribute("outwardFlightID", flightID);
			
			int numberOfPassengers = (Integer)httpSession.getAttribute("numberOfPassengers");
			
			FlightsDAO dao = new FlightsDAO();
			FlightWithDetails outwardFlight = dao.findFlight(flightID);
			httpSession.setAttribute("price", outwardFlight.getPrice()*numberOfPassengers);
			
			
			String returnDate = (String)httpSession.getAttribute("returnDate");
			if(returnDate==null) {
				if(lang!=null && lang.equals("fr")) {
					res.sendRedirect("/FR/booking/seats.jsp?flightType=outward");
				}else {
					res.sendRedirect("/booking/seats.jsp?flightType=outward");
				}
			}else {
				if(lang!=null && lang.equals("fr")) {
					res.sendRedirect("/FR/booking/choose-flight.jsp?flight=return");
				}else {
					res.sendRedirect("/booking/choose-flight.jsp?flight=return");
				}
			}
			
		}else if(flightType.equals("return")) {
			
			HttpSession httpSession = req.getSession(false);
			//check if session is valid
			if(httpSession==null || !req.isRequestedSessionIdValid() ){
					if(lang!=null && lang.equals("fr")) {
						res.sendRedirect("/FR/error/sessionError.html");
					}else {
						res.sendRedirect("/error/sessionError.html");
					}
			}
			
			String flightID = req.getParameter("flightID");
			if(flightID==null) {
				if(lang!=null && lang.equals("fr")) {
					res.sendRedirect("/FR/error/parameterError.html?error=flightID+not+found");
				}else {
					res.sendRedirect("/error/parameterError.html?error=flightID+not+found");
				}
			}
			httpSession.setAttribute("returnFlightID", flightID);
			
			FlightsDAO dao = new FlightsDAO();
			FlightWithDetails returnFlight = dao.findFlight(flightID);
			int price = (Integer)httpSession.getAttribute("price");
			httpSession.setAttribute("price", price + returnFlight.getPrice());
			
			if(lang!=null && lang.equals("fr")) {
				res.sendRedirect("/FR/booking/seats.jsp?flightType=outward");
			}else {
				res.sendRedirect("/booking/seats.jsp?flightType=outward");
			}
		}else {
			if(lang!=null && lang.equals("fr")) {
				res.sendRedirect("/FR/error/parameterError.html?error=parameter+flightType+error");
			}else {
				res.sendRedirect("/error/parameterError.html?error=parameter+flightType+error");
			}
		}
	}
}
