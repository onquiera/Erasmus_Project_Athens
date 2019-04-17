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
@WebServlet("/servlet-signin")
public class SignIn extends HttpServlet
{
	public void doPost( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{
		try(Connection con = DS.getConnection()){
			//reset de l'attribut en session
			HttpSession session = req.getSession( true );
			session.setAttribute("login", null );

			String email;
			String name;
			String surname;
			int genre;
			String password;
			int role = 0;
			Users newUsers=null;

			
			//TODO rendre le try mieux avec un boolean
			
			try {
				
				email = req.getParameter("email");
				name = req.getParameter("name");
				surname = req.getParameter("surname");
				genre = Integer.parseInt(req.getParameter("genre"));
				password = req.getParameter("password");

				
				//TODO tester les valeurs > verifier si format email correct ... (un peu annexe mais fonctionnalité cool)
				//tester si un champ n'est pas vide et afficher erreur champ vide
				//> peut-être le faire avec un petit code js dans balise script ?
				//TODO rajouter champ password2 et verifier si les 2 correspondent
				//TODO tester si email existe deja
				
				//renvoyer la ou les erreur(s) en session ou en parametre de la page signin 
				// > (la transformer en jsp   ou ++ en servlet avec out.println et recuperer en post(si on veut securiser))
				
				newUsers = new Users(email, name, surname, genre, password, role);

				UsersDAO dao = new UsersDAO();
				dao.create(newUsers);

				//	l'inscription est faite > on range ça en session

				session.setAttribute("login", email );

				//TODO ranger en attribut d'autre element, genre prenom et nom ? > pour les affiché à coté du connécté
				//à voir ce qui est le plus beau

				res.sendRedirect("index.jsp");

			}catch(java.lang.NumberFormatException e) { //TODO remplacer ça par les exceptions possible(notament invalid format exception)
				e.printStackTrace();

				//TODO message pour dire que inscription incorrecte
				//TODO stocker les valeurs pour pas que l'utilisateur ai à tout retaper.
				res.sendRedirect("sign-in.html");
			}

		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	}
}
