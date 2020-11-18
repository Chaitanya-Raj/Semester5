package jdbctheory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class theory5 {
  public static void main(String[] args) {
    String url = "jdbc:mysql://localhost/college?serverTimezone=UTC";
    String userId = "root";
    String password = "";
    Connection conn;
    Statement stmnt;
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(url, userId, password);
      stmnt = conn.createStatement();
      stmnt.executeUpdate("Delete from Student where StudentId=\"3\"");
    } catch (ClassNotFoundException e) {
      System.out.println("Driver not found");
    } catch (SQLException e) {
      System.out.println(e);
    }
  }
}
