package HiveConnect;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.InputStreamReader;


public class sqoopimport 
{
	public void importdata() throws IOException, InterruptedException
	{
		String cmd_to_import = "sqoop import --connect jdbc:mysql://localhost:3306/idea --username root --password cloudera --table transact --target-dir /user/old/first --m 1";

		String line = "";
		Process proc = Runtime.getRuntime().exec(cmd_to_import);
		BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream()));
		while((line = reader.readLine())!= null)
		{
			System.out.println(line + "\t");
		}
		proc.wait();

		
		try
		{
			Class.forName("org.apache.hive.jdbc.HiveDriver");
			Connection conn = DriverManager.getConnection("jdbc:hive2://localhost:10000/projectdb","hive","cloudera");
			PreparedStatement st = conn.prepareStatement("LOAD DATA INPATH '/user/old/second' INTO TABLE support_profit");
			ResultSet rs = st.executeQuery();
			System.out.println(" Data imported !!");
		}
		catch(Exception e)
		{
			System.out.println("");
		}

	}
}
