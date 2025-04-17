<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Layout.jsp" %>
<div class="remaining-width">
	<!-- Assignemts Header -->
	<div class="container-fluid p-0 mb-4">
		<div class="row align-items-center">
			<div class="col-md-6">
				<h2 class="fw-bold mb-0 darkBlueText heading-1">My Assignments!</h2>
				<p class="text-muted">Complete your Assisgnments for Ugreade your Skills.</p>
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
	<!-- Assignemts Body -->
	<div class="container-fluid p-0 pb-4 mb-5 d-none">
		<div class="d-flex justify-content-center py-5">
			<img alt="" src="../Assets/Images/not publish.png" class="NotFoundImg">
		</div>
	</div>
	<div class="container-fluid p-0 pb-4 mb-5">
		<div class="row mb-4">
			<div class="col">
				<div class="choise-selection m-0">
					<label>
						<input type="radio" name="filter" value="All" checked>
						<span class="btn">All</span>
					</label>
					<label>
						<input type="radio" name="filter" value="Upcoming">
						<span class="btn">Upcoming</span>
					</label>
					<label>
						<input type="radio" name="filter" value="Recent">
						<span class="btn">Recent</span>
					</label>
				</div>
			</div>
		</div>
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
					<p class="mb-0 large text-truncate">React Component Library</p>
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
				<div class="CourseIndicator CourseColor2 me-3 mb-2 flex-shrink-0"></div>
				<!-- Content -->
				<div class="flex-grow-1 w-100">
					<div class="d-flex flex-wrap align-items-center">
						<span class="badge missed-bg missed-txt me-2">Missed</span>
						<small class="text-muted DateTime">Due: Today, 10:45 AM</small>
					</div>
					<p class="mb-0 large text-truncate">React Component Library</p>
					<p class="mb-0 text-muted text-truncate">Advanced React Patterns - Project 2</p>
				</div>
				<!-- Button -->
				<form action="" class="mt-1 mt-md-0 ms-md-3">
					<input type="hidden" name="courseId" value="1" />
					<button type="submit" class="not-allowed btn btn-danger w-100 w-md-auto">Missed </button>
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
<%@ include file="Footer.jsp" %>