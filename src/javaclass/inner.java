package javaclass;
import java.sql.*;

public class inner 
{
	float total_transac,count_of_item,sum,pid;
	float support;
	float[] values = new float[3];
	
	public float[] innerFunction(String ItemName)
	{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/idea", "root", "cloudera");
		PreparedStatement pstmt = con.prepareStatement("select count(TID) from transact where ItemName=?");
		pstmt.setString(1,ItemName);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			count_of_item = rs.getFloat(1);
		}
	
		PreparedStatement pstmtt = con.prepareStatement("select max(TID) from transact");
		ResultSet rst = pstmtt.executeQuery();
		while(rst.next())
		{
			total_transac = rst.getFloat(1);
		}
	
		PreparedStatement pstmttt = con.prepareStatement("select sum(Profit) from transact where ItemName=?");
		pstmttt.setString(1,ItemName);
		ResultSet rstt = pstmttt.executeQuery();
		while(rstt.next())
		{
			sum = rstt.getFloat(1);
			values[1] = sum;
		}
		
		PreparedStatement pstm = con.prepareStatement("select PID from producttb where Name=?");
		pstm.setString(1,ItemName);
		ResultSet rstm = pstm.executeQuery();
		while(rstm.next())
		{
			pid = rstm.getFloat(1);
			values[2] = pid;
		}
		support = count_of_item/total_transac;
		values[0] = support;
	}
	catch(Exception e){
		
	}
	return values;
}
}
