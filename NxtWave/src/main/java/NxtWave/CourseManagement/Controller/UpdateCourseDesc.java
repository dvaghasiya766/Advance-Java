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
 * Servlet implementation class UpdateCourseDesc
 */
@WebServlet("/InstructorPanel/UpdateCourseDesc")
public class UpdateCourseDesc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCourseDesc() {
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
			String courseIDStr = request.getParameter("courseID");
			Integer courseID = Integer.parseInt(courseIDStr);
			String courseDesc = request.getParameter("courseDesc");
			if (CourseDAO.updateCourseDesc(courseDesc, courseID) > 0) {
		        String message = "Course Description Updated successfully!";
		        SessionCookie.setNotificationCookie(response, message, true);
		        response.sendRedirect("CourseDetails.jsp?courseID=" + courseIDStr);
			} else {
				String errorMessage = "Cann't Update Course...";
		        SessionCookie.setNotificationCookie(response, errorMessage, false);
		        response.sendRedirect("CourseDetails.jsp?courseID=" + courseIDStr);
			}
		} catch (NumberFormatException e) {
			String errorMessage = "Failed to Connect Database...";
	        SessionCookie.setNotificationCookie(response, errorMessage, false);
	        response.sendRedirect("index.jsp");
		}
	}

}
