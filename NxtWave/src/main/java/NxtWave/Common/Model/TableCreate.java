package NxtWave.Common.Model;

import java.sql.*;

public class TableCreate {
    public static int createUserMySQL() {
        Connection conn = null;
        PreparedStatement pstm = null;
        int status = 0;
        
        try {
        	// 1. Get database connection
            conn = MySQLConnection.getCon();
            if (conn == null) {
                System.err.println("Failed to get database connection!");
                return status;
            }
            
            // 2. Prepare SQL statement
            String create = "CREATE TABLE USERS ("
            		+ "    ID INT AUTO_INCREMENT PRIMARY KEY,"
            		+ "    Prefix VARCHAR(255),"
            		+ "    `First Name` VARCHAR(255),"
            		+ "    `Last Name` VARCHAR(255),"
            		+ "    `Contact No.` BIGINT,"
            		+ "    Password VARCHAR(255) NOT NULL,"
            		+ "    Role ENUM('Admin', 'Student', 'Mentor'),"
            		+ "    DOB DATE,"
            		+ "    Status BOOLEAN DEFAULT TRUE,"
            		+ "    `Create At` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
            		+ "    `Last Updated` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP"
            		+ ")";
            
            // 3. Execute update
			pstm = conn.prepareStatement(create);
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
    
    public static int createUserPostgreSQL() {
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
            String create = "CREATE TABLE USERS ("
            		+ "    ID SERIAL PRIMARY KEY,"
            		+ "    Prefix VARCHAR(255),"
            		+ "    \"First Name\" VARCHAR(255),"
            		+ "    \"Last Name\" VARCHAR(255),"
            		+ "    \"Email ID\" VARCHAR(255) UNIQUE,"
            		+ "    \"Contact No.\" BIGINT,"
            		+ "    Password VARCHAR(255) NOT NULL,"
            		+ "    Role VARCHAR(50) CHECK (Role IN ('Admin', 'Student', 'Mentor')),"
            		+ "    DOB DATE,"
            		+ "    Status BOOLEAN DEFAULT TRUE,"
            		+ "    \"Create At\" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,"
            		+ "    \"Last Updated\" TIMESTAMP DEFAULT CURRENT_TIMESTAMP"
            		+ ")";
			
            // 3. Create a function to update the Last Updated timestamp
            String fun1 = "CREATE OR REPLACE FUNCTION update_last_updated()"
            		+ "RETURNS TRIGGER AS $$"
            		+ "BEGIN"
            		+ "    NEW.\"Last Updated\" = CURRENT_TIMESTAMP;"
            		+ "    RETURN NEW;"
            		+ "END;"
            		+ "$$ LANGUAGE plpgsql;";
			
            // 4. Create a trigger to automatically update Last Updated on row changes
            String fun2 = "CREATE TRIGGER update_users_last_updated"
            		+ "BEFORE UPDATE ON USERS"
            		+ "FOR EACH ROW"
            		+ "EXECUTE FUNCTION update_last_updated();";
            
            // 5. Execute update
			pstm = conn.prepareStatement(create);
            status = pstm.executeUpdate();
			pstm = conn.prepareStatement(fun1);
            status = pstm.executeUpdate();
			pstm = conn.prepareStatement(fun2);
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
