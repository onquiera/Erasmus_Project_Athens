package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connexion.DS;

public class UsersDAO {

	public Users find(String email) {
		try(Connection con = DS.getConnection()){

			String query = "Select * from users us inner join passenger pa on us.pno = ps.pno where email=?";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			//System.out.println("ps: " +ps);
			
			if(rs.next()) {
				int uno = rs.getInt("uno");
				int pno = rs.getInt("pno");
				String password = rs.getString("password");
				int role = rs.getInt("role");
				
				return new Users(uno, pno, password, role);
			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}
	
	public Users find(int uno) {
		try(Connection con = DS.getConnection()){

			String query = "Select * from users where uno=?";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setInt(1, uno);
			ResultSet rs = ps.executeQuery();
			
			//System.out.println("ps: " +ps);
			
			if(rs.next()) {
				int pno = rs.getInt("pno");
				String password = rs.getString("password");
				int role = rs.getInt("role");
				
				return new Users(uno, pno, password, role);
			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

	/**
	 * insert users in the sql table users
	 * @param users - serial so if -1 > will be initialized automaticaly when insert in table
	 * @return true if insert has been done correctly, false if not
	 */
	public boolean create(Users users) {
		try(Connection con = DS.getConnection()){

			String query;
			PreparedStatement ps=null;
			if(users.getUno()<0) {
				query = "Insert into Users(pno, password, role) values(?,?,?)";
				ps = con.prepareStatement( query );
				ps.setInt(1, users.getPno());
				ps.setString(2, users.getPassword());
				ps.setInt(3, users.getRole());
			}else {
				query = "Insert into Users values(?,?,?,?)";
				ps = con.prepareStatement( query );
				ps.setInt(1, users.getUno());
				ps.setInt(2, users.getPno());
				ps.setString(3, users.getPassword());
				ps.setInt(4, users.getRole());
			}
			ps.executeUpdate();
			//System.out.println(ps);
			return true;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	return false;
	}

	public List<Users> findAll() {
		try(Connection con = DS.getConnection()){
			ArrayList<Users> liste =new ArrayList<>();
			String query = "select * from users";

			PreparedStatement ps = con.prepareStatement( query );
			ps.executeQuery();
			//System.out.println(ps);
			ResultSet rs = ps.executeQuery();

			//contenu des colonnes
			while (rs.next()){
				Users tmp = new Users(
						rs.getInt("uno"),
						rs.getInt("pno"),
						rs.getString("password"),
						rs.getInt("role")
						);
				liste.add(tmp);
			}
			return liste;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

	public Users delete(String email) {
		try(Connection con = DS.getConnection()){
			Users tmp = find(email);
			String query = "delete from users where email = ?";

			PreparedStatement ps = con.prepareStatement( query );
			ps.setString(1, email);

			//System.out.println(ps);
			ps.executeUpdate();
			return tmp;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

	public boolean update(Users user) {
		try(Connection con = DS.getConnection()){
			String query = "UPDATE users SET pno = ?, password = ?, role = ? WHERE uno=?;";
			PreparedStatement ps = con.prepareStatement( query );

			ps.setInt(1, user.getPno());
			ps.setString(2, user.getPassword());
			ps.setInt(3, user.getRole());
			ps.setInt(6, user.getUno());
			
			//System.out.println(ps);
			ps.executeUpdate();
			
			return true;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return false;
	}
	
}
