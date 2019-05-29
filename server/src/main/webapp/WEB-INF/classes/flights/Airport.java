package flights;

public class Airport {

	private String name;
	private String code;
	private String statecode;
	private String countrycode;
	private String countryname;
	
	public Airport(String name, String code, String statecode, String countrycode, String countryname) {
		super();
		this.name = name;
		this.code = code;
		this.statecode = statecode;
		this.countrycode = countrycode;
		this.countryname = countryname;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getStatecode() {
		return statecode;
	}
	public void setStatecode(String statecode) {
		this.statecode = statecode;
	}
	public String getCountrycode() {
		return countrycode;
	}
	public void setCountrycode(String countrycode) {
		this.countrycode = countrycode;
	}
	public String getCountryname() {
		return countryname;
	}
	public void setCountryname(String countryname) {
		this.countryname = countryname;
	}
	
	
}
