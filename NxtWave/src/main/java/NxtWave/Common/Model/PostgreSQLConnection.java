package NxtWave.Common.Model;

import java.sql.*;

public class PostgreSQLConnection implements PostgreSQLProvider {
	private static Connection con = null;
    
    public static Connection getCon() {
    	try {
            if (con == null || con.isClosed()) {
            	// For PostgreSQL (use this if PostgreSQL is your DB)
            	Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection(connURL, username, password);
                System.out.println("Connection successful!");
            }
        } catch(Exception ex) {
            System.err.println("Connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
		return con;
	}
}
