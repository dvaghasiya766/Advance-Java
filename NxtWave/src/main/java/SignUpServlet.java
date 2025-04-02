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

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String query = "INSERT INTO user (`First Name`, `Last Name`, `Email ID`, `Contact No.`, `Password`) VALUES(?, ?, ?, ?, ?)";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String remail = request.getParameter("remail");
        String mob = request.getParameter("mob");
        String rpsw = request.getParameter("rpsw");

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nxtwave", "root", "");
             PreparedStatement psmt = con.prepareStatement(query)) {

            psmt.setString(1, fname);
            psmt.setString(2, lname);
            psmt.setString(3, remail);
            psmt.setString(4, mob);
            psmt.setString(5, rpsw);

            int result = psmt.executeUpdate();
            Cookie statusCookie;
            if (result > 0) {
                String encodedMessage = URLEncoder.encode("Successfully Registered!", StandardCharsets.UTF_8);
                statusCookie = new Cookie("isSuccess", encodedMessage);
            } else {
                String encodedMessage = URLEncoder.encode("Registration Failed!", StandardCharsets.UTF_8);
                statusCookie = new Cookie("isFailed", encodedMessage);
            }
            statusCookie.setMaxAge(10);
            response.addCookie(statusCookie);

        } catch (Exception e) {
            try (PrintWriter pw = response.getWriter()) {
                pw.print("System error occurred. Please try again later.");
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath());
    }
}
