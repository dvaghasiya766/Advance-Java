package NxtWave.CourseManagement.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import NxtWave.Common.Hashing.SessionCookie;
import NxtWave.CourseManagement.DAO.CourseDAO;

/**
 * Servlet implementation class ActiveCourse
 */
@WebServlet("/InstructorPanel/ActiveCourse")
public class ActiveCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActiveCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		    // Get and validate courseID
		    String courseIDStr = request.getParameter("courseID");
		    if (courseIDStr == null || courseIDStr.trim().isEmpty()) {
		        throw new IllegalArgumentException("Course ID is required");
		    }

		    // Parse courseID safely
		    int courseID;
		    try {
		        courseID = Integer.parseInt(courseIDStr.trim());
		    } catch (NumberFormatException e) {
		        throw new IllegalArgumentException("Invalid Course ID format");
		    }

		    // Parse courseStatus - safer comparison
		    String statusParam = request.getParameter("courseStatus");
		    boolean courseStatus = "true".equalsIgnoreCase(statusParam);

		    // Update course status
		    int updateCount = CourseDAO.changeCourseStatus(courseStatus, courseID);
		    
		    if (updateCount > 0) {
		        String action = courseStatus ? "Deactivated" : "Activated";
		        SessionCookie.setNotificationCookie(response, 
		            "Course " + action + "!", true);
		    } else {
		        SessionCookie.setNotificationCookie(response, 
		            "Course not found or no changes made", false);
		    }

		    // Always redirect back to course details
		    response.sendRedirect("CourseDetails.jsp?courseID=" + courseIDStr);

		} catch (IllegalArgumentException e) {
		    SessionCookie.setNotificationCookie(response, 
		        "Invalid input: " + e.getMessage(), false);
		    response.sendRedirect("CourseDetails.jsp?courseID=" + request.getParameter("courseID"));
		} catch (Exception e) {
		    SessionCookie.setNotificationCookie(response, 
		        "An unexpected error occurred", false);
		    response.sendRedirect("index.jsp");
		}
	}
}
