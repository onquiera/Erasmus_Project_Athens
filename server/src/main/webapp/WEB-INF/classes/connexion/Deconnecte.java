package connexion;

import java.io.*;
import java.sql.Connection;

import javax.servlet.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Deconnecte extends HttpServlet
{
	public void service( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{

		try(Connection con = DS.getConnection()){


			HttpSession session = req.getSession( true );

			session.invalidate();
			
			res.sendRedirect("index.jsp");
			
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	}
}
