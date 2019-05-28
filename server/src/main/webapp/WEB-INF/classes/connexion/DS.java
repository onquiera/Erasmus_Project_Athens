package connexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class DS {
	//cree la connection, permet de ne pas avoir du code dupliqué(en créant la connection)
	public static Connection getConnection() {

		Connection con=null;
		try{
			// enregistrement du driver
			//jar correspondant doit être dans lib et ajouté au buildpath
			//pour h2 : org.h2.Driver
			//pour postgresql : org.postgresql.Driver
			
			Class.forName("org.postgresql.Driver"); 
			// connexion à la base

//ancien parametres(tp s3)
/*
			String url = "jdbc:postgresql://psqlserv/fi2";
			String nom = "onquiera";
			String mdp = "aaaa";
*/

//WARNING in the url, the last part speciefies the name of the database
			String url = "jdbc:postgresql://localhost:5432/er Asmus_project";
			String nom = "postgres";
			String mdp = "aaaa";
				
			con = DriverManager.getConnection(url,nom,mdp);
			
		}catch(Exception e1){
			System.out.println("DS : connexion to database error");
			System.out.println("error =" +e1.getMessage());
		}
		return con;
	}
}
