package NxtWave.Common.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import NxtWave.Common.DAO.UserOperation;
import NxtWave.Common.Hashing.SessionCookie;

/**
 * Servlet implementation class activeAccount
 */
@WebServlet("/activeAccount")
public class activeAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public activeAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		try {
			// 2. Attempt to insert student record
			int result = UserOperation.ActiveAccount(email);
            if (result > 0) {
                // 3. Success case
                handleSuccess(response, email);
            } else {
                // 4. Failure case (email already exists)
                handleFailure(response, "Email not Found...");
            }
			
		} catch (Exception e) {
            // 5. Error case
            handleError(response, e);
        }
	}
	
    private void handleSuccess(HttpServletResponse response, String email) throws IOException {
        String message = "Account Successfully Activated!";
        SessionCookie.setNotificationCookie(response, message, true);
        response.sendRedirect("index.jsp#LogIn");
    }
    private void handleFailure(HttpServletResponse response, String errorMessage) throws IOException {
        SessionCookie.setNotificationCookie(response, errorMessage, false);
        response.sendRedirect("index.jsp#SignUp");
    }
    private void handleError(HttpServletResponse response, Exception e) throws IOException {
        System.err.println("Registration error: " + e.getMessage());
        String message = "System error during Activation. Please try again.";
        SessionCookie.setNotificationCookie(response, message, false);
        response.sendRedirect("index.jsp#SignUp");
    }
}
