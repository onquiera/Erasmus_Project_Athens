package connexion;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/servlet-Lecture")
public class Lecture extends HttpServlet
{
	public void service( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{


		res.setContentType("text/html,charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println( "</head><body>" );

		try(Connection con = DS.getConnection()){

			HttpSession session = req.getSession( true );
			String login = (String)session.getAttribute( "login" );
			out.println( "<head><title>Lecture "+ login +"</title></head>" );

			//requete
			String query = "Select * from personne where login = ?";

			PreparedStatement ps = con.prepareStatement( query );
			// out.println("query"+query);
			ps.setString(1, login);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				
				out.println("<h1>Lecture : "+login+"</h1>");
				
				ResultSetMetaData rsmd = rs.getMetaData();

				out.println("<table>");


			    //titre des colonnes
				out.println("<tr>");
				for(int i =1; i<=rsmd.getColumnCount();i++){
					String valeur=rsmd.getColumnLabel(i);
					out.println("<th>"+valeur+"</th>");
				}
				out.println("</tr>");


			    //valeurs
				out.println("<tr>");
				for(int i =1; i<=rsmd.getColumnCount();i++){
					String valeur=rs.getString(i);
					out.println("<td>"+valeur+"</td>");
				    }
				out.println("</tr>");
				
				
				out.println("</table>");
				

				out.println("<br><br><a href=\"http://localhost:8080/Menu\">retour Menu</a>");

				out.println( "</body>" );	

			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	}
}
