package NxtWave.CourseManagement.Model;

public class CourseBean {
	private Integer ID;
	private String BG;
	private String AV;
	private String CourseName;
	private Integer CourseInstructor;
	private String CourseCode;
	private String CourseColor;
	private String CourseOutlet;
	private String CourseDesc;
	private Boolean Status;
	private Integer EnrolledCourse;
	
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getBG() {
		return BG;
	}
	public void setBG(String bG) {
		BG = bG;
	}
	public String getAV() {
		return AV;
	}
	public void setAV(String aV) {
		AV = aV;
	}
	public String getCourseName() {
		return CourseName;
	}
	public void setCourseName(String courseName) {
		CourseName = courseName;
	}
	public Integer getCourseInstructor() {
		return CourseInstructor;
	}
	public void setCourseInstructor(Integer courseInstructor) {
		CourseInstructor = courseInstructor;
	}
	public String getCourseCode() {
		return CourseCode;
	}
	public void setCourseCode(String courseCode) {
		CourseCode = courseCode;
	}
	public String getCourseColor() {
		return CourseColor;
	}
	public void setCourseColor(String courseColor) {
		CourseColor = courseColor;
	}
	public String getCourseOutlet() {
		return CourseOutlet;
	}
	public void setCourseOutlet(String courseOutlet) {
		CourseOutlet = courseOutlet;
	}
	public String getCourseDesc() {
		return CourseDesc;
	}
	public void setCourseDesc(String courseDesc) {
		CourseDesc = courseDesc;
	}
	public Boolean getStatus() {
		return Status;
	}
	public void setStatus(Boolean status) {
		Status = status;
	}
	public Integer getEnrolledCourse() {
		return EnrolledCourse;
	}
	public void setEnrolledCourse(Integer enrolledCourse) {
		EnrolledCourse = enrolledCourse;
	}
}
