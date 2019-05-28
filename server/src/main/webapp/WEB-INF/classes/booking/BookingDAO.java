package booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connexion.DS;
import users.Passenger;
import users.PassengerDAO;

public class BookingDAO {

	public Booking find(int bookingID) {
		try(Connection con = DS.getConnection()){

			String query = "Select * from bookings where bookingid=?";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setInt(1, bookingID);
			ResultSet rs = ps.executeQuery();
			
			//System.out.println("ps: " +ps);
			
			if(rs.next()) {
				String flightid = rs.getString("flightid");
				int category = rs.getInt("category");
				int insurance = rs.getInt("insurance");
				int mainPassengerNO = rs.getInt("mainPassengerNO");
				
				return new Booking(bookingID,flightid, category, insurance, mainPassengerNO);
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
			ps.setInt(1, booking.getBookingID());
			ps.setString(2, booking.getFlightid());
			ps.setInt(3, booking.getCategory());
			ps.setInt(4, booking.getInsurance());
			ps.setInt(5, booking.getMainPassengerNO());

			ps.executeUpdate();
			System.out.println(ps);
			return true;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return false;
	}

	public ArrayList<Booking> findAll() {
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
						rs.getInt(4),
						rs.getInt(5)
						);
				liste.add(tmp);
			}
			return liste;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

	public Booking delete(int bookingid) {
		try(Connection con = DS.getConnection()){
			Booking tmp = find(bookingid);
			String query = "delete from bookings where bookingid = ?";

			PreparedStatement ps = con.prepareStatement( query );
			ps.setInt(1, bookingid);

			System.out.println(ps);
			ps.executeUpdate();
			return tmp;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

	public boolean update(Booking TODDDOO) {
		/*
		try(Connection con = DS.getConnection()){
			
			String query = "UPDATE users SET name = ?, surname = ?, genre = ?, password = ?, role = ? WHERE bookingid=?;";
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
	
	public int maxBookingID() {
		try(Connection con = DS.getConnection()){
			String query = "Select MAX(bookingID) as maxBookingID from bookings";
			PreparedStatement ps = con.prepareStatement( query );
			ResultSet rs = ps.executeQuery();
			//System.out.println("ps: " +ps);
			if(rs.next()) {
				int maxBookingID =  rs.getInt("maxBookingID");
				return maxBookingID;
			}else {
				return 0 ;
			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
			return -1;
		}
	}
	
	
	public boolean associatePassengerToBooking(int pno, int bookingID) {
			try(Connection con = DS.getConnection()){
				String query = "Insert into passengerBelongsToBooking values(?,?)";
				PreparedStatement ps = con.prepareStatement( query );
				ps.setInt(1, pno);
				ps.setInt(2, bookingID);

				ps.executeUpdate();
				System.out.println("\nps passengers-booking:  " +ps+"\n\n");
				return true;
			}catch(Exception e1){
				System.out.println(e1.getMessage());
			}
		return false;
	}
	
	public ArrayList<Passenger> findAllPassengersOnBooking(int bookingID) {
		try(Connection con = DS.getConnection()){
			String query = "select passengerno from passengerBelongsToBooking where bookingid = ?";

			PreparedStatement ps = con.prepareStatement( query );
			ps.setInt(1, bookingID);
			ps.executeQuery();
			System.out.println("ps : " +ps);
			ResultSet rs = ps.executeQuery();

			PassengerDAO passengerDAO = new PassengerDAO();
			ArrayList<Passenger> liste =new ArrayList<>();
			
			//contenu des colonnes
			while (rs.next()){
				liste.add(passengerDAO.find(rs.getInt(1)));
			}
			return liste;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}
	
}
