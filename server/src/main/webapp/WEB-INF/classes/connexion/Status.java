package connexion;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/servlet-status")
public class Status extends HttpServlet
{  
    public void doGet( HttpServletRequest req, HttpServletResponse res )
	throws ServletException, IOException
    {
	res.setContentType("text/html,charset=UTF-8");
	PrintWriter out = res.getWriter();
	out.println( "<head><title>Connection status</title></head>" );
	out.println( "<body>" );
		  
	try{
		
	    HttpSession session = req.getSession( true );
	    String login = (String)session.getAttribute( "login" );
	    if(login!=null){
//	    	out.println("<h2>Utilisateur existe !</h2>");
	    	res.sendRedirect("index.jsp");
	    }else {
	    	out.println("<h2>User doesn't exist !</h2>");

			out.println("<br><br><a href=\"http://localhost:8080/login.html\">Back to login</a>");

	    }
		
	    out.println( "</body>" );
			  
	}catch(Exception e1){
	    System.out.println(e1.getMessage());
	}
    }
}
