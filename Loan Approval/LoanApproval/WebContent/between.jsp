
<header><jsp:include page="header.jsp"/></header>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>
<HTML><body bgcolor="white">
<center><b>List No Of Files Sanctioned B/W Two Dates<b></center>
<form action ="between.jsp">
<table border="2"bgcolor="wheat" align="center">
<tr><td>From</td><td><input type="text" name="fdate"><font size="2" color="blue">ex:2010-01-10</font></td></tr>
<tr><td>To</td><td><input type="text" name="fto"><font size="2" color="blue">ex:2010-01-30</font></td></tr>
<tr><td colspan="4" align="center"><input type="submit" value="GetFiles"></td></tr>
</form></table>
<html><body><center><a href="adminnew.jsp">ADMIN</a><br>
<a href="repors.jsp"><b>BACK<b></a></center>
</body></html>




<%@ page import="java.sql.*"%>
<%try{
try{
String vone=request.getParameter("fdate");
System.out.println(vone);
String vtwo=request.getParameter("fto");
System.out.println(vtwo);
String vthr="null";
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement();
String vsql="select state,custname,cdate from customers where state='Sanction' and SANCTIONEDDATE between '"+vone+"' and '"+vtwo+"'";
System.out.println(vsql);
ResultSet rs=stmt.executeQuery(vsql);
System.out.println("############");
%>
<html><body>
<br><br><br><table bgcolor="wheat" align="center"border="2"></body>
<tr><th>CustomerName</th><th>State</th><th align="center">SanctionedDate(y/d/m)</th></tr>
<%
while(rs.next())
{
	System.out.println("*****");
	String a2=rs.getString("state");
	System.out.println(a2);
	String a1=rs.getString("custname");
	System.out.println(a1);
	
out.print("<tr><td>"+a1+"</td>");
java.util.Date z=rs.getDate("cdate");
System.out.println(z);
%>
<td><b><font color="blue"><%=a2%></td>
<td align="center"><b><font color="blue"><%=z%></td>
</tr></font>
<%}
}catch(Exception e1){}
}catch(NullPointerException e)
{out.println();}

%>
</table></body></html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>

