package seats;

import java.io.IOException;
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

		try(Connection con = DS.getConnection()){
			
			HttpSession httpSession = req.getSession(false);
			//check if session is valid
			if(httpSession==null || !req.isRequestedSessionIdValid() ){
				System.out.println("\n\n\n session is invalid \n\n\n");
				res.sendRedirect("/error/sessionError.html");
			}

			//departure    destination    flightDate    numberofpeople

			//recuperation des parametres
			String flightType = req.getParameter("flightType");
			String seat=req.getParameter("seat");
			
			System.out.println("flightType: " + flightType +" - seat :"+seat);
			
			//TODO multiples sieges  
//			ArrayList<String> seats =(ArrayList<String>)= session.getAttribute("seats");
//			if(seats==null) {
//				seats = new ArrayList<>();
//			}
//			seats.add(seat);
//			session.setAttribute("seats", seats);
			//pour gestion de plusieurs sieges (rajouter un bouton valider et sieges: liens récursifs vers la jsp) 
			
			
			if(flightType.equals("outward")) {
				
				httpSession.setAttribute("outward-seat", seat);
				
				String returnDate = (String)httpSession.getAttribute("returnDate");
				if(returnDate==null) {
					res.sendRedirect("/booking/personnal-informations.jsp");
				}else {
					res.sendRedirect("/booking/seats.jsp?flightType=return");
				}
				
				
			}else if(flightType.equals("return")) {
				httpSession.setAttribute("return-seat", seat);
				res.sendRedirect("/booking/personnal-informations.jsp");
			}else {
				res.sendRedirect("/error/parameterError.html?error=parameter+flightType+error");
			}

		}catch(Exception e2){
			e2.printStackTrace();
			res.sendRedirect("/error/error.html");
		}

	}
}

