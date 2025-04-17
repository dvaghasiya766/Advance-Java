package NxtWave.StudentManagement.DAO;

import java.sql.*;

import NxtWave.Common.Hashing.PasswordUtil;
import NxtWave.Common.Connection.*;
import NxtWave.StudentManagement.Model.StudentBean;

public class StudentDAO {
	public static int insertStudentDetails(StudentBean s) {
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
            String sql = "INSERT INTO users (first_name, last_name, email_id, contact_no, password, role) VALUES (?, ?, ?, ?, ?, ?)";
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
            pstm.setString(1, s.getFirstName());
            pstm.setString(2, s.getLastName());
            pstm.setString(3, s.getEmail());
            pstm.setString(4, s.getContactNo());
            String hashedPassword = PasswordUtil.hashPassword(s.getPassword());
            pstm.setString(5, hashedPassword);
            pstm.setString(6, "Student");
            
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
	
	public static int updateStudentDetails(StudentBean s) {
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
            String sql = "UPDATE users SET " +
                    "first_name = ?, " +
                    "last_name = ?, " +
                    "contact_no = ?, " +
                    "country = ?, " +
                    "dob = ? " +
                    "WHERE email_id = ?";
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
            pstm.setString(1, s.getFirstName());
            pstm.setString(2, s.getLastName());
            pstm.setString(3, s.getContactNo());
            pstm.setString(4, s.getCountry());
            pstm.setDate(5, s.getDob());
            pstm.setString(6, s.getEmail());
            
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

	public static ResultSet getStudentDetails(String email) {
		Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs;
        
        try {
            // 1. Get database connection
            conn = PostgreSQLConnection.getCon();
            if (conn == null) {
                System.err.println("Failed to get database connection!");
                return null;
            }
            
            // 2. Prepare SQL statement
            String sql = "SELECT * FROM users WHERE email_id = ?";        
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
            pstm.setString(1, email);
            
            // 4. Execute update
            rs = pstm.executeQuery();
            return rs;
        } catch (SQLException e) {
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
	}

}
