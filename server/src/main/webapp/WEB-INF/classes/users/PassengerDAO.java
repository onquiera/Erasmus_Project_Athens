package users;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connexion.DS;

public class PassengerDAO {

	public Passenger find(int pno) {
		try(Connection con = DS.getConnection()){

			String query = "Select * from passengers where pno=?";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setInt(1, pno);
			ResultSet rs = ps.executeQuery();
			//System.out.println("ps: " +ps);

			if(rs.next()) {

				String name = rs.getString("name");
				String surname = rs.getString("surname");
				int title = rs.getInt("title");
				Date dateOfBirth = rs.getDate("dateOfBirth");
				String phoneNumber = rs.getString("phoneNumber");
				String contactEmail = rs.getString("contactEmail");

				return new Passenger(pno, name, surname, title, dateOfBirth, phoneNumber, contactEmail);
			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

	public boolean create(Passenger passenger) {
		try(Connection con = DS.getConnection()){
			String query = "Insert into passenger values(?,?,?,?,?,?,?)";
			PreparedStatement	ps = con.prepareStatement( query );
			ps.setInt(1, passenger.getPno());
			ps.setString(2, passenger.getName());
			ps.setString(3, passenger.getSurname());
			ps.setInt(4, passenger.getTitle());
			ps.setDate(5, passenger.getDateOfBirth());
			ps.setString(6, passenger.getPhoneNumber());
			ps.setString(7, passenger.getEmail());
			ps.executeUpdate();
			System.out.println("ps: " +ps);
			return true;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return false;
	}
/*
	public List<Passenger> findAll() {
		//TODO
		//		try(Connection con = DS.getConnection()){
		//			ArrayList<Passenger> liste =new ArrayList<>();
		//			String query = "select * from passengers";
		//
		//			PreparedStatement ps = con.prepareStatement( query );
		//			ps.executeQuery();
		//			System.out.println(ps);
		//			ResultSet rs = ps.executeQuery();
		//
		//			//contenu des colonnes
		//			while (rs.next()){
		//				Passenger tmp = new Passenger(
		//						rs.getString("contactEmail"),
		//						rs.getString("name"),
		//						rs.getString("surname"),
		//						rs.getInt("genre"),
		//						rs.getString("password"),
		//						rs.getInt("role")
		//						);
		//				liste.add(tmp);
		//			}
		//			return liste;
		//		}catch(Exception e1){
		//			System.out.println(e1.getMessage());
		//		}
		return null;
	}

	public boolean update(Passenger user) {
		//TODO
		//		try(Connection con = DS.getConnection()){
		//			String query = "UPDATE passengers SET name = ?, surname = ?, genre = ?, password = ?, role = ? WHERE contactEmail=?;";
		//			PreparedStatement ps = con.prepareStatement( query );
		//
		//			ps.setString(1, user.getName());
		//			ps.setString(2, user.getSurname());
		//			ps.setInt(3, user.getGenre());
		//			ps.setString(4, user.getPassword());
		//			ps.setInt(5, user.getRole());
		//			ps.setString(6, user.getEmail());
		//			
		//			System.out.println(ps);
		//			ps.executeUpdate();
		//			
		//			return true;
		//		}catch(Exception e1){
		//			System.out.println(e1.getMessage());
		//		}
		return false;
	}
	*/
	public int maxPNO() {
		try(Connection con = DS.getConnection()){
			String query = "Select MAX(pno) as maxpno from passenger";
			PreparedStatement ps = con.prepareStatement( query );
			ResultSet rs = ps.executeQuery();
			//System.out.println("ps: " +ps);
			if(rs.next()) {
				int pno =  rs.getInt("maxpno");
				System.out.println("pno : " +pno);
				return pno;
			}else {
				return 0 ;
			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
			return -1;
		}
	}

}
