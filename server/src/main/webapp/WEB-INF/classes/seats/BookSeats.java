package seats;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connexion.DS;

@SuppressWarnings("serial")
public class BookSeats extends HttpServlet
{
	@SuppressWarnings("unchecked")
	public void doGet( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{
		String lang = null;

		res.setContentType("text/html,charset=UTF-8");

		try(Connection con = DS.getConnection()){
			lang = req.getParameter("lang");
			HttpSession httpSession = req.getSession(false);
			//check if session is valid
			if(httpSession==null || !req.isRequestedSessionIdValid() ){

					if(lang!=null && lang.equals("fr")) {
						res.sendRedirect("/FR/error/sessionError.html");
					}else {
						res.sendRedirect("/error/sessionError.html");
					}
			}

			//departure    destination    flightDate    numberofpeople

			//recuperation des parametres
			String flightType = req.getParameter("flightType");
			
			
			ArrayList<String> selectedSeats = (ArrayList<String>)httpSession.getAttribute("selectedSeats");
			if(selectedSeats==null) {
				res.sendRedirect("/error/sessionError.html");

				if(lang!=null && lang.equals("fr")) {
					res.sendRedirect("/FR/error/sessionError.html");
				}else {
					res.sendRedirect("/FR/error/sessionError.html");
				}
			}
			
			if(flightType.equals("outward")) {
				ArrayList<String> outwardSelectedSeats = new ArrayList<String>();
				outwardSelectedSeats.addAll(selectedSeats);
				//we clear it because there is a potential return where seats will be selected
				selectedSeats.clear();
				
				httpSession.setAttribute("outward-seats", outwardSelectedSeats);
				
				String returnDate = (String)httpSession.getAttribute("returnDate");
				if(returnDate==null) {

					if(lang!=null && lang.equals("fr")) {
						res.sendRedirect("/FR/booking/personnal-informations.jsp");
					}else {
						res.sendRedirect("/FR/booking/personnal-informations.jsp");
					}
				}else {
					if(lang!=null && lang.equals("fr")) {
						res.sendRedirect("/FR/booking/seats.jsp?flightType=return");
					}else {
						res.sendRedirect("/booking/seats.jsp?flightType=return");
					}
				}
				
			}else if(flightType.equals("return")) {
				httpSession.setAttribute("return-seats", selectedSeats);

				if(lang!=null && lang.equals("fr")) {
					res.sendRedirect("/FR/booking/personnal-informations.jsp");
				}else {
					res.sendRedirect("/booking/personnal-informations.jsp");
				}
				
				
			}else {
				if(lang!=null && lang.equals("fr")) {
					res.sendRedirect("/FR/error/parameterError.html?error=parameter+flightType+error");
				}else {
					res.sendRedirect("/error/parameterError.html?error=parameter+flightType+error");
				}
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

