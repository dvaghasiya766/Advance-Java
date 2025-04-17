<%@page import="NxtWave.StudentManagement.DAO.StudentDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="NxtWave.Common.Hashing.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	if (rs != null && rs.next()) {
		Avatar = rs.getString("avatar");
		FirstName = rs.getString("first_name");
		LastName = rs.getString("last_name");
		ContactNo = rs.getString("contact_no");
		DOB = rs.getString("dob");
		Country = rs.getString("country");
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
<%	String[] countries = {
			"Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda",
			"Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas",
			"Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin",
			"Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei",
			"Bulgaria", "Burkina Faso", "Burundi", "Cabo Verde", "Cambodia", "Cameroon",
			"Canada", "Central African Republic", "Chad", "Chile", "China", "Colombia",
			"Comoros", "Congo (Congo-Brazzaville)", "Costa Rica", "Croatia", "Cuba", "Cyprus",
			"Czechia (Czech Republic)", "Democratic Republic of the Congo", "Denmark",
			"Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador",
			"Equatorial Guinea", "Eritrea", "Estonia", "Eswatini (fmr. 'Swaziland')",
			"Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany",
			"Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana",
			"Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq",
			"Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya",
			"Kiribati", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho",
			"Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar",
			"Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands",
			"Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco",
			"Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar (formerly Burma)",
			"Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger",
			"Nigeria", "North Korea", "North Macedonia", "Norway", "Oman", "Pakistan", "Palau",
			"Palestine State", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines",
			"Poland", "Portugal", "Qatar", "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis",
			"Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino",
			"Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles",
			"Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands",
			"Somalia", "South Africa", "South Korea", "South Sudan", "Spain", "Sri Lanka",
			"Sudan", "Suriname", "Sweden", "Switzerland", "Syria", "Tajikistan", "Tanzania",
			"Thailand", "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia",
			"Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates",
			"United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu",
			"Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe"
		}; %>
<!-- Hero Section -->
<div class="remaining-width">
    <!-- Profile Header Section -->
    <div class="container-fluid p-0 mb-4">
        <div class="row align-items-center">
            <div class="col-10">
                <h2 class="fw-bold m-0 darkBlueText heading-1">My Profile</h2>
            </div>
            <div class="col-2 d-flex justify-content-end">
                <button class="btn btn-danger d-flex" onclick="LogOut()">
                    <p class="me-2 mb-0">LogOut</p>
                    <img src="../Assets/Images/Sign_out_squre@3x.png" height="20px" alt="">
                </button>
            </div>
        </div>
    </div>
    <!-- Profile Content -->
    <div class="container-fluid mb-3">
        <div class="row mb-5">
            <!-- Left Column - Profile Info -->
            <div class="col-lg-4 col-md-5 p-0 p-md-2 mb-3">
                <div class="card shadow-sm border-0 border-radius-15">
                    <div class="card-body text-center p-4">
                        <!-- Profile Picture -->
                        <div class="position-relative d-inline-block mb-3">
                            <img src="../<%= rs.getString("avatar") %>" class="rounded-circle" width="150" height="150" alt="Profile" id="profileImage">
                            <button class="btn btn-sm ClickBG position-absolute bottom-0 end-0 rounded-circle" style="width: 40px; height: 40px;" type="button" data-toggle="modal" data-target="#form1">
                            		<i class="bi bi-camera-fill" style="color: #1B5A7A; font-size: 20px;"></i>
                            </button>
                        </div>

                        <!-- User Info -->
                        <h4 class="fw-bold mb-1" id="userName"><%= FullName %></h4>
                        <p class="text-muted mb-3" id="userEmail"><%= Email %></p>

                        <!-- Progress Bar -->
                        <div class="mb-3">
                            <div class="d-flex justify-content-between mb-1">
                                <span class="small">Course Progress</span>
                                <span class="" id="progressPercent">65%</span>
                            </div>
                            <div class="progress" style="height: 8px;">
                                <div class="progress-bar PrgressbarBG" role="progressbar" style="width: 65%;"
                                    aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>

                        <!-- Stats -->
                        <div class="d-flex justify-content-around text-center mb-3">
                            <div>
                                <h5 class="fw-bold mb-0" id="coursesCount">12</h5>
                                <small class="text-muted">Courses</small>
                            </div>
                            <div>
                                <h5 class="fw-bold mb-0" id="completedCount">8</h5>
                                <small class="text-muted">Completed</small>
                            </div>
                            <div>
                                <h5 class="fw-bold mb-0" id="certificatesCount">5</h5>
                                <small class="text-muted">Certificates</small>
                            </div>
                        </div>

                        <!-- Edit Button -->
                        <!-- Then use the class instead of inline style -->
                        <button class="btn btn-custom-primary w-100 rounded-pill" type="button" data-toggle="modal" data-target="#form2">
                            <i class="bi bi-pencil-square me-2"></i>Edit Profile
                        </button>
                    </div>
                </div>

                <!-- Quick Links -->
                <div class="card shadow-sm border-0 mt-4 border-radius-15">
                    <div class="card-body p-3">
                        <h6 class="fw-bold mb-3 darkBlueText heading-3">Quick Links</h6>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item border-0 px-0 py-2 d-flex align-items-center">
                                <i class="bi bi-gear-fill me-3 darkBlueText"></i>
                                <span>Account Settings</span>
                            </li>
                            <li class="list-group-item border-0 px-0 py-2 d-flex align-items-center">
                                <i class="bi bi-shield-lock-fill me-3 darkBlueText"></i>
                                <span>Privacy & Security</span>
                            </li>
                            <li class="list-group-item border-0 px-0 py-2 d-flex align-items-center">
                                <i class="bi bi-bell-fill me-3 darkBlueText"></i>
                                <span>Notification Settings</span>
                            </li>
                            <li class="list-group-item border-0 px-0 py-2 d-flex align-items-center">
                                <i class="bi bi-question-circle-fill me-3 darkBlueText"></i>
                                <span>Help Center</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Right Column - Detailed Info -->
            <div class="col-lg-8 col-md-7 p-0 p-md-2">
                <!-- Personal Information Card -->
                <div class="card shadow-sm border-0 mb-4 border-radius-15">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="fw-bold mb-0 darkBlueText heading-3">Personal Information</h5>
                            <!-- <button class="btn btn-sm btn-outline-primary" onclick="editPersonalInfo()">
                                        <i class="bi bi-pencil-square me-1"></i>Edit
                                    </button> -->
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label text-muted small mb-1">Full Name</label>
                                <p class="mb-0 fw-medium" id="fullName"><%= FullName %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <% if (DOB != null && !DOB.isEmpty()) { %>
	                                <label class="form-label text-muted small mb-1">Date of Birth</label>
                                    <p class="mb-0 fw-medium" id="dob"><%= DOB %></p>
                                <% } else { %>
                                    <label class="form-label text-danger small mb-1">Date of Birth !</label>
                                		<p class="mb-0 text-danger fw-medium" id="dob">Required*</p>
                                <% } %>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label text-muted small mb-1">Email</label>
                                <p class="mb-0 fw-medium" id="email"><%= Email %></p>
                            </div>
                            <div class="col-md-6 mb-3">
                            		<% if (ContactNo != null && !ContactNo.isEmpty()) { %>
	                                <label class="form-label text-muted small mb-1">Phone</label>
	                                <p class="mb-0 fw-medium" id="phone"><%= ContactNo %></p>
                                <% } else { %>
                                    <label class="form-label text-danger small mb-1">Phone !</label>
                                		<p class="mb-0 text-danger fw-medium" id="dob">Required*</p>
                                <% } %>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label text-muted small mb-1">Country</label>
                                <p class="mb-0 fw-medium" id="country">India</p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label text-muted small mb-1">Join Date</label>
                                <p class="mb-0 fw-medium" id="joinDate"><%= formattedDate %></p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Education & Skills Card -->
                <div class="card shadow-sm border-0 mb-4 border-radius-15">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="fw-bold mb-0 darkBlueText heading-3">Education & Skills</h5>
                            <button class="btn btn-sm btn-custom-primary" onclick="editEducation()">
                            		<i class="bi bi-pencil-square me-1"></i>Edit
                            </button>
                        </div>

                        <div class="mb-4">
                            <label class="form-label text-muted small mb-1">Education</label>
                            <p class="mb-0 fw-medium" id="education">Master's in Computer Science, Stanford
                                University
                            </p>
                        </div>

                        <div>
                            <label class="form-label text-muted small mb-1">Skills</label>
                            <div class="d-flex flex-wrap gap-2" id="skillsContainer">
                                <span
                                    class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">JavaScript</span>
                                <span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">React</span>
                                <span
                                    class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Node.js</span>
                                <span
                                    class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Python</span>
                                <span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Data
                                    Science</span>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Recent Activity Card -->
		        <div class="card shadow-sm border-0 border-radius-15">
		            <div class="card-body p-0">
		                <h5 class="fw-bold m-0 darkBlueText heading-3 ps-4 pt-4">Recent Activity</h5>
		                <div class="d-flex flex-column">
		                    <div class="customHoverBox d-flex align-items-center mb-0 ps-3 pe-1 py-2">
		                        <div class="CourseIndicator CourseColor1 flex-shrink-0"></div>
		                        <div class="ms-3 overflow-hidden me-auto">
		                            <small class="text-muted DateTime d-block">
		                                Today, 10:45 AM
		                            </small>
		                            <p class="mb-0 fw-medium text-truncate">
		                                Completed "Advanced React Patterns" course
		                            </p>
		                        </div>
		                        <form action="">
		                            <div class="d-none">
		                                <input type="text" name="courseId" value="1">
		                            </div>
		                            <button type="submit" class="btn p-0 m-0">
		                                <img src="../Assets/Images/Expand_right.png" height="35px" alt="Like">
		                            </button>
		                        </form>
		                    </div>
		                    <div class="customHoverBox d-flex align-items-center mb-0 ps-3 pe-1 py-2">
		                        <div class="CourseIndicator CourseColor2 flex-shrink-0"></div>
		                        <div class="ms-3 overflow-hidden me-auto">
		                            <small class="text-muted DateTime d-block">
		                                Yesterday, 3:30 PM
		                            </small>
		                            <p class="mb-0 fw-medium text-truncate">
		                                Submitted assignment for "Node.js Fundamentals"
		                            </p>
		                        </div>
		                        <form action="">
		                            <div class="d-none">
		                                <input type="text" name="courseId" value="1">
		                            </div>
		                            <button type="submit" class="btn p-0 m-0">
		                                <img src="../Assets/Images/Expand_right.png" height="35px" alt="Like">
		                            </button>
		                        </form>
		                    </div>
		                    <div class="customHoverBox d-flex align-items-center mb-0 ps-3 pe-1 py-2">
		                        <div class="CourseIndicator CourseColor3 flex-shrink-0"></div>
		                        <div class="ms-3 overflow-hidden me-auto">
		                            <small class="text-muted DateTime d-block">
		                                2 days ago
		                            </small>
		                            <p class="mb-0 fw-medium text-truncate">
		                                Started new course "Python for Data Science"
		                            </p>
		                        </div>
		                        <form action="">
		                            <div class="d-none">
		                                <input type="text" name="courseId" value="1">
		                            </div>
		                            <button type="submit" class="btn p-0 m-0">
		                                <img src="../Assets/Images/Expand_right.png" height="35px" alt="Like">
		                            </button>
		                        </form>
		                    </div>
		                    <div class="customHoverBox d-flex align-items-center mb-0 ps-3 pe-1 py-2">
		                        <div class="CourseIndicator CourseColor4 flex-shrink-0"></div>
		                        <div class="ms-3 overflow-hidden me-auto">
		                            <small class="text-muted DateTime d-block">
		                                5 days ago
		                            </small>
		                            <p class="mb-0 fw-medium text-truncate">
		                                Earned certificate in "JavaScript Mastery"
		                            </p>
		                        </div>
		                        <form action="">
		                            <div class="d-none">
		                                <input type="text" name="courseId" value="1">
		                            </div>
		                            <button type="submit" class="btn p-0 m-0">
		                                <img src="../Assets/Images/Expand_right.png" height="35px" alt="Like">
		                            </button>
		                        </form>
		                    </div>
		                    <div class="customHoverBox d-flex align-items-center mb-0 ps-3 pe-1 py-2">
		                        <div class="CourseIndicator CourseColor1 flex-shrink-0"></div>
		                        <div class="ms-3 overflow-hidden me-auto">
		                            <small class="text-muted DateTime d-block">Today, 10:45 AM</small>
		                            <p class="mb-0 fw-medium text-truncate">Completed "Advanced React Patterns" Assignment</p>
		                        </div>
		                        <form action="">
		                            <div class="d-none">
		                                <input type="text" name="courseId" value="1">
		                            </div>
		                            <button type="submit" class="btn p-0 m-0">
		                                <img src="../Assets/Images/Expand_right.png" height="35px" alt="Like">
		                            </button>
		                        </form>
		                    </div>
		                </div>
		                <button class="ActivityBtn p-4" onclick="redirection('Activity.jsp')">
		                    View All Activity
		                    <i class="bi bi-arrow-right ms-2"></i>
		                </button>
		            </div>
		        </div>
            </div>
        </div>
    </div>
</div>
<!-- Modals -->
<div class="modal fade" id="form1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="UpdateProfilePic" method="post" enctype="multipart/form-data">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Update Profile Picture</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="formFile" class="form-label">Profile Picture</label>
						<input class="form-control" type="file" id="profileImage" name="profileImage" accept="image/*" required>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" id="saveProfile" class="btn btn-custom-primary">Save changes</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="modal fade" id="form2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="UpdateUserInfo" method="post">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Update Profile</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label for="email" class="form-label">Email</label>
						<input type="email" class="form-control disabled" id="email" name="email" value="<%= Email %>" required>
					</div>
					<div class="mb-3">
						<label for="firstname" class="form-label">First Name</label>
						<input type="text" class="form-control" id="firstname" name="firstname" value="<%= FirstName %>" required>
					</div>
					<div class="mb-3">
						<label for="lastname" class="form-label">Last Name</label>
						<input type="text" class="form-control" id="lastname" name="lastname" value="<%= LastName %>" required>
					</div>
					<div class="mb-3">
						<label for="contactNo" class="form-label">Contact No</label>
						<input type="tel" class="form-control" id="contactNo" name="contactNo" value="<%= ContactNo %>" required>
					</div>
					<div class="mb-3">
						<label for="Country" class="form-label">Country</label>
						<select id="Country" name="Country" class="form-select" aria-label="Default select example">
							<% 
							for(String country : countries) {
						        String selected = country.equals(Country) ? "selected" : "";
								%>
								<option value="<%= country %>" <%= selected %>><%= country %></option>
								<%
							}
							%>
						</select>
					</div>
					<div class="mb-3">
						<label for="dob" class="form-label">Date of Birth</label>
						<input type="Date" class="form-control" id="dob" name="dob" value="<%= DOB %>" required>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" id="saveProfile" class="btn btn-custom-primary">Save changes</button>
				</div>
			</form>
		</div>
	</div>
</div>
<% session.setAttribute("lastPage", request.getHeader("referer")); %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="Footer.jsp" %>