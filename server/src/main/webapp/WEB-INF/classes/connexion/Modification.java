package connexion;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.servlet.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Modification extends HttpServlet
{
	public void doGet( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{


		res.setContentType("text/html,charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println( "</head><body>" );

		try(Connection con = DS.getConnection()){


			HttpSession session = req.getSession( true );
			String login = (String)session.getAttribute( "login" );
			out.println( "<head><title>Modification "+ login +"</title></head>" );

			//requete
			String query = "Select * from personne where login = ?";

			PreparedStatement ps = con.prepareStatement( query );
			// out.println("query"+query);
			ps.setString(1, login);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {

				out.println("<h1>Lecture : "+login+"</h1>");

				ResultSetMetaData rsmd = rs.getMetaData();

				out.println("<h1>anciennes valeurs : </h1>");
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
				

				out.println("<h1><br>nouvelles valeurs pour "+login+": </h1>");

				out.println("<form action=\"servlet-Modification\" method=\"post\">");
				out.println("nom : <input name=\"nom\"   type=\"text\" ><br>");
				out.println("prenom : <input name=\"prenom\"   type=\"text\" ><br>");
				out.println("adresse : <input name=\"adresse\"   type=\"text\" ><br>");
				out.println("email : <input name=\"email\"   type=\"text\" ><br>");
				out.println("tel : <input name=\"tel\"   type=\"text\" ><br>");
				out.println("<input type=\"submit\" value=\"Appliquer modification\"><br>");
				out.println("</form>");
				
				

				out.println("<br><br><a href=\"http://localhost:8080/Menu\">retour Menu</a>");

				out.println( "</body>" );	
			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	}
	
	public void doPost( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{

		Connection con=null;
		try{
			// enregistrement du driver
			//pour h2 : org.h2.Driver
			Class.forName("org.postgresql.Driver");

			// connexion à la base
			String url = "jdbc:postgresql://psqlserv/fi2";
			String nom = "onquiera";
			String mdp = "moi";
			con = DriverManager.getConnection(url,nom,mdp);

			String query = "Update personne set nom = ?, prenom = ?, adresse = ?, email = ?, tel= ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, req.getParameter("nom"));
			ps.setString(2, req.getParameter("prenom"));
			ps.setString(3, req.getParameter("adresse"));
			ps.setString(4, req.getParameter("email"));
			ps.setString(5, req.getParameter("tel"));

			ps.executeUpdate();
			
			res.sendRedirect("servlet-Lecture");
		
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		finally{
			try{
				// fermeture des espaces
				con.close();
				System.out.println("closed.");
			}catch(Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
	}
}
