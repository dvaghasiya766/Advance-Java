package NxtWave.Common.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import NxtWave.Common.Connection.MailApp;
import NxtWave.Common.Connection.PostgreSQLConnection;
import NxtWave.Common.DAO.LogInUserDAO;
import NxtWave.Common.DAO.UserOperation;
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
		String message;
		StudentBean studentObject = new StudentBean();
		int id;

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
	        MailApp.sendActivationMail(studentObject.getEmail());
	        response.sendRedirect("index.jsp#LogIn");
			break;
		case "ERROR":
			message = "Can not connect with Database! Please try again leter...";
			SessionCookie.setNotificationCookie(response, message, false);			
	        response.sendRedirect("index.jsp#LogIn");
			break;
		case "Admin":
			message = "Wel-Come to the Admin Panel!!";
			id = UserOperation.getId(studentObject.getEmail());
			SessionCookie.setNotificationCookie(response, message, true);
			SessionCookie.setSession(request, id, studentObject.getEmail(), "Admin");
			UpdateLogInHistory(studentObject.getEmail());
	        response.sendRedirect("AdminPanel/");
			break;
		case "Instructor":
			message = "Wel-Come to the Instructor Panel!!";
			id = UserOperation.getId(studentObject.getEmail());
			SessionCookie.setNotificationCookie(response, message, true);	
			SessionCookie.setSession(request, id, studentObject.getEmail(), "Instructor");
			UpdateLogInHistory(studentObject.getEmail());
	        response.sendRedirect("InstructorPanel/");
			break;
		case "Mentor":
			message = "Wel-Come to the Mentor Panel!!";
			id = UserOperation.getId(studentObject.getEmail());
			SessionCookie.setNotificationCookie(response, message, true);
			SessionCookie.setSession(request, id, studentObject.getEmail(), "Mentor");
			UpdateLogInHistory(studentObject.getEmail());
	        response.sendRedirect("MentorPanel/");
			break;
		case "Student":
			message = "Wel-Come to the Student Panel!!";
			id = UserOperation.getId(studentObject.getEmail());
			SessionCookie.setNotificationCookie(response, message, true);	
			SessionCookie.setSession(request, id, studentObject.getEmail(), "Student");
			UpdateLogInHistory(studentObject.getEmail());
	        response.sendRedirect("StudentPanel/");
			break;
		default:
			message = "Unknown error occurred...";
			SessionCookie.setNotificationCookie(response, message, false);
	        response.sendRedirect("index.jsp#LogIn");
		}
	}
	private static int UpdateLogInHistory(String email) {
		Connection conn = null;
        PreparedStatement pstm = null;
		int status = 0;
		
		try {
			// 1. Get database connection
			conn = PostgreSQLConnection.getCon();
			if (conn == null) {
				System.err.println("Failed to get database connection!");
				return status;
			}
			
			// 2. Prepare SQL statement
			String sql = "UPDATE users SET last_login = NOW() WHERE email_id = ?";
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
			pstm.setString(1, email); // userEmail is the value of email_id
			
			// 4. Execute update
			status = pstm.executeUpdate();            
		} catch (SQLException e) {
			System.err.println("SQL State: " + e.getSQLState());
			System.err.println("Error Code: " + e.getErrorCode());
			System.err.println("Message: " + e.getMessage());
			e.printStackTrace();
		} finally {
			// 5. Close resources
			try {
			    if (pstm != null) pstm.close();
			    if (conn != null) conn.close();
			} catch (SQLException e) {
			    System.err.println("Error closing resources: " + e.getMessage());
			}
		}
		return status;
	}
}
