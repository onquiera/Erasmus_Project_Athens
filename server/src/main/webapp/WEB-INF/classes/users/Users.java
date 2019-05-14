package users;

public class Users {

	private int uno;
	private int pno;
	private String password;
	private int role;
	
	/*
	passenger(
			pno SERIAL,
			name text,
			surname text,
			title integer,
			dateOfBirth DATE,
			phoneNumber text,0
			email text);

	users(
			uno SERIAL,
			pno integer (references to passenger(pno)
			password text,
			role integer
		);
	*/
	
	public Users(int uno, int pno, String password, int role) {
		super();
		this.uno = uno;
		this.pno = pno;
		this.password = password;
		this.role = role;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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