package seats;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connexion.DS;

public class SeatsDAO {

	public int numberOfSeats(String flightID) {
		try(Connection con = DS.getConnection()){
			ArrayList<String> liste =new ArrayList<>();
			String query = 
					"Select nbPlaceEco"
							+ " FROM flights fl "
							+ " LEFT JOIN planes pl ON fl.planeID = pl.planeID "
							+ " WHERE flightID = ? ";

			PreparedStatement ps = con.prepareStatement( query );
			ps.setString(1, flightID);
			System.out.println(ps);
			ps.executeQuery();
			ResultSet rs = ps.executeQuery();

			//contenu des colonnes
			if (rs.next()){
				return rs.getInt(1);
			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return -1;
	}

	public ArrayList<String> bookedSeats(String flightID) {
		try(Connection con = DS.getConnection()){
			ArrayList<String> liste =new ArrayList<>();
			String query = "select seat_number from seat_reservation where flightID=?";

			PreparedStatement ps = con.prepareStatement( query );
			ps.setString(1, flightID);
			ps.executeQuery();
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();

			//contenu des colonnes
			while (rs.next()){
				liste.add(rs.getString(1));
			}

			return liste;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}
	
}
