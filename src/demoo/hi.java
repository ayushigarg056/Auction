package demoo;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/test2")
public class hi extends HttpServlet
{
java.io.PrintWriter out1;
public void service(HttpServletRequest 

req,HttpServletResponse res)
{try
{
res.setContentType("text/html");
out1=res.getWriter();
//out1.println("ayushi");

String a4=req.getParameter("t1");
String a3=req.getParameter("t2");
int a1=Integer.parseInt(a3);
int a2=Integer.parseInt(a4);

out1.println(a1+a2);

}
catch(Exception e)
{
System.out.println(e);
}

}
}