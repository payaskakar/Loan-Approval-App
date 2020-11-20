<header><jsp:include page="header.jsp"/></header>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%@ page import="java.sql.*"%>
<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement();
String vsql2="select * from customers where state='Pickup' and assignto=''";
ResultSet r=null;
 r=stmt.executeQuery(vsql2);	
System.out.println(vsql2);%>
<html><body bgcolor="white"><center><b><h4>NEW CUSTOMERS INFORMATION</h4></b></center>
<table align="center" bgcolor="wheat" border="2">
<tr><th><b>CustmerName</b></th></th><th><b>PhoneNo</b></th><th><b>Address</b></th><th><b>EmaiId</b></th><th><b>Occupation</b></th><th><b>Status</b></th></tr>
<tr>



<%while(r.next())
{%>

<td><a href="/hello/picked-cust.jsp?cust1=<%=r.getLong("CONTACTNO")%>"\">
<%=r.getString("CUSTNAME")%></a></td>
<td><%=r.getLong("contactno")%></td>
<td><%=r.getString("custaddress")%></td>
<td><%=r.getString("emailid")%></td>
<td><%=r.getString("occupation")%></td>
<td><%=r.getString("STATE")%></td>
</tr>

<%}
}catch(Exception e){out.println(e);}%>	

</table>
</body></html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>