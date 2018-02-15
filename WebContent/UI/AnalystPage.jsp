<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>From here analyst would perform it's functions</title>
</head>
<body>
<% 
try
{
	if(request.getParameter("Done") != null)
	{
		%>Values updated successfully !!<%
	}
	
}
catch(NullPointerException e)
{
	%>
	<form action="Update_support_Profit.jsp">
<input type = "submit" value="Update support and profit">
</form>

<form action="Load_new_data_in_hive">
<input type = "submit" value="Load_new_data_in_hive">
</form>
	
	<%
}
%>
<form action="Update_support_Profit.jsp">
<input type = "submit" value="Update support and profit">
</form>

<form action="Load_new_data_in_hive">
<input type = "submit" value="Load_new_data_in_hive">
</form>

</body>
</html>