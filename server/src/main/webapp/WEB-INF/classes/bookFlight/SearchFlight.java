package bookFlight;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.text.SimpleDateFormat;

import javax.servlet.*;
import javax.servlet.http.*;

import connexion.DS;

import javax.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/servlet-SearchFlight")
public class SearchFlight extends HttpServlet
{
	public void doGet( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{

		//req.getRequestDispatcher("/rechercheVille.jsp").forward(req, res);


		res.setContentType("text/html,charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println( "<head><title>My Booking</title>"
				+ ""
				+ "<!--Bootstrap links and scripts-->" + 
				"	<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\">" + 
				"	<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js\"></script>" + 
				"	<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\"></script>" + 
				"	<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\"></script>" + 
				"	" + 
				"	<link href=\"https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css\" rel=\"stylesheet\"" + 
				"		id=\"bootstrap-css\">" + 
				"	<script src=\"https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js\"></script>"
				+ "</head>" );
		out.println( "</head><body>" );







		//TODO ajouter détails > exemple pas flight id mais détails du vol

		try(Connection con = DS.getConnection()){


			//departure    destination    flightDate    numberofpeople

			//recuperation des parametres
			String departure=req.getParameter("departure");
			String destination=req.getParameter("destination");
			String dateForm = req.getParameter("departureDate");




			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date dateUtil = sdf1.parse(dateForm);
			java.sql.Date date = new java.sql.Date(dateUtil.getTime()); 

			//			int numberOfPeople=Integer.parseInt(req.getParameter("numberOfPeople"));

			//recherche dans database
			String query = 
					"Select flightID, a1.name as departure, a2.name as arrival,departureDate, departureTime, arrivalDate, arrivalTime, placesLeft "
							+ "FROM flights fl "
							+ "LEFT JOIN airports a1 ON fl.departurecitycode = a1.code "
							+ "LEFT JOIN airports a2 ON fl.arrivingcitycode = a2.code "
							+ "WHERE a1.name = ? "
							+ "and a2.name = ? "
							+ "and fl.departuredate=?";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setString(1, departure);
			ps.setString(2, destination);
			ps.setDate(3, date);

			ResultSet rs = ps.executeQuery();

			//out.println("|||| ps :"+ ps+" ||||");

			ResultSetMetaData rsmd = rs.getMetaData();




			out.println("<h1>Available flights </h1>");
			out.println("<h2>from :" +departure+" to "+destination+"</h2>");
			out.println("<h2>date : "+dateForm+"</h2>");

			while (rs.next()){

				//titre des colonnes
				out.println("<h3>");
				for(int i =1; i<=rsmd.getColumnCount();i++){

					out.println(rsmd.getColumnLabel(i)+": "+rs.getString(i)+"  ");



				}
				out.println("</h3>");

				//TODO modifier pour vol retour et ajout coordonnées clients
				out.println(""
						+ "<form action=\"/seats.jsp\" method=\"get\">"
						+ "<input type=\"hidden\" name=\"volAller\" value=\""+rs.getString("flightID")+"\">"
						+ "<input type=\"hidden\" name=\"flightID\" value=\""+rs.getString("flightID")+"\">"
						+"<input class=\"btn btn-primary\" type=\"submit\" value=\"choisir ce vol !\">"
						+"	</form>");

			}


			//RETOUR







		}catch(Exception e2){
			out.println( "<h1>Invalid parameters </h1>"
					+ e2.getMessage() );

			e2.printStackTrace();
		}

		out.println( ""
				+ "</body>" );
	}
}
