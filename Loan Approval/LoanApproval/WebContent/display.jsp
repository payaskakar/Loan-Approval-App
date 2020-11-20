<header><jsp:include page="header.jsp"/></header>

<%@ page contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select * from cinf";
ResultSet rs=stmt.executeQuery(vsql);
out.print("<html><head><title>CustomersDetails</title><head>");

out.print("<body bgcolor=\"white\">");
out.print("<center><caption><font style=\"tahoma\" color=\"blue\"><b>CustomersDetails</b></font></caption><center>");
out.print("<table size=\"100%\" align=\"center\"bgcolor=\"wheat\" border=\"2\">");
out.print("<tr><th>CustumerName</th><th>Gender</th><th>Address</th><th>City</th><th>Type of A/c</th></tr>");
while(rs.next())
{
out.print("<tr><td>"+rs.getString("CNAME")+"</td>");
out.print("<td>"+rs.getString("SEX")+"</td>");
out.print("<td>"+rs.getString("ADDR")+"</td>");
out.print("<td>"+rs.getString("CITY")+"</td>");
out.print("<td>"+rs.getString("TAC")+"</td></tr>");
}
out.println("</table>");
out.println("</dody>");

out.println("</html>");
%>
<%
out.print("<tr><td><a href=\"cust.jsp\">Click here to open account</a></td></tr>");
out.println("<br>");
out.print("<tr><td><a href=\"main.jsp\">Main menu</a></td></tr>");
%>

 <div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
 

 


