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

    // Get course details with authorization check
    CourseDetails = CourseDAO.getCourseDetailseByCourseIDForInstructor(courseID, UserID);
    
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
<div class="container-fluid setCourseBackground d-flex flex-column justify-content-start align-items-end text-center p-0" style="border-color: <%= CourseColor %>;   background-image: url('../<%= CourseBG %>'), radial-gradient(#1f1f1fb5, #0d0d0ddb);"></div>
<div class="container my-4">
	<div class="row mb-5">
		<div class="col-12 col-lg-4 mb-4">
			<div class="d-flex flex-column justify-content-center h-100">
				<img src="../<%= CourseAV %>" class="border border-1 shadow rounded img-fluid object-fit-cover" alt="">
				<div class="CourseNavigateBtn mb-2">
					<form action="ActiveCourse" class="mt-2 mx-1 w-50" method="post">
						<input type="hidden" name="courseID" value="<%= courseID %>">
						<input type="hidden" name="courseStatus" value="<%= CourseStatus %>">
						<button type="submit" class="btn w-100 text-light" style="background-color: <%= CourseColor %>;"><%= CourseStatus ? "Inative Now" : "Active Now" %></button>
					</form>
					<button type="button" class="btn btn-outline-dark mt-2 mx-1 w-50">Share</button>
				</div>
			</div>
		</div>
		<div class="col-12 col-lg-7 ps-lg-5">
			<h1 class="fw-bold mb-0 larger text-truncate"><%= CourseName %></h1>
				<p class="medium text-muted mb-3"><%= CourseOtlt %></p>
				<div class="d-flex flex-column flex-md-row border border-2 py-3 px-3 border-radius-15">
					<div class="rateContainer me-3">
						<span class="rate"><%= CourseStudents %></span>
						<div class="d-flex">
							<img src="../Assets/Images/Star.png" height="20px" class="me-1" alt="">
							<small class="text-muted">Enrolled</small>
						</div>
					</div>
					<div class="d-flex flex-wrap gap-2">
						<div class="CourseInfoCard border-orange">
							<p class="text-truncate">
								<img class="me-2" src="../Assets/Images/Mail.png" height="25px"alt="">
								john.doe@example.com
							</p>
						</div>
						<div class="CourseInfoCard border-dark-yellow">
							<p class="text-truncate">
								<img class="me-2" src="../Assets/Images/User.png" height="25px" alt="">
								Dev Vaghasiya
							</p>
						</div>
						<div class="CourseInfoCard border-dark-green">
							<p class="text-truncate">
								<img class="me-2" src="../Assets/Images/Desktop.png" height="25px" alt="">
								Online Course
							</p>
						</div>
						<div class="CourseInfoCard border-green">
							<p class="text-truncate">
								<img class="me-2" src="../Assets/Images/CheetSheet.png" height="25px" alt="">
								CheetSheet Available
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="CourseNavContainer">
			<button class="ActiveCourseNavContainer" type="button" onclick="changetTab('desc');" id="desc" style="border-color: #1b5a7a; color:#1b5a7a;">Description</button>
			<button class="CourseNavItem" type="button" onclick="changetTab('topic');" id="topic" style="border-color: #1b5a7a;">Topic</button>
		</div>
		<div class="py-3" id="descContainer">
			<form action="UpdateCourseDesc" method="post">
				<input type="hidden" name="courseID" value="<%= courseID %>">
				<textarea class="descTextArea" name="courseDesc" placeholder="Write here Course Description" required><% if (CourseDesc != null) { %> <%= CourseDesc  %> <% } %></textarea>
				<div class="d-flex justify-content-end pt-1">
					<button type="submit" class="btn btn-outline-success align-self-end"><i class="bi bi-cloud-check medium"></i> Save</button>
				</div>
			</form>
			<div class="mb-4">
				<label class="large fw-bold darkBlueText mt-3 mb-1">Earn skills on</label>
				<div class="d-flex flex-wrap gap-2" id="skillsContainer"><span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">JavaScript</span>
					<span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">React</span>
					<span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Node.js</span>
					<span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Python</span>
					<span class="badge lightBlueBG bg-opacity-10 darkBlueText skills py-2 px-3">Data Science</span>
				</div>
			</div>
			<h1 class="mb-2 fw-bold darkBlueText large text-truncate">Course Instructors</h1>
			<div class="d-flex flex-wrap mb-5">
				<div class="card flex-row align-items-center shadow border-0 pe-4 py-3 my-2 mx-2" style="width: fit-content;">
					<img src="../Assets/Images/Default Profile Picture1.png" class="rounded-circle mx-3" alt="Avatar" style="width: 80px; height: 80px;">
					<div class="d-flex flex-column">
						<h5 class="mb-0">John Smith</h5>
						<small class="text-muted mb-2">Course Instructor</small>
						<a href="#" class="btn btn-outline-dark btn-sm rounded-pill w-auto">View Profile</a>
					</div>
				</div>
			</div>
			<h1 class="mb-2 fw-bold darkBlueText large text-truncate">Course Mentors</h1>
			<div class="d-flex flex-wrap">
				<div class="card flex-row align-items-center shadow border-0 pe-4 py-3 my-2 mx-2" style="width: fit-content;">
					<img src="../Assets/Images/Default Profile Picture1.png" class="rounded-circle mx-3" alt="Avatar" style="width: 80px; height: 80px;">
					<div class="d-flex flex-column">
						<h5 class="mb-0">John Smith</h5>
						<small class="text-muted mb-2">Mentor</small>
						<a href="#" class="btn btn-outline-dark btn-sm rounded-pill w-auto">View Profile</a>
					</div>
				</div>
				<div class="card flex-row align-items-center shadow border-0 pe-4 py-3 my-2 mx-2" style="width: fit-content;">
					<img src="../Assets/Images/Default Profile Picture1.png" class="rounded-circle mx-3" alt="Avatar" style="width: 80px; height: 80px;">
					<div class="d-flex flex-column">
						<h5 class="mb-0">John Smith</h5>
						<small class="text-muted mb-2">Mentor</small>
						<a href="#" class="btn btn-outline-dark btn-sm rounded-pill w-auto">View Profile</a>
					</div>
				</div>
			</div>
		</div>
		<div class="pt-3 d-none" id="topicContainer">
			<!-- Module 2 -->
			<div class="module-card" style="border-color: #1b5a7a;">
			<div class="module-header"><h5 class="m-0">Module 1: Visual Design Elements</h5></div>
			<div class="module-content">
				<!-- Topics would be listed here similarly -->
				<!-- Add Topic -->
				<div class="topic-item flex-column">
					<button class="btn medium shadow-sm p-2 rounded w-100 text-center py-2" style="color: #00306e; border: dashed 2px #00306e;" onclick="HideView(this)">
						<i class="bi bi-plus-circle-dotted me-2"></i>
						Add New Topic
						<i class="bi bi-youtube" style="color: #F24822;"></i>
						<i class="bi bi-clipboard2-data" style="color: #78C40F;"></i>
						<i class="bi bi-file-text" style="color: #FFCD29;"></i>
						<!-- <i class="bi bi-link-45deg" style="color: #0d6efd; font-size: 30px;"></i> -->
					</button>
					<form action="" method="post" class="w-100 d-none">
						<div class="mb-3 d-none">
							<input type="hidden" class="form-control disabled" name="TopicID" value="<%= courseID %>" required>
						</div>
						<div class="topic-selection my-2 align-items-center">
							<p class="me-2 mb-0">Select Topic Type :</p>
							<label>
								<input type="radio" name="topicType" value="1">
								<span class="btn">
									<i class="bi bi-youtube" style="color: #F24822;"></i>
								</span>
							</label>
							<label>
								<input type="radio" name="topicType" value="2">
								<span class="btn">
									<i class="bi bi-clipboard2-data" style="color: #78C40F;"></i>
								</span>
							</label>
							<label>
								<input type="radio" name="topicType" value="3" required>
								<span class="btn">
									<i class="bi bi-file-text" style="color: #FFCD29;"></i>
								</span>
							</label>
						</div>
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="Enter Topic Title" name="TopicTitle" required>
							<input type="text" class="form-control" placeholder="Enter Duration in Minutes" name="TopicDuration" required>
							<button class="btn btn-success" type="submit">Button</button>
						</div>
					</form>
				</div>
				<!-- Topic 1 -->
				<div class="topic-item">
					<i class="bi bi-youtube topic-icon" style="color: #F24822;"></i>
					<div class="flex-grow-1 me-auto">
						<h6 class="mb-1 text-truncate">Look opposite of competition</h6>
						<p class="small text-muted mb-1 text-truncate">Lecture | <i class="bi bi-clock mx-2"></i> 5 Min</p>
					</div>
					<form action="" method="get">
						<button type="button" class="btn"><i class="bi bi-pencil text-primary" style="font-size: large;"></i></button>
					</form>
					<form action="">
						<input type="hidden" name="courseId" value="1" />
						<button type="button" class="btn"><i class="bi bi-trash text-danger" style="font-size: large;"></i></button>
					</form>
				</div>
				<!-- Topic 2 -->
				<div class="topic-item">
					<i class="bi bi-clipboard2-data topic-icon" style="color: #78C40F;"></i>
					<div class="flex-grow-1 me-auto">
						<h6 class="mb-1 text-truncate">Look opposite of competition</h6>
						<p class="small text-muted mb-1 text-truncate">CheetSheet | <i class="bi bi-clock mx-2"></i> 5 Min</p>
					</div>
					<form action="">
						<button type="button" class="btn"><i class="bi bi-pencil text-primary" style="font-size: large;"></i></button>
					</form>
					<form action="">
						<input type="hidden" name="courseId" value="1" />
						<button type="button" class="btn"><i class="bi bi-trash text-danger" style="font-size: large;"></i></button>
					</form>
				</div>
				<!-- Topic 3 -->
				<div class="topic-item">
					<i class="bi bi-file-text topic-icon" style="color: #FFCD29;"></i>
					<div class="flex-grow-1 me-auto">
						<h6 class="mb-1 text-truncate">Look opposite of competition</h6>
						<p class="small text-muted mb-1 text-truncate">Assignment | <i class="bi bi-clock mx-2"></i> 5 Min</p>
					</div>
					<form action="">
						<button type="button" class="btn"><i class="bi bi-pencil text-primary" style="font-size: large;"></i></button>
					</form>
					<form action="">
						<input type="hidden" name="courseId" value="1" />
						<button type="button" class="btn"><i class="bi bi-trash text-danger" style="font-size: large;"></i></button>
					</form>
				</div>
				<!-- Topic 4 -->
				<!-- <div class="topic-item">
					<i class="bi bi-link-45deg topic-icon" style="color: #0d6efd;"></i>
					<div class="flex-grow-1 me-auto">
						<h6 class="mb-1 text-truncate">Look opposite of competition</h6>
						<p class="small text-muted mb-1 text-truncate">Assignmet | <i class="bi bi-clock mx-2"></i> 5 Min</p>
					</div>
					<form action="">
						<button type="button" class="btn">
							<i class="bi bi-pencil text-primary" style="font-size: large;"></i>
						</button>
					</form>
					<form action="">
						<input type="hidden" name="courseId" value="1" />
						<button type="button" class="btn"><i class="bi bi-trash text-danger" style="font-size: large;"></i></button>
					</form>
				</div> -->
			</div>
		</div>
		
		<div class="module-card" style="border-color: #1b5a7a;">
			<div class="module-header"><h5 class="m-0">Module 1: Visual Design Elements</h5></div>
			<div class="module-content">
				<!-- Topics would be listed here similarly -->
				<!-- Add Topic -->
				<div class="topic-item flex-column">
					<button class="btn medium shadow-sm p-2 rounded w-100 text-center py-2" style="color: #00306e; border: dashed 2px #00306e;" onclick="HideView(this)">
						<i class="bi bi-plus-circle-dotted me-2"></i>
						Add New Topic
						<i class="bi bi-youtube" style="color: #F24822;"></i>
						<i class="bi bi-clipboard2-data" style="color: #78C40F;"></i>
						<i class="bi bi-file-text" style="color: #FFCD29;"></i>
						<!-- <i class="bi bi-link-45deg" style="color: #0d6efd; font-size: 30px;"></i> -->
					</button>
					<form action="" method="post" class="w-100 d-none">
						<div class="mb-3 d-none">
							<input type="hidden" class="form-control disabled" name="TopicID" value="<%= courseID %>" required>
						</div>
						<div class="topic-selection my-3 align-items-center">
							<p class="me-2 mb-0">Select Topic Type :</p>
							<label>
								<input type="radio" name="topicType" value="1">
								<span class="btn">
									<i class="bi bi-youtube" style="color: #F24822;"></i>
								</span>
							</label>
							<label>
								<input type="radio" name="topicType" value="2">
								<span class="btn">
									<i class="bi bi-clipboard2-data" style="color: #78C40F;"></i>
								</span>
							</label>
							<label>
								<input type="radio" name="topicType" value="3" required>
								<span class="btn">
									<i class="bi bi-file-text" style="color: #FFCD29;"></i>
								</span>
							</label>
						</div>
						<div class="input-group my-3">
							<input type="text" class="form-control" placeholder="Enter Topic Title" required>
							<button class="btn btn-success" type="submit">Button</button>
						</div>
					</form>
				</div>
				<!-- Topic 1 -->
				<div class="topic-item">
					<i class="bi bi-youtube topic-icon" style="color: #F24822;"></i>
					<div class="flex-grow-1 me-auto">
						<h6 class="mb-1 text-truncate">Look opposite of competition</h6>
						<p class="small text-muted mb-1 text-truncate">Lecture | <i class="bi bi-clock mx-2"></i> 5 Min</p>
					</div>
					<form action="" method="get">
						<button type="button" class="btn"><i class="bi bi-pencil text-primary" style="font-size: large;"></i></button>
					</form>
					<form action="">
						<input type="hidden" name="courseId" value="1" />
						<button type="button" class="btn"><i class="bi bi-trash text-danger" style="font-size: large;"></i></button>
					</form>
				</div>
				<!-- Topic 2 -->
				<div class="topic-item">
					<i class="bi bi-clipboard2-data topic-icon" style="color: #78C40F;"></i>
					<div class="flex-grow-1 me-auto">
						<h6 class="mb-1 text-truncate">Look opposite of competition</h6>
						<p class="small text-muted mb-1 text-truncate">CheetSheet | <i class="bi bi-clock mx-2"></i> 5 Min</p>
					</div>
					<form action="">
						<button type="button" class="btn"><i class="bi bi-pencil text-primary" style="font-size: large;"></i></button>
					</form>
					<form action="">
						<input type="hidden" name="courseId" value="1" />
						<button type="button" class="btn"><i class="bi bi-trash text-danger" style="font-size: large;"></i></button>
					</form>
				</div>
				<!-- Topic 3 -->
				<div class="topic-item">
					<i class="bi bi-file-text topic-icon" style="color: #FFCD29;"></i>
					<div class="flex-grow-1 me-auto">
						<h6 class="mb-1 text-truncate">Look opposite of competition</h6>
						<p class="small text-muted mb-1 text-truncate">Assignment | <i class="bi bi-clock mx-2"></i> 5 Min</p>
					</div>
					<form action="">
						<button type="button" class="btn"><i class="bi bi-pencil text-primary" style="font-size: large;"></i></button>
					</form>
					<form action="">
						<input type="hidden" name="courseId" value="1" />
						<button type="button" class="btn"><i class="bi bi-trash text-danger" style="font-size: large;"></i></button>
					</form>
				</div>
				<!-- Topic 4 -->
				<!-- <div class="topic-item">
					<i class="bi bi-link-45deg topic-icon" style="color: #0d6efd;"></i>
					<div class="flex-grow-1 me-auto">
						<h6 class="mb-1 text-truncate">Look opposite of competition</h6>
						<p class="small text-muted mb-1 text-truncate">Assignmet | <i class="bi bi-clock mx-2"></i> 5 Min</p>
					</div>
					<form action="">
						<button type="button" class="btn">
							<i class="bi bi-pencil text-primary" style="font-size: large;"></i>
						</button>
					</form>
					<form action="">
						<input type="hidden" name="courseId" value="1" />
						<button type="button" class="btn"><i class="bi bi-trash text-danger" style="font-size: large;"></i></button>
					</form>
				</div> -->
			</div>
		</div>
		<button class="btn medium shadow-sm p-2 rounded w-100 text-center py-2" style="color: #00306e; background-color: #C4DAE6; border: dashed 2px #00306e;"  type="button" data-toggle="modal" data-target="#AddModule">
			<i class="bi bi-plus-circle-dotted me-2"></i> Add New Module
		</button>
	</div>
</div>
<!-- Modals -->
<div class="modal fade" id="AddModule" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="" method="post">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Add New Module</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3 d-none">
						<label for="cid" class="form-label">Course ID</label>
						<input type="hidden" class="form-control disabled" id="cid" name="cid" value="<%= courseID %>" required>
					</div>
					<div class="mb-3">
						<label for="title" class="form-label">Module Name</label>
						<input type="text" class="form-control" id="title" name="title" placeholder="Enter Module Name" required>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" id="saveProfile" class="btn btn-custom-primary">Add Now</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
	let all = document.getElementById('all');
	let allContainer = document.getElementById('allContainer');
	let assignments = document.getElementById('assignments');
	let assignmentsContainer = document.getElementById('assignmentsContainer');
	function changetTab(tab) {
		const isAll = tab === 'all';
		
		all.className = isAll ? "ActiveCourseNavContainer" : "CourseNavItem";
		assignments.className = isAll ? "CourseNavItem" : "ActiveCourseNavContainer";
		
		all.style.color = isAll ? "#1b5a7a" : "#333";
		assignments.style.color = isAll ? "#333" : "#1b5a7a";
		
		allContainer.classList.toggle("d-none", !isAll);
		assignmentsContainer.classList.toggle("d-none", isAll);
	}
	
	// Simple accordion functionality
	document.querySelectorAll('.module-header').forEach(header => {
		header.addEventListener('click', () => {
			const moduleCard = header.parentElement;
			moduleCard.classList.toggle('active-module');
			const content = moduleCard.querySelector('.module-content');
			if (moduleCard.classList.contains('active-module')) {
				content.style.display = 'block';
			} else {
				content.style.display = 'none';
			}
		});
	});
</script>
<script>
    let desc = document.getElementById('desc');
    let descContainer = document.getElementById('descContainer');
    let topic = document.getElementById('topic');
    let topicContainer = document.getElementById('topicContainer');

    function changetTab(tab) {
        if (tab === 'desc') {
            desc.style.color = "#1b5a7a";
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
            topic.style.color = "#1b5a7a";
            topic.style.backgroundColor = "transparent";
            desc.className = "CourseNavItem";
            topic.className = "ActiveCourseNavContainer";
            if (topicContainer.classList.contains("d-none")) {
                topicContainer.classList.remove("d-none");
                descContainer.classList.add("d-none");
            }
        }
    }
    function HideView(button) {
        // Find the form element next to the button
        const form = button.closest('.topic-item').querySelector('form');
        // Toggle the 'd-none' class on the form
        form.classList.toggle('d-none');    }
</script>
</body>

</html>