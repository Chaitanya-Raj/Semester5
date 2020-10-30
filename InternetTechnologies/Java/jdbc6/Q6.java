package JDBC;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.sql.*;

public class Q6 {
	public static void main(String[] args)
	{
		String url = "jdbc:mysql://localhost/jdbc1?serverTimezone=UTC";
		String userId = "root";
        String password = "";
        Connection conn;
        ResultSet rs;
        CallableStatement stmnt;
        try
        {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	conn=DriverManager.getConnection(url, userId, password);
        	stmnt=conn.prepareCall("{ call Toppers(?) }");
        	stmnt.registerOutParameter(1, Types.INTEGER);
        	stmnt.execute();
        	rs=stmnt.getResultSet();
        	rs.next();
        	String val=rs.getString(1);
        	String val1=rs.getString(2);
        	System.out.println("1st topper's name: "+val+" "+val1);
        	rs.next();
        	val=rs.getString(1);
        	val1=rs.getString(2);
        	System.out.println("2nd topper's name: "+val+" "+val1);
        	rs.next();
        	val=rs.getString(1);
        	val1=rs.getString(2);
        	System.out.println("3rd topper's name: "+val+" "+val1);
        }
        catch(ClassNotFoundException e) {
     	   	System.out.println("Driver not found");
        }
        catch(SQLException e) {
      	System.out.println(e);
        }
	}
}