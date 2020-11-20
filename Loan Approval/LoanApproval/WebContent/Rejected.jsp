<header><jsp:include page="header.jsp"/></header>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%@ page import="java.sql.*"%>
<html><body bgcolor="white">
<center><b>List Of Rejected Application</b></center><br>
<table bgcolor="wheat" align="center"border="2">
                                              
<tr><th>Customers</th><th>State</th><th>RejectedDate</th></tr>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement();
String vsql="select state,custname,sanctioneddate,buildername from customers where state='Reject'";
ResultSet rs=stmt.executeQuery(vsql);
while(rs.next()){%>
<tr><td><b><font color="blue"><%=rs.getString("CUSTNAME")%></font></td>
<td><%=rs.getString("STATE")%></td>
<%java.util.Date z=rs.getDate("SANCTIONEDDATE");%>
<td><b><font color="blue"><%=z%></font></td>
</tr>
<%}%></table>
</body></html>


<html><body><center><a href="adminnew.jsp"><b>ADMIN<b></a><br>
<a href="repors.jsp"><b>BACK<b></a></center>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>