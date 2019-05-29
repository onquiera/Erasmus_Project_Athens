package connexion;

import java.io.*;
import java.sql.Connection;

import javax.servlet.*;
import javax.servlet.http.*;

import users.Users;
import users.UsersDAO;

@SuppressWarnings("serial")
public class Authentification extends HttpServlet
{
	public void doPost( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{
		String lang = null;
		try(Connection con = DS.getConnection()){
			//reset de l'attribut en session
			HttpSession session = req.getSession( true );
			session.setAttribute("login", null );
			lang = req.getParameter("lang");
			
			//puis recupération des paramètres de connexion
			String login = req.getParameter("login");
			String password = req.getParameter("password");

			UsersDAO dao = new UsersDAO();
			Users utilisateur = dao.find(login);
			
			if(utilisateur!=null && utilisateur.getPassword().equals(password)) {
				//creer session avez attribut souhaité
				session.setAttribute("login", login );
				session.setMaxInactiveInterval(10);
			}
			//to make it better > send a parameter to status to say what the error is(username doesn't exit, password doesn't match ..)
			res.sendRedirect("servlet-status");

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
