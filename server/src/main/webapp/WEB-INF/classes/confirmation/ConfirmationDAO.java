package confirmation;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;

import connexion.DS;

@SuppressWarnings("serial")
public class ConfirmationDAO extends HttpServlet
{
	//TODO differents inserts dans les tables

	public boolean bookSeat(String flightID, String seat, String customer) {
		try(Connection con = DS.getConnection()){

			String query = "Insert into seat_reservation values(?,?,?)";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setString(1, flightID);
			ps.setString(2, seat);
			ps.setString(3, customer);
			System.out.println(ps);
			ps.executeUpdate();
			return true;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return false;
	}

	public boolean addBooking(String xxxxx) {
		try(Connection con = DS.getConnection()){

			String query = "Insert into bookings values(?,?,?)";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setString(1, xxxxx);
			System.out.println(ps);
			ps.executeUpdate();
			return true;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return false;
	}
}

