package connexion;

public class Users {
	
	private String email;
	private String name;
	private String surname;
	private int genre;
	private String password;
	private int role;
	
	//email            |   name   |  surname   | genre |      password       | role
	public Users(String email, String name, String surname, int genre, String password, int role) {
		this.email=email;
		this.name=name;
		this.surname=surname;
		this.genre=genre;
		this.password=password;
		this.role=role;
		
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public int getGenre() {
		return genre;
	}

	public void setGenre(int genre) {
		this.genre = genre;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
}