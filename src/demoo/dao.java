package demoo;


import java.sql.Connection;
import java.sql.DriverManager;

public class dao {

	public static  Connection cn;
	
	public static  Connection mycon()
	{
	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");	
			System.out.println("ok");
			cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
			System.out.println("ok2");
	}catch(Exception e){System.out.println(e);}
	return cn;
	}
}
