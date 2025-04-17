<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Layout.jsp" %>
<div class="remaining-width">
    <div class="container-fluid p-0 mb-4">
        <div class="d-flex flex-wrap" id="CourseContainer">
            <!-- Courses will be inserted here by Java -->
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
						<div class="progress rounded-pill mb-2" style="height: 8px;">
							<div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="background-color: rgb(0, 123, 255); width: 75%;"></div>
						</div>
						<div class="d-flex justify-content-between align-items-center">
							<small class="text-muted">15 / 20 lessons</small>
							<form action="CourseDetails.jsp">
								<button class="btn btn-sm px-3 rounded" style="background-color: rgb(0, 123, 255); color: rgb(255, 255, 255); border: none; cursor: pointer;">Continue</button>
							</form>
						</div>
					</div>
				</div>
			</div>
        </div>
    </div>
</div>
<%@ include file="Footer.jsp" %>