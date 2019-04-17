package connexion;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/Menu")
public class Menu extends HttpServlet
{
	public void service( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{
		//redirection si pas de login
	    HttpSession session = req.getSession( true );
	    String login = (String)session.getAttribute( "login" );
	    
	    if(login==null){
		res.sendRedirect("Login.html");
	    }

		res.setContentType("text/html,charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println( "</head><body>" );

		out.println( "<HTML>");
		out.println( "<HEAD><TITLE>Menu</TITLE></HEAD>");
		out.println( "<BODY>");
		out.println( "<h1>");
		out.println( "Menu : <br>");
		out.println( "<center>");
		out.println( "<a href=\"http://localhost:8080/servlet-Lecture\">Lecture</a>");
		out.println( "<br>");
		out.println( "<a href=\"http://localhost:8080/servlet-Modification\">Modification</a>");

		out.println( "</h1>");
		out.println( "<br><br><br><br><br><br><br><br><br><br><br><br>");
		out.println( "<a href=\"http://localhost:8080/Login.html\">Login</a>");
		out.println( "	<br>");
		out.println( "<a href=\"http://localhost:8080/servlet-Deconnecte\">Deconnexion</a>");

		out.println( "</center>");
		out.println( "</BODY>");
		out.println( "</HTML>");


	}
}