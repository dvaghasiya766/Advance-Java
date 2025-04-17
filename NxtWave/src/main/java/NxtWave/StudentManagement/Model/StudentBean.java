package NxtWave.StudentManagement.Model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class StudentBean {
	private String avtar;
	private String firstName;
    private String lastName;
    private String email;
    private String contactNo;  // Changed from int to String to match VARCHAR(15) in DB
    private String password;
    private String Country;
	private java.sql.Date dob = null;     // Changed from String to LocalDate for better date handling
    private List<String> skills = new ArrayList<>();
    private boolean status = false; // Changed from Boolean to primitive boolean
    private Date createAt;
	public String getAvtar() {
		return avtar;
	}
	public void setAvtar(String avtar) {
		this.avtar = avtar;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public java.sql.Date getDob() {
		return dob;
	}
	public void setDob(java.sql.Date dob) {
		this.dob = dob;
	}
	public List<String> getSkills() {
	    return Collections.unmodifiableList(skills);
	}
	public void addSkills(String skill) {
	    if (skill != null && !skill.trim().isEmpty()) {
	        skills.add(skill.trim());
	    }
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
}
