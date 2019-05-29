package connexion;

import java.io.*;
import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.mail.SendFailedException;
import javax.servlet.*;
import javax.servlet.http.*;

import mailing.MailService;
import users.Passenger;
import users.PassengerDAO;
import users.Users;
import users.UsersDAO;

@SuppressWarnings("serial")
public class SignIn extends HttpServlet
{
	public void doPost( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{
		try(Connection con = DS.getConnection()){
			HttpSession session = req.getSession( true );
			session.setAttribute("login", null );

			int role = 0;
			int title = Integer.parseInt(req.getParameter("title"));
			String name = req.getParameter("name");
			String surname = req.getParameter("surname");
			//birth date from string to sql
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date dateOfBirthUtil = dateFormat.parse(req.getParameter("dateOfBirth"));
			Date dateOfBirth = new java.sql.Date(dateOfBirthUtil.getTime()); 
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String phoneNumber = req.getParameter("phoneNumber");


			PassengerDAO passengerDAO = new PassengerDAO();
			int pno=passengerDAO.maxPNO()+1;
			Passenger newPassenger= new Passenger(pno, name, surname, title, dateOfBirth, phoneNumber, email);

			passengerDAO.create(newPassenger);

			Users newUsers = new Users(-1, pno, password, role);
			UsersDAO dao = new UsersDAO();
			dao.create(newUsers);

			//	sign in is done, we save put it in the session

			session.setAttribute("login", email );

			MailService mailService = new MailService();
			mailService.sendTo(email, "succesfully registered", "Welcome on Air Asmus !\n\n You have succesfully been registered. ");

			res.sendRedirect("/index.jsp");

		}catch(java.lang.NumberFormatException e) {
			e.printStackTrace();

			// to make it better > add parameter to say what the error is 
			//and every information he give in that was correct savec as parameter for autocomplete
			// the user would win a little bit of time
			res.sendRedirect("/sign-in.html");
		}

		catch(NullPointerException e ){
			e.printStackTrace();
			res.sendRedirect("/error/parameterError.html");
		}catch(Exception e2 ){
			e2.printStackTrace();
			res.sendRedirect("/error/error.html");
		}
	}
}
