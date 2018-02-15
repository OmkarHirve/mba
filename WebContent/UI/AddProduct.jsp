<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String pname = request.getParameter("pname");
float cpu = Float.parseFloat(request.getParameter("cpu"));
float ppu = Float.parseFloat(request.getParameter("ppu"));
int maxpid=999;
float defProf=1;
float defSupp=0;

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/idea", "root", "cloudera");
	
	PreparedStatement p = con.prepareStatement("select max(PID) from producttb");
	ResultSet s = p.executeQuery();
	while(s.next())
	{
		maxpid=s.getInt(1);	
	}
	maxpid+=1;
	PreparedStatement ps = con.prepareStatement("insert into producttb(PID,Name,CostPU,ProfitPU) values (?,?,?,?)");
	ps.setInt(1,maxpid);
	ps.setString(2,pname);
    ps.setFloat(3,cpu);
    ps.setFloat(4,ppu);
   	ps.execute();
	
	PreparedStatement sps = con.prepareStatement("insert into support_profit(PID,ItemName,Support,Profit) values (?,?,?,?)");
	sps.setInt(1,maxpid);
	sps.setString(2,pname);
	sps.setFloat(3,defSupp);
    sps.setFloat(4,defProf);
	sps.execute();
	
}
catch(Exception e)
{
        System.out.println(e);
}
%>

</body>
</html>