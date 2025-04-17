package NxtWave.Common.Connection;

import java.sql.*;

import NxtWave.Common.Provider.MySQLProvider;

public class MySQLConnection implements MySQLProvider {
    private static Connection con = null;
    
    public static Connection getCon() {
    	try {
            if (con == null || con.isClosed()) {
                // For MySQL
            	Class.forName("com.mysql.cj.jdbc.Driver");
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
