package bookFlight;

import java.io.*;
import java.sql.Connection;

import javax.servlet.*;
import javax.servlet.http.*;

import connexion.DS;

@SuppressWarnings("serial")
public class SearchFlight extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html,charset=UTF-8");


		String flightType = req.getParameter("flightType");

		// traduction : vol aller = outward flight

		if (flightType.equals("research")) {
			
			try (Connection con = DS.getConnection()) {

				// PARAMETERS management
				String departure = req.getParameter("departure");
				String destination = req.getParameter("destination");
				String departureDate = req.getParameter("departureDate");
				String returnDate = req.getParameter("returnDate");
				int numberOfPassengers = Integer.parseInt(req.getParameter("numberOfPassengers"));
				String travelClass = req.getParameter("travelClass");

				// TODO check on other pages if session still valid

				HttpSession httpSession = req.getSession(false);

				// session reset if user starts or restarts a research
				if (httpSession != null) {
					httpSession.invalidate();
				}
				httpSession = req.getSession(true);
				httpSession.setMaxInactiveInterval(20 * 60); // session de 20 minutes d'inactivité

				// out.println("inactive session time : "+
				// httpSession.getMaxInactiveInterval());
				// TODO faire compteur et afficher ça à l'utilisateur pour plus tard :) > un
				// détail

				httpSession.setAttribute("departure", departure);
				httpSession.setAttribute("destination", destination);
				httpSession.setAttribute("departureDate", departureDate);
				httpSession.setAttribute("returnDate", returnDate);
				httpSession.setAttribute("numberOfPassengers", numberOfPassengers);
				httpSession.setAttribute("travelClass", travelClass);
				
				res.sendRedirect("/booking/choose-flight.jsp?flight=outward");

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
			
			
			String returnDate = (String)httpSession.getAttribute("returnDate");
			if(returnDate==null) {
				res.sendRedirect("/booking/seats.jsp?flightType=outward");
			}else {
				res.sendRedirect("/booking/choose-flight.jsp?flight=return");
			}
			
			
		}else if(flightType.equals("return")) {
			
			HttpSession httpSession = req.getSession(false);
			//check if session is valid
			if(httpSession==null || !req.isRequestedSessionIdValid() ){
					res.sendRedirect("/error/sessionError.html");
			}
			
			String flightID = req.getParameter("flightID");
			if(flightID==null) {
				res.sendRedirect("/error/parameterError.html?error=flightID+not+found");
			}
			
			httpSession.setAttribute("returnFlightID", flightID);
			
			res.sendRedirect("/booking/seats.jsp?flightType=outward");
			
			
		}else {
			res.sendRedirect("/error/parameterError.html?error=parameter+flightType+error");
		}
	}
}
