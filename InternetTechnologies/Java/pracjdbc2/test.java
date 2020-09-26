import java.sql.*;
import java.util.*;

public class test {
    public static void main(String args[]) {
        // String url = "jdbc:mysql://localhost/Student?serverTimezone=UTC";
        String url = "jdbc:mysql://localhost/Collage?serverTimezone=UTC";
        String userId = "root";
        String password = "", fname, lname;
        int id;
        Connection conn;
        Statement stmnt;
        ResultSet results;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, userId, password);
            stmnt = conn.createStatement();
            // String query="DELETE FROM marks WHERE Rollno = 5";
            String query = "update Teacher set Fname='Dr. Rita' where Fname='Rita' ";
            stmnt.executeUpdate(query);
            query = "select * from Teacher";
            results = stmnt.executeQuery(query);
            boolean records = results.next();
            if (!records) {
                System.out.println("No records found ");
            } else {
                do {
                    id = results.getInt(3);
                    fname = results.getString(1);
                    lname = results.getString(2);
                    System.out.println(id + " " + fname + " " + lname + " ");
                } while (results.next());
            }

            stmnt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Driver not found");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}