package jdbctheory;

import java.sql.*;

public class theory4 {
    public static void main(String args[]) {
        String url = "jdbc:mysql://localhost/jdbc1?serverTimezone=UTC";

        String userId = "root", password = "";
        String fname, lname = "";
        int id;
        Connection conn;
        Statement stmnt;
        ResultSet results;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, userId, password);
            stmnt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            String query = "select * from details where Fname=\"Ayush\"";
            results = stmnt.executeQuery(query);
            results.moveToInsertRow();
            results.updateString(1, "Chaitanya");
            results.updateString(2, "Raj");
            results.updateInt(3, 69);
            results.updateInt(4, 87);
            results.updateInt(5, 84);
            results.insertRow();

            results.moveToInsertRow();
            results.updateString(1, "Mehul");
            results.updateString(2, "Shrivastav");
            results.updateInt(3, 56);
            results.updateInt(4, 78);
            results.updateInt(5, 64);
            results.insertRow();

            boolean records = results.first();
            if (!records) {
                System.out.println("No records found ");
            } else {
                do {
                    id = results.getInt(1);
                    fname = results.getString(2);
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
