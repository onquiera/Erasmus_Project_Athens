package connexion;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/servlet-Deconnecte")
public class Deconnecte extends HttpServlet
{
	public void service( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{

		try(Connection con = DS.getConnection()){


			HttpSession session = req.getSession( true );

			session.invalidate();
			
			res.sendRedirect("Login.html");
			
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	}
}
