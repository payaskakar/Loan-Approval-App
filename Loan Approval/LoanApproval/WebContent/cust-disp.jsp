
<header><jsp:include page="header.jsp"/></header>

<%@ page import="java.sql.*"%>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>


<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select * from customers where state='new'";
ResultSet rs=stmt.executeQuery(vsql);
out.print("<html><head><title>CustomersForm</title><head>");

out.print("<body bgcolor=\"white\">");
out.print("<center><caption><font style=\"tahoma\" color=\"blue\" size=\"5\"><b>CustomersForm</b></font></caption><center><br>");
out.print("<table  align=\"center\"bgcolor=\"wheat\" border=\"2\">");

out.print("<tr><th>CustumerName</th><th>Address</th><th>EmailId</th><th>Qualification</th><th>Occupation</th><th>Company/Business</th><th>Address</th><th>Contactno</th><th>Salary</th><th>Designation</th><th>Gender</th><th>email address</th></tr>");
 
while(rs.next())
{
	
	
	String a1=rs.getString(1);
	String a2=rs.getString(2);
	String a3=rs.getString(13);
	String a4=rs.getString(3);
	String a5=rs.getString(4);
	String a6=rs.getString(5);
	String a7=rs.getString(6);
	String a8=rs.getString(7);
	String a9=rs.getString(8);
	String a10=rs.getString(9);
	String a11=rs.getString(10);
	String a12=rs.getString(13);
	String a13=rs.getString(11);
	
	
	//System.out.println(a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12+a13+a14+a15+a16+a17);
%>
<td><a href="/hello/cut-state.jsp?cust=<%=a8%>&&contactno=<%=a8%>"><%=a1%></a></td>
<%
//out.print("<tr><td>"+a1+"</td>");
out.print("<td>"+a2+"</td>");
out.print("<td>"+a3+"</td>");
out.print("<td>"+a4+"</td>");
out.print("<td>"+a5+"</td>");
out.print("<td>"+a6+"</td>");
out.print("<td>"+a7+"</td>");
out.print("<td>"+a8+"</td>");
out.print("<td>"+a9+"</td>");
out.print("<td>"+a10+"</td>");
out.print("<td>"+a11+"</td>");
out.print("<td>"+a12+"</td></tr>");

}
}
catch(SQLException e)
{
System.out.println(e);	
}
out.println("</table>");
out.println("</body>");
out.println("</html>");
%>
<html><body><center><a href="adminnew.jsp">ADMIN</a></center></body></html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>

