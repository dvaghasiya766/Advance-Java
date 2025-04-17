package NxtWave.Common.DAO;

import java.sql.*;
import NxtWave.Common.Hashing.PasswordUtil;
import NxtWave.Common.Connection.*;

public class LogInUserDAO {
    
    public static String checkUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email_id = ?";        
        try (Connection conn = PostgreSQLConnection.getCon();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                // Check if account is active
                if (!rs.getBoolean("status")) {
                    return "INACTIVE";
                }
                
                // Verify password
                if (PasswordUtil.verifyPassword(password, rs.getString("password"))) {
                    return rs.getString("role"); // Return role if successful
                }
            }
            return "INVALID"; // Invalid credentials
            
        } catch (SQLException e) {
            e.printStackTrace();
            return "ERROR"; // Database error
        }
    }
}