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
		try(Connection con = DS.getConnection()){
			//reset de l'attribut en session
			HttpSession session = req.getSession( true );
			session.setAttribute("login", null );

			
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
			//TODO diffencier les if et envoyer un parametre à statut > si utilisateur inexistant ou si password incorrect
			res.sendRedirect("servlet-status");

		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	}
}
