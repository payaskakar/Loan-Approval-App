<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%@ page import="java.sql.*"%>
<html><body bgcolor="white">
<center><b>List Of Pending Application</b></center><br>
<table bgcolor="wheat" align="center"border="2">
                                              
<tr><th>Customers</th><th>Status</th></tr>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select state,custname from customers where state!='Sanction' and state!='Rject'";
ResultSet rs=stmt.executeQuery(vsql);
while(rs.next()){%>
<tr><td><%=rs.getString("CUSTNAME")%></td>
<td align="center"><font color="red"><b><%=rs.getString("STATE")%></td></tr>

<%}%></table>
</body></html>
<html><body><center><a href="adminnew.jsp"><b>ADMIN</b><br></a><a href="repors.jsp"><b>BACK<b></a></center>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>