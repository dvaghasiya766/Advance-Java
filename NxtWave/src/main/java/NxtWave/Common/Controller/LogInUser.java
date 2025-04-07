package NxtWave.Common.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import NxtWave.Common.DAO.LogInUserDAO;
import NxtWave.Common.Hashing.SessionCookie;
import NxtWave.StudentManagement.Model.StudentBean;

/**
 * Servlet implementation class LogInUser
 */
@WebServlet("/LogInUser")
public class LogInUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInUser() {
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
		// PrintWriter pw = response.getWriter();		
		String message;
		StudentBean studentObject = new StudentBean();

		studentObject.setEmail(request.getParameter("email"));
		studentObject.setPassword(request.getParameter("password"));
		
		switch (LogInUserDAO.checkUser(studentObject.getEmail(), studentObject.getPassword())) {
		case "INVALID":
			message = "Invalid email or password!";
			SessionCookie.setNotificationCookie(response, message, false);
	        response.sendRedirect("index.jsp#LogIn");
			break;
		case "INACTIVE":
			message = "Account is not Active! You recived An Email for Activation...";
			SessionCookie.setNotificationCookie(response, message, false);
	        response.sendRedirect("index.jsp#LogIn");
			break;
		case "ERROR":
			message = "Can not connect with Database! Please try again leter...";
			SessionCookie.setNotificationCookie(response, message, false);			
	        response.sendRedirect("index.jsp#LogIn");
			break;
		case "Admin":
			message = "Wel-Come to the Admin Panel!!";
			SessionCookie.setNotificationCookie(response, message, true);
			SessionCookie.setSession(request, studentObject.getEmail(), "Admin");
	        response.sendRedirect("AdminPanel/");
			break;
		case "Instructor":
			message = "Wel-Come to the Instructor Panel!!";
			SessionCookie.setNotificationCookie(response, message, true);			
	        response.sendRedirect("InstructorPanel/");
			break;
		case "Mentor":
			message = "Wel-Come to the Mentor Panel!!";
			SessionCookie.setNotificationCookie(response, message, true);			
	        response.sendRedirect("MentorPanel/");
			break;
		case "Student":
			message = "Wel-Come to the Student Panel!!";
			SessionCookie.setNotificationCookie(response, message, true);	
			SessionCookie.setSession(request, studentObject.getEmail(), "Student");
	        response.sendRedirect("StudentPanel/");
			break;
		default:
			message = "Unknown error occurred...";
			SessionCookie.setNotificationCookie(response, message, false);
	        response.sendRedirect("index.jsp#LogIn");
		}
	}

}
