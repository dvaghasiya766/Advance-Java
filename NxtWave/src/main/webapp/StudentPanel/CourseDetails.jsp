<%@page import="NxtWave.CourseManagement.DAO.CourseDAO"%>
<%@ include file="NewLayout.jsp" %>
<%
// Initialize variables
String courseIDStr = request.getParameter("courseID");
Integer UserID = SessionCookie.getIdFromSession(request);
int courseID = 0;
ResultSet CourseDetails = null;
String CourseColor = "#00306e"; // Default color
String CourseBG = "";
String CourseAV = "";
String CourseName = "";
String CourseOtlt = "";
String CourseCode = "";
String CourseDesc = null;
Boolean CourseStatus = false;
String CourseStudents = "";

try {
    // Validate courseID parameter
    if (courseIDStr == null || courseIDStr.isEmpty()) {
        SessionCookie.setNotificationCookie(response, "Invalid URL", false);
        response.sendRedirect("MyCourse.jsp");
        return; // Important to stop further execution
    }

    // Convert courseID to int
    try {
        courseID = Integer.parseInt(courseIDStr);
    } catch (NumberFormatException e) {
        SessionCookie.setNotificationCookie(response, "Invalid Course ID format", false);
        response.sendRedirect("MyCourse.jsp");
        return;
    }

    CourseDetails = CourseDAO.getActiveCourseDetails();
    
    // Verify course exists and user has access
    if (CourseDetails == null || !CourseDetails.next()) {
        SessionCookie.setNotificationCookie(response, "Course not found or access denied", false);
        response.sendRedirect("MyCourse.jsp");
        return;
    }

    // Get course color
    CourseBG = CourseDetails.getString("background_image");
    CourseAV = CourseDetails.getString("avatar");
    CourseName = CourseDetails.getString("course_name");
    CourseOtlt = CourseDetails.getString("course_outlet");
    CourseColor = CourseDetails.getString("course_color");
    CourseDesc = CourseDetails.getString("course_description");
    CourseStatus = CourseDetails.getBoolean("status");
    CourseStudents = CourseDetails.getString("enrolled_students");
} catch (SQLException e) {
    e.printStackTrace();
    SessionCookie.setNotificationCookie(response, "Database error occurred", false);
    response.sendRedirect("MyCourse.jsp");
} finally {
    // Close ResultSet in finally block
    if (CourseDetails != null) {
        try {
            CourseDetails.close();
        } catch (SQLException e) {
            e.printStackTrace();
            SessionCookie.setNotificationCookie(response, "Database error occurred", false);
            response.sendRedirect("MyCourse.jsp");
        }
    }
}
%>
<div class="container-fluid setCourseBackground d-flex flex-column justify-content-start align-items-end text-center p-0" style="border-color: #233A6C;   background-image: url('../Assets/Images/CH.png'), radial-gradient(#1f1f1fb5, #0d0d0ddb);"></div>
<div class="container my-4">
	<div class="row mb-5">
		<div class="col-12 col-lg-4 mb-4">
			<div class="d-flex flex-column justify-content-center h-100">
			<img src="../Assets/Images/CH.png" class="border border-1 shadow rounded img-fluid object-fit-cover" alt="">
				<div class="CourseNavigateBtn mb-2">
				 <form action="Course.jsp" class="mt-2 mx-1 w-50" method="get">
				 	<input type="hidden" name="courseID" value="1">
                    			<button type="submit" class="btn w-100 text-light" style="background-color: #233A6C;">Enroll Now</button>
                        </form>
                        <button type="button" class="btn btn-outline-dark mt-2 mx-1 w-50">Share</button>
                    </div>
                    <!-- <div class="progress rounded-pill mt-2" style="height: 8px;">
                        <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0"
                            aria-valuenow="70" aria-valuemax="100" style="background-color: #233A6C; width: 70%;"></div>
                    </div>
                    <small class="text-muted">7/10 lessons</small> -->
                </div>
            </div>
            <div class="col-12 col-lg-7 ps-lg-5">
                <h1 class="fw-bold mb-0 larger text-truncate">Python for Data Science</h1>
                <p class="medium text-muted mb-3">Bigginer to Advanced</p>
                <div class="d-flex flex-column flex-md-row border border-2 py-3 px-3 border-radius-15">
                    <div class="rateContainer me-3">
                        <span class="rate">4.5</span>
                        <div class="d-flex">
                            <img src="../Assets/Images/Star.png" height="20px" class="me-1" alt="">
                            <small class="text-muted">Rated</small>
                        </div>
                    </div>
                    <div class="d-flex flex-wrap gap-2">
                        <div class="CourseInfoCard border-orange">
                            <p class="text-truncate"><img class="me-2" src="../Assets/Images/Mail.png" height="25px"
                                    alt=""> john.doe@example.com</p>
                        </div>
                        <div class="CourseInfoCard border-dark-yellow">
                            <p class="text-truncate"><img class="me-2" src="../Assets/Images/User.png" height="25px"
                                    alt=""> Dev Vaghasiya</p>
                        </div>
                        <div class="CourseInfoCard border-dark-green">
                            <p class="text-truncate"><img class="me-2" src="../Assets/Images/Desktop.png" height="25px"
                                    alt=""> Online Course</p>
                        </div>
                        <div class="CourseInfoCard border-green">
                            <p class="text-truncate"><img class="me-2" src="../Assets/Images/CheetSheet.png"
                                    height="25px" alt=""> CheetSheet Available</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="CourseNavContainer">
            <button class="ActiveCourseNavContainer" type="button" onclick="changetTab('desc');" id="desc"
                style="border-color: #233A6C; color:#233A6C;">Description</button>
            <button class="CourseNavItem" type="button" onclick="changetTab('topic');" id="topic"
                style="border-color: #233A6C;">Topic</button>
        </div>
        <div class="p-4" id="descContainer">
            <p>
                This course is designed to take you from a beginner to an advanced level in
                Python for Data Science. You will learn the fundamentals of Python programming, data manipulation,
                data visualization, and machine learning. By the end of this course, you will have a solid understanding
                of Python and its applications in data science.
                <br>
                <br>
                You will learn the fundamentals of Python programming, data manipulation,
                data visualization, and machine learning. By the end of this course, you will have a solid understanding
                of Python and its applications in data science.
            </p>
            <div class="mb-4">
                <label class="large fw-bold darkBlueText mt-3 mb-1">Earn skills on</label>
                <div class="d-flex flex-wrap gap-2" id="skillsContainer">
                    <span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">JavaScript</span>
                    <span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">React</span>
                    <span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Node.js</span>
                    <span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Python</span>
                    <span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Data
                        Science</span>
                </div>
            </div>
            <h1 class="mb-2 fw-bold darkBlueText large text-truncate">Course Instructors</h1>
            <div class="d-flex flex-wrap mb-5">
                <div class="card flex-row align-items-center shadow border-0 pe-4 py-3 my-2 mx-2"
                    style="width: fit-content;">
                    <img src="../Assets/Images/Default Profile Picture1.png" class="rounded-circle mx-3" alt="Avatar"
                        style="width: 80px; height: 80px;">
                    <div class="d-flex flex-column">
                        <h5 class="mb-0">John Smith</h5>
                        <small class="text-muted mb-2">Course Instructor</small>
                        <a href="#" class="btn btn-outline-dark btn-sm rounded-pill w-auto">View Profile</a>
                    </div>
                </div>
            </div>
            <h1 class="mb-2 fw-bold darkBlueText large text-truncate">Course Mentors</h1>
            <div class="d-flex flex-wrap">
                <div class="card flex-row align-items-center shadow border-0 pe-4 py-3 my-2 mx-2"
                    style="width: fit-content;">
                    <img src="../Assets/Images/Default Profile Picture1.png" class="rounded-circle mx-3" alt="Avatar"
                        style="width: 80px; height: 80px;">
                    <div class="d-flex flex-column">
                        <h5 class="mb-0">John Smith</h5>
                        <small class="text-muted mb-2">Mentor</small>
                        <a href="#" class="btn btn-outline-dark btn-sm rounded-pill w-auto">View Profile</a>
                    </div>
                </div>
                <div class="card flex-row align-items-center shadow border-0 pe-4 py-3 my-2 mx-2"
                    style="width: fit-content;">
                    <img src="../Assets/Images/Default Profile Picture1.png" class="rounded-circle mx-3" alt="Avatar"
                        style="width: 80px; height: 80px;">
                    <div class="d-flex flex-column">
                        <h5 class="mb-0">John Smith</h5>
                        <small class="text-muted mb-2">Mentor</small>
                        <a href="#" class="btn btn-outline-dark btn-sm rounded-pill w-auto">View Profile</a>
                    </div>
                </div>
                <div class="card flex-row align-items-center shadow border-0 pe-4 py-3 my-2 mx-2"
                    style="width: fit-content;">
                    <img src="../Assets/Images/Default Profile Picture1.png" class="rounded-circle mx-3" alt="Avatar"
                        style="width: 80px; height: 80px;">
                    <div class="d-flex flex-column">
                        <h5 class="mb-0">John Smith</h5>
                        <small class="text-muted mb-2">Mentor</small>
                        <a href="#" class="btn btn-outline-dark btn-sm rounded-pill w-auto">View Profile</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="pt-2 d-none" id="topicContainer">
            <div class="d-flex flex-row align-items-center my-2 border border-1 rounded shadow-sm p-2">
                <img src="../Assets/Images/Book_open_duotone@3x.png" class="me-3" height="50px" alt="">
                <h2 class="large m-0 text-truncate" style="color: #333;">Prioritize showing your users</h2>
            </div>
            <div class="d-flex flex-row align-items-center my-2 border border-1 rounded shadow-sm p-2">
                <img src="../Assets/Images/Book_open_duotone@3x.png" class="me-3" height="50px" alt="">
                <h2 class="large m-0 text-truncate" style="color: #333;">Prioritize showing your users</h2>
            </div>
            <div class="d-flex flex-row align-items-center my-2 border border-1 rounded shadow-sm p-2">
                <img src="../Assets/Images/Book_open_duotone@3x.png" class="me-3" height="50px" alt="">
                <h2 class="large m-0 text-truncate" style="color: #333;">Prioritize showing your users</h2>
            </div>
            <div class="d-flex flex-row align-items-center my-2 border border-1 rounded shadow-sm p-2">
                <img src="../Assets/Images/Book_open_duotone@3x.png" class="me-3" height="50px" alt="">
                <h2 class="large m-0 text-truncate" style="color: #333;">Prioritize showing your users</h2>
            </div>
            <div class="d-flex flex-row align-items-center my-2 border border-1 rounded shadow-sm p-2">
                <img src="../Assets/Images/Book_open_duotone@3x.png" class="me-3" height="50px" alt="">
                <h2 class="large m-0 text-truncate" style="color: #333;">Prioritize showing your users</h2>
            </div>
            <div class="d-flex flex-row align-items-center my-2 border border-1 rounded shadow-sm p-2">
                <img src="../Assets/Images/Book_open_duotone@3x.png" class="me-3" height="50px" alt="">
                <h2 class="large m-0 text-truncate" style="color: #333;">Prioritize showing your users</h2>
            </div>
            <div class="d-flex flex-row align-items-center my-2 border border-1 rounded shadow-sm p-2">
                <img src="../Assets/Images/Book_open_duotone@3x.png" class="me-3" height="50px" alt="">
                <h2 class="large m-0 text-truncate" style="color: #333;">Prioritize showing your users</h2>
            </div>
        </div>
    </div>
    <script>
        let desc = document.getElementById('desc');
        let descContainer = document.getElementById('descContainer');
        let topic = document.getElementById('topic');
        let topicContainer = document.getElementById('topicContainer');

        function changetTab(tab) {
            if (tab === 'desc') {
                desc.style.color = "#233A6C";
                desc.style.backgroundColor = "transparent";
                topic.style.color = "#333";
                topic.style.backgroundColor = "transparent";
                desc.className = "ActiveCourseNavContainer";
                topic.className = "CourseNavItem";
                if (!topicContainer.classList.contains("d-none")) {
                    topicContainer.classList.add("d-none");
                    descContainer.classList.remove("d-none");
                }
            } else {
                desc.style.color = "#333";
                desc.style.backgroundColor = "transparent";
                topic.style.color = "#233A6C";
                topic.style.backgroundColor = "transparent";
                desc.className = "CourseNavItem";
                topic.className = "ActiveCourseNavContainer";
                if (topicContainer.classList.contains("d-none")) {
                    topicContainer.classList.remove("d-none");
                    descContainer.classList.add("d-none");
                }
            }
        }
    </script>
</body>

</html>

<!--                 <div class="progress rounded-pill mt-2" style="height: 8px;">
                    <div class="progress-bar" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuenow="70"
                        aria-valuemax="100" style="background-color: #233A6C; width: 70%;"></div>
                </div>
                <small class="text-muted">7/10 lessons</small>
 -->