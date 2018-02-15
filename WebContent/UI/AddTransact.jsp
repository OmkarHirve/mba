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
float ProfitPU=0;
int maxtid=999;
float defProf=1;
float defSupp=1;
float CostPU=0;
float tcost=0;
float profit=0;
int cnt=Integer.parseInt(request.getParameter("cnt"));
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/idea", "root", "cloudera");
	
	PreparedStatement p = con.prepareStatement("select max(TID) from transact");
	ResultSet s = p.executeQuery();
	while(s.next())
	{
		maxtid=s.getInt(1);	
	}
	
	PreparedStatement sps = con.prepareStatement("select CostPU, ProfitPU from producttb where Name = ?");
	sps.setString(2,pname);
	ResultSet sp = sps.executeQuery();
	while(sp.next())
	{
		CostPU=sp.getInt("CostPU");
		ProfitPU=sp.getInt("ProfitPU");
	}
	maxtid+=1;
	tcost=cnt*CostPU;
	profit =cnt*ProfitPU;
	
	PreparedStatement ps = con.prepareStatement("insert into transact(TID,ItemName,Count,Cost_pItem,TotalCost,Profit) values (?,?,?,?,?,?)");
	ps.setInt(1,maxtid);
	ps.setString(2,pname);
    ps.setFloat(3,cnt);
    ps.setFloat(4,tcost);
    ps.setFloat(5,profit);
   	ps.execute();
	
	PreparedStatement spss = con.prepareStatement("insert into support_profit(PID,ItemName,Support,Profit) values (?,?,?,?)");
	spss.setInt(1,maxtid);
	spss.setString(2,pname);
	spss.setFloat(3,defSupp);
    spss.setFloat(4,defProf);
	spss.execute();
	
}
catch(Exception e)
{
        System.out.println(e);
}
%>

</body>
</html>