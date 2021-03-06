package bookFlight;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.http.*;

import users.Passenger;
import users.PassengerDAO;

@SuppressWarnings("serial")
public class PersonnalInformations extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{
		String lang = null;
		try{
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

			//PARAMETERS management
			int numberOfPassengers = (Integer)httpSession.getAttribute("numberOfPassengers");
			String email=req.getParameter("email");
			String phoneNumber=req.getParameter("phoneNumber");

			
			PassengerDAO daoPassengers = new PassengerDAO();
			int maxPNO = daoPassengers.maxPNO();
			ArrayList<Passenger> listOfPassengers = new ArrayList<Passenger>();
			
			for (int i = 1; i < numberOfPassengers+1; i++) {
				int title = Integer.parseInt(req.getParameter("passenger-"+i+"-title"));
				String name=req.getParameter("passenger-"+i+"-name");
				String surname=req.getParameter("passenger-"+i+"-surname");
				//departure date from string to sql
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dateOfBirthUtil = dateFormat.parse(req.getParameter("passenger-"+i+"-dateOfBirth"));
				java.sql.Date dateOfBirth = new java.sql.Date(dateOfBirthUtil.getTime()); 
				
				listOfPassengers.add(new Passenger(maxPNO+i, name, surname, title, dateOfBirth, null, null));
			}

			//contact information joined to first passenger
			listOfPassengers.get(0).setEmail(email);
			listOfPassengers.get(0).setPhoneNumber(phoneNumber);
			
			httpSession.setAttribute("listOfPassengers", listOfPassengers);
			
			if(lang!=null && lang.equals("fr")) {
				res.sendRedirect("/FR/booking/extraOptions.jsp");
			}else {
				res.sendRedirect("/booking/extraOptions.jsp");
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
