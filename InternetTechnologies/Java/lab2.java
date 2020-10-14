package jdbclab;

import java.sql.*;

public class lab2 {
	public static void main(String args[]) {
		String url = "jdbc:mysql://localhost/jdbc1?serverTimezone=UTC";
		String userId = "root";
		String password = "";
		Connection conn;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, userId, password);
			String sql = "{ call jdbc2(?) }";
			CallableStatement cs = conn.prepareCall(sql);
			cs.registerOutParameter(1, Types.INTEGER);
			cs.execute();
			int r = cs.getInt(1);
			System.out.println("Total rows : " + r);

		} catch (ClassNotFoundException e) {
			System.out.println("Driver not found");
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}