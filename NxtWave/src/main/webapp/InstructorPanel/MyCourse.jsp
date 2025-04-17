<%@page import="NxtWave.CourseManagement.DAO.CourseDAO"%>
<%@page import="NxtWave.StudentManagement.DAO.StudentDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="NxtWave.Common.Hashing.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="Layout.jsp" %>
<%
	String Email = SessionCookie.getEmailIdFromSession(request);
	ResultSet rs = StudentDAO.getStudentDetails(Email);
	String Avatar = "";
	String FirstName = "";
	String LastName = "";
	String ContactNo = "";
	String DOB = "";
	String Country = "";
	String CreateAt = "";
	String LastLogIn = "";
	String FullName = "";
	String Role = "";
	int ID = 0;
	
	if (rs != null && rs.next()) {
		ID = rs.getInt("id");
		Avatar = rs.getString("avatar");
		FirstName = rs.getString("first_name");
		LastName = rs.getString("last_name");
		ContactNo = rs.getString("contact_no");
		DOB = rs.getString("dob");
		Country = rs.getString("country");
		Role = rs.getString("role");
		CreateAt = rs.getString("created_at");
		LastLogIn = rs.getString("last_login");
		
		FullName = FirstName + " " + LastName; // use column names for clarity
	}
%>
<%
    String formattedDate = "N/A";
    if (CreateAt != null) {
        try {
            java.sql.Timestamp ts = java.sql.Timestamp.valueOf(CreateAt);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            formattedDate = sdf.format(ts);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<div class="remaining-width pb-5">
	<div class="container-fluid p-0 mb-4">
		<div class="d-flex flex-row justify-content-end">
			<button class="btn btn-custom-primary rounded" type="button" data-toggle="modal" data-target="#form1">
				<i class="bi bi-pencil-square me-2"></i>Edit Profile
			</button>
		</div>
		<div class="d-flex flex-wrap" id="CourseContainer">
			
			<div class="CourseCard">
				<div class="card h-100 shadow-sm border-0 rounded-3 overflow-hidden">
					<div class="position-relative"><img src="../Assets/Images/CH.png" alt="Mastering JavaScript"
							class="w-100 object-fit-cover" style="height: 130px;">
						<div
							class="position-absolute top-0 end-0 m-2 px-2 py-1 bg-dark bg-opacity-50 text-white rounded small">
							70% Complete</div>
					</div>
					<div class="card-body px-3 py-3">
						<h6 class="fw-bold mb-1">Mastering JavaScript</h6>
						<p class="small text-muted mb-3">Learn with on NxtWave Platform</p>
						<div class="progress rounded-pill mb-2" style="height: 8px;">
							<div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0"
								aria-valuenow="70" aria-valuemax="100"
								style="background-color: rgb(245, 71, 34); width: 70%;"></div>
						</div>
						<div class="d-flex justify-content-between align-items-center">
							<small class="text-muted">7/10 lessons</small>
							<button class="btn btn-sm px-3 rounded"
								style="background-color: rgb(245, 71, 34); color: rgb(255, 255, 255); border: none; cursor: pointer;">Continue</button>
						</div>
					</div>
				</div>
			</div>
			<!--  -->
		</div>
	</div>
</div>

<!-- Modals -->
<div class="modal fade" id="form1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="CreateNewCourse" method="post" enctype="multipart/form-data">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Update Profile Picture</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="BGImage" class="form-label">Background Image</label>
						<input class="form-control" type="file" id="BGImage" name="BGImage" accept="image/*" required>
					</div>
					<div class="mb-3">
						<label for="AVImage" class="form-label">Set Avatar</label>
						<input class="form-control" type="file" id="AVImage" name="AVImage" accept="image/*" required>
					</div>
					<div class="mb-3">
						<label for="coursename" class="form-label">Course Name</label>
						<input type="text" class="form-control" id="coursename" name="coursename" required>
					</div>
					<div class="mb-3">
						<label for="courseotlt" class="form-label">Course Outlet</label>
						<input type="text" class="form-control" id="courseotlt" name="courseotlt" required>
					</div>
					<div class="mb-3">
						<input type="hidden" class="form-control" id="CourseInstructor" value="<%= ID %>" name="CourseInstructor" required>
					</div>
					<div class="mb-3">
						<label for="coursecolor" class="form-label">Course Color</label>
						<input type="color" class="form-control" id="coursecolor" name="coursecolor" required>
					</div>
					<div class="mb-3">
						<label for="coursecode" class="form-label">Course Code</label>
						<input type="text" class="form-control" id="coursecode" name="coursecode" required>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" id="saveProfile" class="btn btn-custom-primary">Create Course</button>
				</div>
			</form>
		</div>
	</div>
</div>
<style>
	input[type="color"] {
        height: 40px;
        max-width: 80px;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="Footer.jsp" %>