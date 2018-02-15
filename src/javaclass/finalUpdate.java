package javaclass;

import java.sql.*;

public class finalUpdate 
{
	public void update(float pid,float support,float profit)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/idea", "root", "cloudera");
		    PreparedStatement pstmt = con.prepareStatement("update support_profit set Support=?,Profit=? where PID=?");
		    pstmt.setFloat(1,support);
		    pstmt.setFloat(2,profit);
		    pstmt.setFloat(3,pid);
			pstmt.executeUpdate();
		    
		    System.out.println("Support and Profit updated");
		}
		catch(Exception e)
		{
		        System.out.println(e);
		}
	}
}
