package flights;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connexion.DS;

public class BookingDAO {

	//reservationnumber |  flightid  | seatnumber | clientname |         clientemail   
	public Booking find(int reservationnumber) {
		try(Connection con = DS.getConnection()){

			String query = "Select * from bookings where reservationnumber=?";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setInt(1, reservationnumber);
			ResultSet rs = ps.executeQuery();
			//System.out.println(ps);
			
			//System.out.println("ps: " +ps);
			
			if(rs.next()) {
				int emailTable = rs.getInt("reservationnumber");
				String flightid = rs.getString("flightid");
				int seatnumber = rs.getInt("seatnumber");
				String clientname = rs.getString("clientname");
				String clientemail = rs.getString("clientemail");
				
				return new Booking(emailTable,flightid, seatnumber, clientname,clientemail);
			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

	public boolean create(Booking booking) {
		try(Connection con = DS.getConnection()){

			String query = "Insert into bookings values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setInt(1, booking.getReservationnumber());
			ps.setString(2, booking.getFlightid());
			ps.setInt(3, booking.getSeatnumber());
			ps.setString(4, booking.getClientname());
			ps.setString(5, booking.getClientemail());

			ps.executeUpdate();
			System.out.println(ps);
			return true;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	return false;
	}

	public List<Booking> findAll() {
		try(Connection con = DS.getConnection()){
			ArrayList<Booking> liste =new ArrayList<>();
			String query = "select * from bookings";

			PreparedStatement ps = con.prepareStatement( query );
			ps.executeQuery();
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();

			//contenu des colonnes
			while (rs.next()){
				Booking tmp = new Booking(
						rs.getInt(1),
						rs.getString(2),
						rs.getInt(3),
						rs.getString(4),
						rs.getString(5)
						);
				liste.add(tmp);
			}
			return liste;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

	public Booking delete(int reservationnumber) {
		try(Connection con = DS.getConnection()){
			Booking tmp = find(reservationnumber);
			String query = "delete from bookings where reservationnumber = ?";

			PreparedStatement ps = con.prepareStatement( query );
			ps.setInt(1, reservationnumber);

			System.out.println(ps);
			ps.executeUpdate();
			return tmp;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

	//reservationnumber |  flightid  | seatnumber | clientname |         clientemail   
	public boolean update(Booking TODDDOO) {
		/*
		try(Connection con = DS.getConnection()){
			
			String query = "UPDATE users SET name = ?, surname = ?, genre = ?, password = ?, role = ? WHERE reservationnumber=?;";
			PreparedStatement ps = con.prepareStatement( query );

			ps.setString(1, user.getName());
			ps.setString(2, user.getSurname());
			ps.setInt(3, user.getGenre());
			ps.setString(4, user.getPassword());
			ps.setInt(5, user.getRole());
			ps.setString(6, user.getReservationnumber());
			
			System.out.println(ps);
			ps.executeUpdate();
			
			return true;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		*/
		return false;
	}
	
}
