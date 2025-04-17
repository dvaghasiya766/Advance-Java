<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Layout.jsp" %>
<div class="remaining-width">
	<!-- Activity Header -->
	<div class="container-fluid p-0 mb-4">
		<div class="row align-items-center">
			<div class="col-md-6">
				<h2 class="fw-bold mb-0 darkBlueText heading-1">Alex's Activity!</h2>
				<p class="text-muted">View yuor all Activitise Here.</p>
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
	<!-- Activity Body -->
	<div class="container-fluid p-0 pb-4 mb-5 d-none">
		<div class="d-flex justify-content-center py-5">
			<img alt="" src="../Assets/Images/not created.png" class="NotFoundImg">
		</div>
	</div>
	<div class="container-fluid p-0 pb-4 mb-5">
		<div class="customBorderedBox d-flex align-items-center mb-2 ps-3 pe-1 py-2 border rounded">
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
		<div class="customBorderedBox d-flex align-items-center mb-2 ps-3 pe-1 py-2 border rounded">
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
		<div class="customBorderedBox d-flex align-items-center mb-2 ps-3 pe-1 py-2 border rounded">
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
		<div class="customBorderedBox d-flex align-items-center mb-2 ps-3 pe-1 py-2 border rounded">
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
		<div class="customBorderedBox d-flex align-items-center mb-2 ps-3 pe-1 py-2 border rounded">
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
</div>
<%@ include file="Footer.jsp" %>