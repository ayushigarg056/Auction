<html>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" session="false" %>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql:" + "//localhost:3306/auction","root","akki");
	
String uname=request.getParameter("username");
String upass=request.getParameter("password");

PreparedStatement ps = cn.prepareStatement("select * from users where user_name = ? and password = ? ");
ps.setString(1, uname);
ps.setString(2,upass);

ResultSet rs=ps.executeQuery();

if(rs.next()){
	//response.sendRedirect("afterlogin.jsp");
	//HttpSession session=request.getSession();
	//session.setAttribute("username",user_id);
	//session.setAttribute("password",password);
	%>
	<script type="text/javascript">
	alert("Login successful");
	</script>
	<% 
}

else
{
	%>
	<script type="text/javascript">
	alert("Invalid User Name/Password");
	location = 'login.jsp';
	</script>
	<% 
	//response.sendRedirect("login.jsp");
}
}
catch(Exception e)
{
}
%>   
</body>
</html>