package flights;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;

import connexion.DS;


public class FlightsDAO {

	public FlightWithDetails findFlight(String flightID) {
		try(Connection con = DS.getConnection()){

			String query = "Select flightID, price, a1.name as departure, a2.name as arrival,departureDate, departureTime, arrivalDate, arrivalTime, placesLeft "
					+ "FROM flights fl " + "LEFT JOIN airports a1 ON fl.departurecitycode = a1.code "
					+ "LEFT JOIN airports a2 ON fl.arrivingcitycode = a2.code " + 
					"WHERE flightID = ? ";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, flightID);
			ResultSet rs = ps.executeQuery();
			//System.out.println("ps: " +ps);

			if(rs.next()) {
				String departure=rs.getString("departure");
				String arrival=rs.getString("arrival");
				Date departureDate = rs.getDate("departureDate");
				Time departureTime = rs.getTime("departureTime");
				Date arrivalDate = rs.getDate("arrivalDate");
				Time arrivalTime = rs.getTime("arrivalTime");
				int price=rs.getInt("price");
				int placesLeft=rs.getInt("placesLeft");

				return new FlightWithDetails(flightID, departure, arrival, departureDate, departureTime, arrivalDate, arrivalTime, price, placesLeft);
			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

}
