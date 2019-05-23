package bookFlight;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import users.Passenger;
import users.PassengerDAO;

@SuppressWarnings("serial")
public class ExtraOptions extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{

		try{
			HttpSession httpSession = req.getSession(false);
			//check if session is valid
			if(httpSession==null || !req.isRequestedSessionIdValid() ){
					res.sendRedirect("/error/sessionError.html");
			}

			//PARAMETERS management
			String flightOption = req.getParameter("flightOption");
			String insurance = req.getParameter("insurance");
			
			ArrayList<Passenger> listOfPassengers = (ArrayList<Passenger>) httpSession.getAttribute("listOfPassengers");
			
			int price = (Integer)httpSession.getAttribute("price");
			
			if(flightOption.equals("business")) {
				price +=50;
			}else if(flightOption.equals("EcoFlex")) {
				price +=25;
			}
			
			if(insurance.equals("yes")){
				price+=16*listOfPassengers.size();
			}
			
			httpSession.setAttribute("flightOption", flightOption);
			httpSession.setAttribute("insurance", insurance);
			httpSession.setAttribute("price", price);
				
			res.sendRedirect("/booking/confirmation.jsp");
			
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
