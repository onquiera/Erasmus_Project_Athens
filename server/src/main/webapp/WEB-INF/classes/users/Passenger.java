package users;

import java.sql.Date;

public class Passenger {
	private int pno;
	private String firstname;
	private String surname;
	private int title;
	private Date dateOfBirth;
	private String phoneNumber;
	private String email;
	
	public Passenger(int pno, String name, String surname, int title, Date dateOfBirth, String phoneNumber,
			String email) {
		super();
		this.pno = pno;
		this.firstname = name;
		this.surname = surname;
		this.title = title;
		this.dateOfBirth = dateOfBirth;
		this.phoneNumber = phoneNumber;
		this.email = email;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getFirstName() {
		return firstname;
	}

	public void getFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public int getTitle() {
		return title;
	}

	public void setTitle(int title) {
		this.title = title;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
