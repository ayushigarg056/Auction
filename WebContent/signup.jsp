<html>
<body bgcolor=ffffff>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
try
{
String NAME=request.getParameter("username");
String PASSWORD=request.getParameter("password");
String EMAIL=request.getParameter("email");
Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql:" + "//localhost:3306/auction","root","akki");

PreparedStatement ps=cn.prepareStatement("select * from users where user_name = ?");
ps.setString(1, NAME);
ResultSet rs=ps.executeQuery();
if(!rs.next()){
	PreparedStatement ps1=cn.prepareStatement("insert into users values(?,?,?)");
	ps1.setString(1, NAME);
	ps1.setString(2, PASSWORD);
	ps1.setString(3, EMAIL);
	ps1.executeUpdate();
	response.sendRedirect("login.jsp");
}
else{
	%>
	<script>
	alert("This User Name Is Already Taken");
	location='login.jsp';
	</script>
	<% 
}

ps.close();
cn.close();

}
catch(Exception e)
{
out.println(e);
}
%>  