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
		String lang = null;
		try(Connection con = DS.getConnection()){
			lang = req.getParameter("lang");

			HttpSession session = req.getSession( true );

			session.invalidate();
			
			if(lang!=null && lang.equals("fr")) {
				res.sendRedirect("/FR/index.jsp");
			}else {
				res.sendRedirect("/");
			}
			
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
