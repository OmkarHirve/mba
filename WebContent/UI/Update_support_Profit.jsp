<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="javaclass.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Analyze</title>
</head>

<body>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/idea", "root", "cloudera");
	PreparedStatement p = con.prepareStatement("select Name from producttb");
	ResultSet s = p.executeQuery();
	while(s.next())
	{
		
		String ItemName = s.getString(1);
		float[] res = new inner().innerFunction(ItemName);

		float support = res[0];
		float sum = res[1];
		float pid = res[2];
		
		new finalUpdate().update(pid,support,sum);
		%>
		<jsp:forward page="AnalystPage.jsp">
		<jsp:param name="Done" value="Updated the data"></jsp:param>
		</jsp:forward>
		<%
		
	}
}
catch(Exception e){}

%>

</body>
</html>