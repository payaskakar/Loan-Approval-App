<header><jsp:include page="header.jsp"/></header>

<html>
<%@ page import="java.sql.*"%>

<%String vone=request.getParameter("to2");
%>
<%@ page import="java.sql.*"%>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>


<HTML><body bgcolor="white"> 
<center><b><font color="blue" size="4">Compose Messages TO Customers</b></font>
<form action="adminsendmess.jsp">
<table align="center" border="2"bgcolor="wheat">
<tr><td><b><font size="4"color="red"><i>T</i></font>o:</b></td><td><select name="mails">
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
String vsql1="select emailid from  customers";
ResultSet rs1=stmt.executeQuery(vsql1);
while(rs1.next())
{
	
%>
<option><%=rs1.getString("emailid")%>
<%}%></select>
</td></tr>
<tr><td><b><font size="4"color="red"><i>F</i></font>rom:</b></td><td>Admin</td></tr>

<tr><td><b><font size="4"color="red"><i>S</i></font>ubject:</b></td><td><input type="text" name="sub"></td></tr>
<tr><td><b><font size="4" color="red"><i>M</i></font>essage:</b></td><td><textarea rows="5" cols="20" name="mess"></textarea> </td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="send"><a href="adminmessage.jsp"><b>BACK</b></a></center></td></tr>
<input type="hidden" name="to2" value="<%=vone%>">

</table>
</form>
</body>
</html></hmtl>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>