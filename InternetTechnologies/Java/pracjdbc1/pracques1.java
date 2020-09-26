
import java.sql.*;
import java.util.*;

public class pracques1
{
	public static void main(String args[])
	{
		Scanner sc=new Scanner(System.in);
		String url="jdbc:mysql://localhost/student";
		String userId="root";
		String password="";
		ResultSet results;
		Connection conn;
		Statement stmnt;
		
		try {
            
						Class.forName("com.mysql.cj.jdbc.Driver");
			              conn = DriverManager.getConnection(url,userId,password);
			              stmnt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,0);
			              String query="SELECT fname from student";
			              results=stmnt.executeQuery(query);
			              boolean records =results.next();
			              if(!records) {
			            	  System.out.println("No records Found! ");
			              }
				              else
				              {
				            	  results.last();
				            	  int r=results.getRow();
				            	  System.out.println("Total no. of rows:"+r);
				              }
				              stmnt.close();
				              conn.close();
						}
						catch(ClassNotFoundException e) 
						{
			        	   	System.out.println("Driver not found");
			           }
			           catch(SQLException e)
						{
			    
			         	System.out.println(e);
			           }
			             
		}
	}
