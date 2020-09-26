import java.sql.*;
import java.util.*;

public class q3 {
    public static void main(String args[]) {
        // String url = "jdbc:mysql://localhost/Student?serverTimezone=UTC";
        String url = "jdbc:mysql://localhost/Collage?serverTimezone=UTC";
        String userId = "root";
        String password = "", fname, lname;
        int id;
        Connection conn;
        Statement stmnt;
        PreparedStatement stmnt1;
        ResultSet results;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, userId, password);
            stmnt = conn.createStatement();

            String query = "select * from Teacher";
            results = stmnt.executeQuery(query);
            int rowsupdated = 0;
            String query1 = "update teacher set Fname=? where Fname=?";
            stmnt1 = conn.prepareStatement(query1);

            while (results.next()) {
                fname = results.getString(1);
                String uf = "Dr. " + fname;
                stmnt1.setString(1, uf);
                stmnt1.setString(2, fname);
                rowsupdated += stmnt1.executeUpdate();
            }
            System.out.print("Rows affected:" + rowsupdated);
            stmnt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Driver not found");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}