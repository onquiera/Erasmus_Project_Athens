package mailing;

import java.io.*;
import java.sql.Connection;

import javax.servlet.*;
import javax.servlet.http.*;

import connexion.DS;

@SuppressWarnings("serial")
public class Contact extends HttpServlet
{
	public void doPost( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{
		try(Connection con = DS.getConnection()){

			String email = req.getParameter("email");
			String subject = req.getParameter("subject");
			String problem = req.getParameter("problem");
			
			
			MailService mailService = new MailService();
			
			//message to customer service
			mailService.sendTo(MailService.AIR_VACATIONS_EMAIL, subject, problem);
			
			//message good received email
			mailService.sendTo(email, "Message Received", "We received your message and are working on it !"
					+ "\nYou will receive an email from our customers service soon."
					+ "\n AirVacation");
			
			res.sendRedirect("/informations/messageReceived.html");
			
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
