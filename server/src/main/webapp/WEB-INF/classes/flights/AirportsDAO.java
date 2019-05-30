package flights;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connexion.DS;

public class AirportsDAO {

	public Airport find(String code) {
		try(Connection con = DS.getConnection()){
			String query = "Select * from airports where code=?";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setString(1, code);
			ResultSet rs = ps.executeQuery();
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

	public List<Airport> findAll() {
		try(Connection con = DS.getConnection()){
			ArrayList<Airport> liste =new ArrayList<>();
			String query = "select * from airports";

			PreparedStatement ps = con.prepareStatement( query );
			ps.executeQuery();
			//System.out.println(ps);
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

}
