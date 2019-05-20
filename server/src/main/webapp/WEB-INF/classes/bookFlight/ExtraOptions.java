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
				System.out.println("\n\n\n session is invalid \n\n\n");
				res.sendRedirect("/error/sessionError.html");
			}

			//PARAMETERS management
			String selectedOption = req.getParameter("selectedOption");
			
			String insuranceChoosed = req.getParameter("insuranceChoosed");
			

			httpSession.setAttribute("insuranceChoosed", insuranceChoosed);
				
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
