package HiveConnect;
import java.io.IOException;
//import org.apache.hive.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;


public class queried extends HttpServlet
{

	float support,profit;
	protected void doPost(HttpServletRequest request) throws ServletException, IOException 
	{ 
			support = Float.parseFloat(request.getParameter("supp"));
			profit = Float.parseFloat(request.getParameter("prof"));
    }
	public void getfrequentdata()
	{
		
		try
		{
			Class.forName("org.apache.hive.jdbc.HiveDriver");
			Connection conn = DriverManager.getConnection("jdbc:hive2://localhost:10000/idea","","");
			PreparedStatement st = conn.prepareStatement("select itemname from support_profit where support>" + support + " AND  profit>"+ profit);
			ResultSet rs = st.executeQuery();
			System.out.println("Following are the required frequent item sets");
			System.out.println("---------------------------------------------");
			while(rs.next())
			{
				System.out.println("----------");
				System.out.println("|" + rs.getString(1) + "|");
				System.out.println("----------");
			}
			System.out.println("---------------------------------------------");
		}
		catch(Exception e)
		{
			System.out.println("");
		}
	}
}

	
