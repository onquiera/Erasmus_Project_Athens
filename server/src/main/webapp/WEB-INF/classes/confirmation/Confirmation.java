package confirmation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
public class Confirmation extends HttpServlet
{
	public void doGet( HttpServletRequest req, HttpServletResponse res )
			throws ServletException, IOException
	{

		//req.getRequestDispatcher("/rechercheVille.jsp").forward(req, res);

		res.setContentType("text/html,charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.println( "<head><title>My Booking</title></head>" );
		out.println( "</head><body>" );

		try{

			ConfirmationDAO confirmationDAO = new ConfirmationDAO();

			HttpSession session = req.getSession(false);
			
			String flightID=(String)session.getAttribute("confirmed-flightID");
			String seat=(String)session.getAttribute("confirmed-seat");
			String customer = (String)session.getAttribute("confirmed-customer");

			//TODO remove this
			customer="test";
			
			
			//inserts + sending mail are done here because there's no payment
			//but if there were one, we should have to do it later, if the customers pays

			confirmationDAO.bookSeat(flightID, seat, customer);
			
			//TODO add other inserts

			session.invalidate();

			RequestDispatcher dispatcher = req.getRequestDispatcher("booking/payment.jsp");
			dispatcher.forward(req, res);
			

		}catch(Exception e2){
			out.println( "<h1>Invalid parameters </h1>"
					+ e2.getMessage() );

			e2.printStackTrace();
		}

		out.println( ""
				+ "</body>" );
	}
}

