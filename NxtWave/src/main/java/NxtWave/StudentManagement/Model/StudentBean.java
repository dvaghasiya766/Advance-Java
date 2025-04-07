package NxtWave.StudentManagement.Model;

import java.time.LocalDate;

public class StudentBean {
	private String firstName;
    private String lastName;
    private String email;
    private String contactNo;  // Changed from int to String to match VARCHAR(15) in DB
    private String password;
    private LocalDate dob = null;     // Changed from String to LocalDate for better date handling
    private String skills = null;
    private String education = null;
    private boolean status = false; // Changed from Boolean to primitive boolean
    
    // Getter & Settes Methods
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
	public LocalDate getDob() {
		return dob;
	}
	public void setDob(LocalDate dob) {
		this.dob = dob;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
}
