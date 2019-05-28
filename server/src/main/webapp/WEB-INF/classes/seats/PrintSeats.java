package seats;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.jsp.JspWriter ;

public class PrintSeats {

	private final static String convert = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

	//pour rendre plus propre > comme ça parametre comme longueur rangées pris en compte ici et code synthétisé :)
	//mais on reste crade pour le moment 

	public void printSelectSeats(PrintWriter out) {


	}

	//for JSPs
	public static void printSeatsSelected(JspWriter out, String flightID, ArrayList<String> selectedSeats) {
		try {
			int rowSize = 4; //to change and add as parameter if we use different airplane types
			
			SeatsDAO seatsDAO = new SeatsDAO();
			int flightsNumberOfSeats = seatsDAO.numberOfSeats(flightID);
			ArrayList<String> alreadyBookedSeats = seatsDAO.findBookedSeatsInFlight(flightID);

			for (int i = 1; i <= flightsNumberOfSeats / rowSize; i++) {
				out.println("<br>");
				for (int j = 0; j < rowSize; j++) {
					String seat = i + "" + convert.charAt(j);
					if (alreadyBookedSeats.contains(seat)) {
						//seat already booked so blocked
						out.println("&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-danger\" disabled>" + seat
								+ "</button>");
					} else if(selectedSeats.contains(seat)){
						//seat selected by customer
						out.println("&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-primary\">" + seat
								+ "</button>");
					}else {
						out.println("&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-success\" disabled>" + seat
								+ "</button>");
					}
				}
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//for servlets
	public static void printSeatsSelected(PrintWriter out, String flightID, ArrayList<String> selectedSeats) {
			int rowSize = 4; //to change and add as parameter if we use different airplane types
			
			SeatsDAO seatsDAO = new SeatsDAO();
			int flightsNumberOfSeats = seatsDAO.numberOfSeats(flightID);
			ArrayList<String> alreadyBookedSeats = seatsDAO.findBookedSeatsInFlight(flightID);

			for (int i = 1; i <= flightsNumberOfSeats / rowSize; i++) {
				out.println("<br>");
				for (int j = 0; j < rowSize; j++) {
					String seat = i + "" + convert.charAt(j);
					if(selectedSeats.contains(seat)){
						//seat selected by customer
						out.println("&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-primary\">" + seat
								+ "</button>");
					}else if (alreadyBookedSeats.contains(seat)) {
						//seat already booked so blocked
						out.println("&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-danger\" disabled>" + seat
								+ "</button>");
					}else {
						out.println("&nbsp;&nbsp; <button type=\"button\" class=\"btn btn-success\" disabled>" + seat
								+ "</button>");
					}
				}
			}
	}

}
