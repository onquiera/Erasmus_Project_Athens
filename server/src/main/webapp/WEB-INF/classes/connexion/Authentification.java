package connexion;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/Authentification")
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

			//requete
			String query = "Select * from users where email = ? AND password = ?";

			PreparedStatement ps = con.prepareStatement( query );
			
			ps.setString(1, login);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			//System.out.println("ps: " +ps);
			
			if(rs.next()) {
				//creer session avez attribut souhaité
				session.setAttribute("login", login );
				session.setMaxInactiveInterval(10);
			}
			
			res.sendRedirect("servlet-statut");

		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	}
}
