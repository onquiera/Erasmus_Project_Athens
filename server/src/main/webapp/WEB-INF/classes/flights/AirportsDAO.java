package flights;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connexion.DS;

public class AirportsDAO {
/*
	name;
	code;
	statecode;
	countrycode;
	countryname;
	*/
	public Airport find(String code) {
		try(Connection con = DS.getConnection()){
			String query = "Select * from airports where code=?";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setString(1, code);
			ResultSet rs = ps.executeQuery();
			System.out.println(ps);
			
			//System.out.println("ps: " +ps);
			if(rs.next()) {
				String name = rs.getString("name");
				String statecode = rs.getString("statecode");
				String countrycode = rs.getString("countrycode");
				String countryname = rs.getString("countryname");
				return new Airport(name,code, statecode, countrycode,countryname);
			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		
		return null;
	}

	public boolean create(Airport Airport) {
		/*
		try(Connection con = DS.getConnection()){
			String query = "Insert into Airports values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setInt(1, Airport.getReservationnumber());
			ps.setString(2, Airport.getFlightid());
			ps.setInt(3, Airport.getSeatnumber());
			ps.setString(4, Airport.getClientname());
			ps.setString(5, Airport.getClientemail());

			ps.executeUpdate();
			System.out.println(ps);
			return true;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		*/
	return false;
	}

	public List<Airport> findAll() {
		try(Connection con = DS.getConnection()){
			ArrayList<Airport> liste =new ArrayList<>();
			String query = "select * from airports";

			PreparedStatement ps = con.prepareStatement( query );
			ps.executeQuery();
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();

			//contenu des colonnes
			while (rs.next()){
				Airport tmp = new Airport(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
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

	public Airport delete(int reservationnumber) {
		/*
		try(Connection con = DS.getConnection()){
			Airport tmp = find(reservationnumber);
			String query = "delete from Airports where reservationnumber = ?";

			PreparedStatement ps = con.prepareStatement( query );
			ps.setInt(1, reservationnumber);

			System.out.println(ps);
			ps.executeUpdate();
			return tmp;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		*/
		return null;
		
	}

	//reservationnumber |  flightid  | seatnumber | clientname |         clientemail   
	public boolean update(Airport TODDDOO) {
		
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
