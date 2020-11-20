<header><jsp:include page="header.jsp"/></header>


<html><body><h5 align="center"><a href="main.jsp">LOGOUT</a></h5></body></html>
<%@ page import="java.sql.*"%>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();



String vsql3="select * from customers where state='Verificationover'";

ResultSet rs1=null;
rs1=stmt.executeQuery(vsql3);
System.out.println("--"+vsql3);
%>
<html><body bgcolor="white"><center><b><h4><font size="4" color="blue">NEW CUSTOMERS INFORMATION</h4></b></font></center><br><br>
<table align="center" bgcolor="wheat" border="2">
<tr><th><b>CustmerName</b></th><th><b>ContactNo</b></th><th><b>CustAddress</b></th><th><b>Emailid</b></th><th><b>Occupation</b></th><th><b>State</b></th></tr>
<tr>
<%while(rs1.next())
{
	String a1=rs1.getString("CUSTNAME");
	String a2=rs1.getString("custaddress");
	String a3=rs1.getString("occupation");
	String a4=rs1.getString("CONTACTNO");
	String a5=rs1.getString("STATE");
	String a6=rs1.getString("emailid");
	%>




<td><a href="/hello/adverify.jsp?cust2=<%=a4%>"\">
<%=a1%></a></td>
<td><%=a4%></td>
<td><%=a2%></td>
<td><%=a6%></td>
<td><%=a3%></td>
<td><%=a5%></td>
</tr>

<%}%>
</table>
<h5 align="center"><a href="adminnew.jsp">ADMIN</a></h5>
</body></html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>