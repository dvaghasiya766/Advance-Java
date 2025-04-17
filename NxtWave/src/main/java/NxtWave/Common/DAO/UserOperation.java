package NxtWave.Common.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import NxtWave.Common.Connection.PostgreSQLConnection;

public class UserOperation {
	public static int getId(String email) {
		Connection conn = null;
        PreparedStatement pstm = null;
        int id = 0;
        
        try {
            // 1. Get database connection
            conn = PostgreSQLConnection.getCon();
            if (conn == null) {
                System.err.println("Failed to get database connection!");
                return id;
            }
            
            // 2. Prepare SQL statement
            String sql = "SELECT id FROM users WHERE email_id = ?";
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
			pstm.setString(1, email); // userEmail is the value of email_id
            
            // 4. Execute update
            ResultSet rs = pstm.executeQuery(); 
            if (rs.next()) {
            		id = rs.getInt("id");
            }
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
        
        return id;
	}
	
	public static int ActiveAccount(String email) {
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
            String sql = "UPDATE users SET status = true WHERE email_id = ?";
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
	
	public static int setAvatar(String avatar, Integer id) {
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
            String sql = "UPDATE users SET avatar = ? WHERE id = ?";
			pstm = conn.prepareStatement(sql);
			
			// 3. Set parameters (prevents SQL injection)
			pstm.setString(1, avatar);
			pstm.setInt(2, id);
            
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
