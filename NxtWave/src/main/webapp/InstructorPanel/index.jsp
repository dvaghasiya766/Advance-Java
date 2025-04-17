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
	
	if (rs != null && rs.next()) {
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
    <!-- Dashboard Header -->
    <div class="container-fluid p-0 mb-4">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h2 class="fw-bold mb-0 darkBlueText heading-1">Welcome Back <%= FirstName %>!</h2>
                <p class="text-muted">Manage your Courses</p>
            </div>
            <div class="col-md-6 d-flex justify-content-md-end">
                <div class="input-group" style="max-width: 300px;">
                    <input type="text" class="form-control border-end-0" placeholder="Search courses...">
                    <span class="input-group-text bg-white border-start-0">
                        <i class="bi bi-search"></i>
                    </span>
                </div>
            </div>
        </div>
    </div>
	<!-- Cards -->
    <div class="row mb-4">
        <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
			<div class="CourseInfoCard border-orange">
				<p class="text-truncate">
					<img class="me-2" src="../Assets/Images/Mail.png" height="25px" alt=""> <%= Email %>
				</p>
			</div>
        </div>
        <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
            <div class="CourseInfoCard border-dark-yellow">
				<p class="text-truncate">
					<img class="me-2" src="../Assets/Images/User.png" height="25px" alt=""> <%= FullName %>
				</p>
			</div>
        </div>
        <div class="col-md-6 col-lg-3 mb-3 mb-md-0">
            <div class="CourseInfoCard border-dark-green">
				<p class="text-truncate">
					<img class="me-2" src="../Assets/Images/Desktop.png" height="25px" alt=""> <%= Role %>
				</p>
			</div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="CourseInfoCard border-green">
				<p class="text-truncate">
					<img class="me-2" src="../Assets/Images/CheetSheet.png" height="25px" alt=""> <%= formattedDate %>
				</p>
			</div>
        </div>
    </div>
    <!-- Main Content -->
    <div class="row mb-5">
        <!-- Left Column -->
        <div class="col-lg-8">
            <!-- Continue Learning Section -->
            <div class="card border-0 shadow-sm mb-4 border-radius-15">
                <div class="card-body p-0">
	                <div class="d-flex flex-row justify-content-between align-items-center ps-3 pe-3 pt-4 mb-3">
	                    <h5 class="fw-bold m-0 darkBlueText heading-3">Active Course</h5>
	                    <button class="btn p-0" onclick="redirection('MyCourse.jsp')">
	                    	View All
	                    </button>
                	</div>
                    <div class="swiper mySwiper px-4">
                        <div class="swiper-wrapper" id="CourseContainer">
							<%-- Course Card 1 --%>
							<div class="swiper-slide">
								<div class="CourseCard">
									<div class="card h-100 shadow-sm border-0 rounded-3 overflow-hidden">
										<div class="position-relative">
											<img src="../Assets/Images/courseImg1.png" alt="Python for Data Science" class="w-100 object-fit-cover" style="height: 130px;">
											<div class="position-absolute top-0 end-0 m-2 px-2 py-1 bg-dark bg-opacity-50 text-white rounded small">
												75% 	Complete
											</div>
										</div>
										<div class="card-body px-3 py-3">
											<h6 class="fw-bold mb-1">Python for Data Science</h6>
											<p class="small text-muted mb-3">
												Learn Python Programming with Dr. Sarah Johnson on NxtWave Platform
											</p>
											<div class="d-flex justify-content-between align-items-center">
												<small class="text-muted">20 lessons</small>
												<button class="btn btn-sm px-3 rounded" style="background-color: rgb(0, 123, 255); color: rgb(255, 255, 255); border: none; cursor: pointer;">View</button>
											</div>
										</div>
									</div>
								</div>
							</div>
                            <%-- <script src="../Assets/JavaScript/getEnrolledCourses.js" defer></script>  --%>
                        </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                </div>
            </div>
            <!-- Upcoming Assignments -->
            <div class="card shadow-sm border-0 border-radius-15 mb-4">
                <div class="card-body p-0">
                	<div class="d-flex flex-row justify-content-between align-items-center ps-3 pe-2 pt-4 mb-3">
	                    <h5 class="fw-bold m-0 darkBlueText heading-3">Upcoming Assignments</h5>
	                    <button class="btn p-0" onclick="redirection('Assignments.jsp')">
	                    	View All
	                    </button>
                	</div>
                    <div class="list-group list-group-flush px-3">
                        <!-- Assignment 1 -->
                        <div class="customBorderedBox border rounded p-3 mb-3">
							<div class="d-flex flex-column flex-md-row align-items-start align-items-md-center">
								<!-- Indicator -->
								<div class="CourseIndicator CourseColor1 me-3 mb-2 flex-shrink-0"></div>
								<!-- Content -->
								<div class="flex-grow-1 w-100">
									<div class="d-flex flex-wrap align-items-center">
										<span class="badge pending-bg pending-txt me-2">Pending</span>
										<small class="text-muted DateTime">Due: Today, 10:45 AM</small>
									</div>
									<p class="mb-0 text-truncate">React Component Library</p>
									<p class="mb-0 text-muted text-truncate">Advanced React Patterns - Project 2</p>
								</div>
								<!-- Button -->
								<form action="" class="mt-1 mt-md-0 ms-md-3">
									<input type="hidden" name="courseId" value="1" />
									<button type="submit" class="btn btn-warning w-100 w-md-auto">Start</button>
									<!-- <button type="submit" class="btn btn-warning w-100 w-md-auto">Start</button> -->
								</form>
							</div>
						</div>
						<div class="customBorderedBox border rounded p-3 mb-3">
							<div class="d-flex flex-column flex-md-row align-items-start align-items-md-center">
								<!-- Indicator -->
								<div class="CourseIndicator CourseColor3 me-3 mb-2 flex-shrink-0"></div>
								<!-- Content -->
								<div class="flex-grow-1 w-100">
									<div class="d-flex flex-wrap align-items-center">
										<span class="badge completed-bg completed-txt me-2">Completed</span>
										<small class="text-muted DateTime">Due: Today, 10:45 AM</small>
									</div>
									<p class="mb-0 large text-truncate">React Component Library</p>
									<p class="mb-0 text-muted text-truncate">Advanced React Patterns - Project 2</p>
								</div>
								<!-- Button -->
								<form action="" class="mt-1 mt-md-0 ms-md-3">
									<input type="hidden" name="courseId" value="1" />
									<button type="submit" class="btn btn-success w-100 w-md-auto">View</button>
									<!-- <button type="submit" class="btn btn-warning w-100 w-md-auto">Start</button> -->
								</form>
							</div>
						</div>
						<div class="customBorderedBox border rounded p-3 mb-3">
							<div class="d-flex flex-column flex-md-row align-items-start align-items-md-center">
								<!-- Indicator -->
								<div class="CourseIndicator CourseColor3 me-3 mb-2 flex-shrink-0"></div>
								<!-- Content -->
								<div class="flex-grow-1 w-100">
									<div class="d-flex flex-wrap align-items-center">
										<span class="badge completed-bg completed-txt me-2">Completed</span>
										<small class="text-muted DateTime">Due: Today, 10:45 AM</small>
									</div>
									<p class="mb-0 large text-truncate">React Component Library</p>
									<p class="mb-0 text-muted text-truncate">Advanced React Patterns - Project 2</p>
								</div>
								<!-- Button -->
								<form action="" class="mt-1 mt-md-0 ms-md-3">
									<input type="hidden" name="courseId" value="1" />
									<button type="submit" class="btn btn-success w-100 w-md-auto">View</button>
									<!-- <button type="submit" class="btn btn-warning w-100 w-md-auto">Start</button> -->
								</form>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Right Column -->
        <div class="col-lg-4">
            <!-- Recommended Courses -->
            <div class="card shadow-sm border-0 border-radius-15 mb-4">
	            <div class="card shadow-sm border-0 border-radius-15">
	                <div class="card-body p-0">
	                    <div class="d-flex flex-row justify-content-between align-items-center ps-4 pe-2 pt-4 mb-3">
	                        <h5 class="fw-bold m-0 darkBlueText heading-3">Recommended For You</h5>
	                        <button class="btn p-0" onclick="redirection('AllCourses.jsp')">
	                            <img src="../Assets/Images/Expand_right.png" height="30px">
	                        </button>
	                    </div>
	                    <div class="d-flex flex-column">
	                        <!-- Course card 1 -->
	                        <a class="customHoverBox d-flex align-items-center mb-0 ps-3 pe-1 py-2">
	                            <div class="d-flex align-items-center">
	                                <img src="../Assets/Images/courseImg2.png" class="rounded me-3" width="60" height="60"
	                                    alt="JavaScript Course" style="object-fit: cover;">
                                		<div>
	                                    <h6 class="fw-bold mb-0 text-dark">JavaScript Mastery</h6>
	                                    <small class="text-muted">Beginner to Advanced</small>
	                                    <div class="d-flex align-items-center mt-1">
	                                        <span class="badge bg-success bg-opacity-10 text-success small">Popular</span>
	                                    </div>
	                                </div>
	                            </div>
	                        </a>
	                        <!-- Course 2 -->
	                        <a class="customHoverBox d-flex align-items-center mb-0 ps-3 pe-1 py-2">
	                            <div class="d-flex align-items-center">
	                                <img src="../Assets/Images/courseImg3.png" class="rounded me-3" width="60" height="60"
	                                    alt="Database Course" style="object-fit: cover;">
	                                <div>
	                                    <h6 class="fw-bold mb-0 text-dark">Database Design</h6>
	                                    <small class="text-muted">SQL & NoSQL</small>
	                                    <div class="d-flex align-items-center mt-1">
	                                        <span class="badge bg-primary bg-opacity-10 text-primary small">New</span>
	                                    </div>
	                                </div>
	                            </div>
	                        </a>
	                        <!-- Course 3 -->
	                        <a class="customHoverBox d-flex align-items-center mb-0 ps-3 pe-1 py-2">
	                            <div class="d-flex align-items-center">
	                                <img src="../Assets/Images/courseImg4.png" class="rounded me-3" width="60" height="60"
	                                    alt="Database Course" style="object-fit: cover;">
	                                <div>
	                                    <h6 class="fw-bold mb-0 text-dark">Cloud Computing</h6>
	                                    <small class="text-muted">AWS & Azure</small>
	                                    <div class="d-flex align-items-center mt-1">
	                                        <span class="badge bg-warning bg-opacity-10 text-warning small">Trending</span>
	                                    </div>
	                                </div>
	                            </div>
	                        </a>
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
<%@ include file="Footer.jsp" %>