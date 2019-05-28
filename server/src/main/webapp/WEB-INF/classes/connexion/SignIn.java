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
			//reset de l'attribut en session
			HttpSession session = req.getSession( true );
			session.setAttribute("login", null );

			int title;
			String name;
			String surname;
			Date dateOfBirth;
			String email;
			String password;
			String phoneNumber;//(optional)
			int role = 0;
			
			//TODO rendre le try mieux avec un boolean
			
			try {
				title = Integer.parseInt(req.getParameter("title"));
				name = req.getParameter("name");
				surname = req.getParameter("surname");
				//birth date from string to sql
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dateOfBirthUtil = dateFormat.parse(req.getParameter("dateOfBirth"));
				dateOfBirth = new java.sql.Date(dateOfBirthUtil.getTime()); 
				email = req.getParameter("email");
				password = req.getParameter("password");
				phoneNumber = req.getParameter("phoneNumber");
				
				 
				//TODO tester les differentes valeurs en js
				
				//apres requete jee > tester si email exise pas deja ?

				PassengerDAO passengerDAO = new PassengerDAO();
				int pno=passengerDAO.maxPNO()+1;
				Passenger newPassenger= new Passenger(pno, name, surname, title, dateOfBirth, phoneNumber, email);
				
				passengerDAO.create(newPassenger);
				
				Users newUsers = new Users(-1, pno, password, role);
				UsersDAO dao = new UsersDAO();
				dao.create(newUsers);

				//	l'inscription est faite > on range ça en session

				session.setAttribute("login", email );
				
				MailService mailService = new MailService();
				mailService.sendTo(email, "succesfully registered", "Welcome on air  Asmus !\n\n You have succesfully been registered. ");

				res.sendRedirect("/index.jsp");
				
			}catch(java.lang.NumberFormatException e) { //TODO remplacer ça par les exceptions possible(notament invalid format exception)
				e.printStackTrace();

				//TODO message pour dire que inscription incorrecte
				//TODO stocker les valeurs pour pas que l'utilisateur ai à tout retaper.
				res.sendRedirect("/sign-in.html");
			}

		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	}
}
