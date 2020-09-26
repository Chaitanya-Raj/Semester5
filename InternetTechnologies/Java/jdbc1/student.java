package jdbc1;

import java.util.*;
import java.sql.*;

public class student {

    public static void main(String args[]) {
        String url = "jdbc:mysql://localhost/school?serverTimezone=UTC";
        String userId = "root";
        String password = "";
        ResultSet results;
        Connection conn;
        Statement stmnt;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, userId, password);
            stmnt = conn.createStatement();
            char ch;
            do {
                System.out.println("Enter the choice from the following:");
                System.out.println("1.Find total students");
                System.out.println("2.Average marks of all subjects");
                System.out.println("3.Student getting highest marks");
                System.out.println("4.Students qualified for Firesultst Second and Third Division");
                System.out.println("5.Topperesults of all Subjects");
                System.out.println("6.Average Marks");
                System.out.println("7.Student getting second highest marks");

                Scanner ob = new Scanner(System.in);
                int choice = ob.nextInt();

                switch (choice) {
                    case 1: {
                        results = stmnt.executeQuery("select count(*) from marks");
                        results.next();
                        int t = results.getInt("count(*)");
                        System.out.println(t);
                        break;
                    }
                    case 2: {
                        String sql = "select AVG(Physics) as s1,AVG(Chemistry) as s2,AVG(Maths) as s3 from marks";
                        results = stmnt.executeQuery(sql);
                        results.next();
                        System.out.println("Average Marks:");
                        int s = results.getInt("s1");
                        System.out.println("physics = " + s);
                        s = results.getInt("s2");
                        System.out.println("chemistry = " + s);
                        s = results.getInt("s3");
                        System.out.println("marks = " + s);
                        break;
                    }
                    case 3: {
                        String sql = "Select Name from marks where Physics=(select max(Physics) from marks) OR Chemistry=(select max(Chemistry) from marks) OR Maths=(select max(Maths) from marks)";
                        results = stmnt.executeQuery(sql);
                        results.next();
                        String s = results.getNString("Name");
                        System.out.println(s + " secured the highest marks");
                        break;
                    }
                    case 4: {
                        int div1 = 0, div2 = 0, div3 = 0, div4 = 0;
                        results = stmnt.executeQuery("select (Physics+Chemistry+Maths/300)*100 as 'div' from marks");
                        while (results.next()) {
                            if (results.getInt("div") > 90) {
                                div1++;
                            } else if (results.getInt("div") < 90 && results.getInt("div") > 60) {
                                div2++;
                            } else if (results.getInt("div") < 60 && results.getInt("div") > 33) {
                                div3++;
                            } else {
                                div4++;
                            }
                        }
                        System.out.println("First division student count" + div1);
                        System.out.println("Second division student count" + div2);
                        System.out.println("Third division student count" + div3);
                        System.out.println("Rest student count" + div4);
                        break;
                    }

                    case 5: {
                        results = stmnt.executeQuery(
                                "Select Name, max(Physics) from marks where Physics=(Select max(Physics) from marks)");
                        results.next();
                        System.out.println("max marks in physics is of " + results.getString("Name"));
                        results = stmnt.executeQuery(
                                "Select Name, max(Physics) from marks where Chemistry=(Select max(Chemistry) from marks)");
                        results.next();
                        System.out.println("max marks in chemistry is of " + results.getString("Name"));
                        results = stmnt.executeQuery(
                                "Select Name, max(Physics) from marks where Maths=(Select max(Maths) from marks)");
                        results.next();
                        System.out.println("max marks in maths is of " + results.getString("Name"));
                        break;
                    }
                    case 6: {
                        String sql = "Select AVG(Physics+ Chemistry +Maths)/3 as average from marks";
                        results = stmnt.executeQuery(sql);
                        results.next();
                        int s = results.getInt("average");
                        System.out.println(s + "is the average of all marks  :");
                        break;
                    }
                    case 7: {
                        results = stmnt.executeQuery(
                                "select Name,max(Physics+Chemistry+Maths) from marks where (Physics+Chemistry+Maths)<(select max(Physics+Chemistry+Maths) from marks)");
                        // results=stmnt.executeQuery("select Name as name,(Physics+Chemistry+Maths)
                        // from marks order by(Physics+Chemistry+Maths) desc");
                        results.next();
                        results.next();
                        System.out.println(results.getString("name"));
                        break;
                    }
                }
                System.out.println("Press Y or y to continue");
                ch = ob.next().charAt(0);
            } while (ch == 'Y' || ch == 'y');
            stmnt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Driver not found");
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}