import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/LogInServlet")
public class LogInServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String query = "SELECT * FROM user WHERE `Email ID` = ? AND `Password` = ?";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();        
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String redirection = request.getContextPath();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nxtwave", "root", "");
            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, email);
            psmt.setString(2, password);
            ResultSet rs = psmt.executeQuery();
            if(rs.next()) {
                String Role = rs.getString("Role");
                pw.println(Role);
                if("Student".equals(Role)) {
                	redirection += "/StudentPanel";
                } else if("Mentor".equals(Role)) {
                	redirection += "/MentorPanel";
                } else if("Admin".equals(Role)) {
                	redirection += "/AdminPanel";
                } else if("Course Instructor".equals(Role)) {
                	redirection += "/CourseInstructorPanel";
                } else {
                	redirection += "/Verify";
                }
                response.sendRedirect(redirection);
            } else {
                // Failure - set error flag cookie
            	String errorMessage = "Incorrect Email Or Password!";
            	String encodedMessage = URLEncoder.encode(errorMessage, StandardCharsets.UTF_8.toString());
            	Cookie failedCookie = new Cookie("isFailed", encodedMessage);
                failedCookie.setMaxAge(10); // 10 seconds
                response.addCookie(failedCookie);
                response.sendRedirect(request.getContextPath() + "/index.jsp#LogIn");
            }
        } catch (Exception e) {
            pw.print("System error occurred");
            e.printStackTrace();
        } finally {
            pw.close();
        }
    }
}