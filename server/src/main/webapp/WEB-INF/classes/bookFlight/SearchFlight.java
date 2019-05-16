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

@SuppressWarnings("serial")
public class SearchFlight extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		// req.getRequestDispatcher("/rechercheVille.jsp").forward(req, res);

		res.setContentType("text/html,charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println(""
				+"<link rel=\"shortcut icon\" type=\"image/png\" href=\"/resources/firstlogo.png\" />"
				+"<title>Flights</title>"
				+"<meta charset=\"utf-8\">"
				+"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"


		+"<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\">"
		+"<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js\"></script>"
		+"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\"></script>"
		+"<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\"></script>"

		+"<link href=\"https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">"
		+"<script src=\"https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js\"></script>"


		+"<script src=\"/js/main.js\" defer></script>"

		+"<link rel=\"stylesheet\" href=\"/css/basics.css\" />"
				);

		out.println("</head><body><nav id=\"progBar\"></nav>");

		String flightType = req.getParameter("flightType");

		// traduction : vol aller = outward flight

		if (!(flightType.equals("outward") || flightType.equals("return"))) {
			// error

			res.sendRedirect("/error/parameterError.html");
			//TODO gerer lien retour depuis la page parameterError ?
			
		} else {

			// TODO ajouter détails > exemple pas flight id mais détails du vol

			try (Connection con = DS.getConnection()) {

				// PARAMETERS management
				String departure = req.getParameter("departure");
				String destination = req.getParameter("destination");
				String departureDate = req.getParameter("departureDate");
				String returnDate = req.getParameter("returnDate");
				int numberOfPassengers = Integer.parseInt(req.getParameter("numberOfPassengers"));
				String travelClass = req.getParameter("travelClass");

				// TODO check on other pages if session still valid

				HttpSession httpSession = req.getSession(false);

				// session reset if user starts or restarts a research
				if (httpSession != null) {
					httpSession.invalidate();
				}
				httpSession = req.getSession(true);
				httpSession.setMaxInactiveInterval(20 * 60); // session de 20 minutes d'inactivité

				// out.println("inactive session time : "+
				// httpSession.getMaxInactiveInterval());
				// TODO faire compteur et afficher ça à l'utilisateur pour plus tard :) > un
				// détail

				httpSession.setAttribute("departure", departure);
				httpSession.setAttribute("destination", destination);
				httpSession.setAttribute("departureDate", departureDate);
				httpSession.setAttribute("returnDate", returnDate);
				httpSession.setAttribute("numberOfPassengers", numberOfPassengers);
				httpSession.setAttribute("travelClass", travelClass);

				
				
				//requete de recherche
				
				PreparedStatement ps=null;
				java.sql.Date flightDate=null;
				if(flightType.equals("outward")) {

					// departure date from string to sql
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date departureDateUtil = dateFormat.parse(departureDate);
					flightDate = new java.sql.Date(departureDateUtil.getTime());

					// -----------------------------------------------------------------------------------
					// research in database

					String query = "Select flightID, a1.name as departure, a2.name as arrival,departureDate, departureTime, arrivalDate, arrivalTime, placesLeft "
							+ "FROM flights fl " + "LEFT JOIN airports a1 ON fl.departurecitycode = a1.code "
							+ "LEFT JOIN airports a2 ON fl.arrivingcitycode = a2.code " + "WHERE a1.name = ? "
							+ "and a2.name = ? " + "and fl.departuredate=?";
					ps = con.prepareStatement(query);
					ps.setString(1, departure);
					ps.setString(2, destination);
					ps.setDate(3, flightDate);

				}else {
					// return date from string to sql
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date returnDateUtil = dateFormat.parse(returnDate);
					flightDate = new java.sql.Date(returnDateUtil.getTime());

					// -----------------------------------------------------------------------------------
					// research in database

					String query = "Select flightID, a1.name as departure, a2.name as arrival,departureDate, departureTime, arrivalDate, arrivalTime, placesLeft "
							+ "FROM flights fl " + "LEFT JOIN airports a1 ON fl.departurecitycode = a1.code "
							+ "LEFT JOIN airports a2 ON fl.arrivingcitycode = a2.code " + "WHERE a1.name = ? "
							+ "and a2.name = ? " + "and fl.departuredate=?";
					ps = con.prepareStatement(query);
					ps.setString(1, destination);
					ps.setString(2, departure);
					ps.setDate(3, flightDate);
				}

				ResultSet rs = ps.executeQuery();

				// out.println("|||| ps :"+ ps+" ||||");

				ResultSetMetaData rsmd = rs.getMetaData();

				out.println("<h1>Available <u>" + flightType + "</u> flights </h1>");
				out.println("<h2>from :" + departure + " to " + destination + "</h2>");
				out.println("<h2>on date : " + flightDate + "</h2>");

				
				//TODO ici rendre ça beau
				
				while (rs.next()) {

					// titre des colonnes
					out.println("<h3>");
					for (int i = 1; i <= rsmd.getColumnCount(); i++) {

						out.println(rsmd.getColumnLabel(i) + ": " + rs.getString(i) + "  ");

					}
					out.println("</h3>");

					//bouton de validation
					//gestion si vol retour ou non
					out.println(""
							// + "<form action=\"/booking/seats.jsp\" method=\"get\">"
							+ "<form action=\"/booking/personnal-informations.jsp\" method=\"get\">");
							
					//reste des options du bouton
					out.println(""
							+ "<input type=\"hidden\" name=\"flightType\" value=\"" + flightType + "\">"
							+ "<input type=\"hidden\" name=\"flightID\" value=\"" + rs.getString("flightID") + "\">"
							+ "<input id=\"next\" class=\"btn btn-primary\" type=\"submit\" value=\"Choose this flight \">"
							+ "	</form>");
				}

				// RETOUR

			}catch(java.lang.NumberFormatException e ){
				e.printStackTrace();
				res.sendRedirect("/error/parameterError.html");
			}catch(NullPointerException e ){
				e.printStackTrace();
				res.sendRedirect("/error/parameterError.html");
			}catch(Exception e2 ){
				e2.printStackTrace();
				res.sendRedirect("/error/error.html");
			}
		}
		out.println("<div id=\"footer\"></div></body>");
	}
}
