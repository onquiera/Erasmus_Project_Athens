package flights;

import java.sql.Date;

public class Passenger {
	String name;
	String surname;
	int title;
	Date dateOfBirth;
	
	public Passenger(String name, String surname, int title, Date dateOfBirth) {
		super();
		this.name = name;
		this.surname = surname;
		this.title = title;
		this.dateOfBirth = dateOfBirth;
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
}
