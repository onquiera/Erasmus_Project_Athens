package connexion;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Status extends HttpServlet
{  
	public void doGet( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{
		res.setContentType("text/html,charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println( "<head><title>Connection status</title></head>" );
		out.println( "<body>" );

		String lang = null;
		
		try{
			lang = req.getParameter("lang");
			HttpSession session = req.getSession( true );
			String login = (String)session.getAttribute( "login" );
			if(login!=null){

				if(lang!=null && lang.equals("fr")) {
					res.sendRedirect("/FR/index.jsp");
				}else {
					res.sendRedirect("/");
				}
			}else {
				out.println("<h2>User doesn't exist !</h2>");

				out.println("<br><br><a href=\"/connexion/login.html\">Back to login</a>");

			}

			out.println( "</body>" );

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
