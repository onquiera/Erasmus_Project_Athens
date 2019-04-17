package connexion;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/servlet-statut")
public class Statut extends HttpServlet
{  
    public void doGet( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	res.setContentType("text/html,charset=UTF-8");
	PrintWriter out = res.getWriter();
	out.println( "<head><title>servlet Login</title></head>" );
	out.println( "<body>" );
		  
	try{
		
	    HttpSession session = req.getSession( true );
	    String login = (String)session.getAttribute( "login" );
	    if(login!=null){
//	    	out.println("<h2>Utilisateur existe !</h2>");
	    	res.sendRedirect("Menu");
	    }else {
	    	out.println("<h2>Utilisateur n'existe pas !</h2>");

			out.println("<br><br><a href=\"http://localhost:8080/Login.html\">retour Login</a>");

	    }
		
	    out.println( "</body>" );
			  
	}catch(Exception e1){
	    System.out.println(e1.getMessage());
	}
    }
}
