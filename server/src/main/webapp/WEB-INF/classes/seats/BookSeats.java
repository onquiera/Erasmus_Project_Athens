package seats;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connexion.DS;

@SuppressWarnings("serial")
public class BookSeats extends HttpServlet
{
	public void doGet( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{

		//req.getRequestDispatcher("/rechercheVille.jsp").forward(req, res);


		res.setContentType("text/html,charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println( "<head><title>My Booking</title></head>" );
		out.println( "</head><body>" );

		//TODO ajouter détails > exemple pas flight id mais détails du vol

		try(Connection con = DS.getConnection()){


			//departure    destination    flightDate    numberofpeople

			//recuperation des parametres
			String flightID=req.getParameter("flightID");
			String seat=req.getParameter("seat");
			//TODO > soit siege en parametre soit en session si plusieurs 
			
			
			System.out.println("flightID :"+flightID);
			System.out.println("seat :"+seat);
			
			
			//> mise en session commande et passage etape suivante

			HttpSession session = req.getSession();
			session.setAttribute("confirmed-flightID", flightID);
			session.setAttribute("confirmed-seat", seat);
			
			//or 
//			ArrayList<String> seats =(ArrayList<String>)= session.getAttribute("seats");
//			if(seats==null) {
//				seats = new ArrayList<>();
//			}
//			seats.add(seat);
//			session.setAttribute("seats", seats);

			res.sendRedirect("booking/passengers.jsp");

		}catch(Exception e2){
			out.println( "<h1>Invalid parameters </h1>"
					+ e2.getMessage() );

			e2.printStackTrace();
		}

		out.println( ""
				+ "</body>" );
	}
}

