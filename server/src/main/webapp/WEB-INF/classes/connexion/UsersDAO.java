package connexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsersDAO {

	//email            |   name   |  surname   | genre |      password       | role
	public Users find(String email) {
		try(Connection con = DS.getConnection()){

			String query = "Select * from users where email=?";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			System.out.println(ps);
			
			//System.out.println("ps: " +ps);
			
			if(rs.next()) {
				String emailTable = rs.getString("email");
				String name = rs.getString("name");
				String surname = rs.getString("surname");
				int genre = rs.getInt("genre");
				String password = rs.getString("password");
				int role = rs.getInt("role");
				
				return new Users(emailTable,name, surname, genre,password, role);
			}
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

	public boolean create(Users Users) {
		try(Connection con = DS.getConnection()){

			String query = "Insert into Users values(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement( query );
			ps.setString(1, Users.getEmail());
			ps.setString(2, Users.getName());
			ps.setString(3, Users.getSurname());
			ps.setInt(4, Users.getGenre());
			ps.setString(5, Users.getPassword());
			ps.setInt(6, Users.getRole());

			ps.executeUpdate();
			System.out.println(ps);
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
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();

			//contenu des colonnes
			while (rs.next()){
				Users tmp = new Users(
						rs.getString("email"),
						rs.getString("name"),
						rs.getString("surname"),
						rs.getInt("genre"),
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

			System.out.println(ps);
			ps.executeUpdate();
			return tmp;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return null;
	}

	public boolean update(Users user) {
		try(Connection con = DS.getConnection()){
			String query = "UPDATE users SET name = ?, surname = ?, genre = ?, password = ?, role = ? WHERE email=?;";
			PreparedStatement ps = con.prepareStatement( query );

			ps.setString(1, user.getName());
			ps.setString(2, user.getSurname());
			ps.setInt(3, user.getGenre());
			ps.setString(4, user.getPassword());
			ps.setInt(5, user.getRole());
			ps.setString(6, user.getEmail());
			
			System.out.println(ps);
			ps.executeUpdate();
			
			return true;
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
		return false;
	}
	
}
