
<header><jsp:include page="header.jsp"/></header>


<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>
 <html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="repors.jsp"> BACK</a></h4></font></body></html>
<%@ page import="java.sql.*"%>
<HTML><body bgcolor="white">
<center><b>Bank Wise Files Sanctioned B/W Two Dates<b></center>
<form action ="Banksanctioned.jsp">
<table border="2"bgcolor="wheat" align="center">
<tr><td>From</td><td><input type="text" name="fdate"><font size="2" color="red">ex:01-sep-07</font></td></tr>
<tr><td>To</td><td><input type="text" name="fto"><font size="2" color="red">ex:20-sep-07</font></td></tr>
<tr><td>Banks</td><td><select name="banks">
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
String vsql="select BANKNAME from banks";
ResultSet rs=stmt.executeQuery(vsql);
while(rs.next()){%>

<option><%=rs.getString("BANKNAME")%>
<%}%>
</td></tr>
<tr><td colspan="4" align="center"><input type="submit" value="GetFiles"></td></tr>
</form></table>
</body></html>

<%
try{ 
String vbank=request.getParameter("banks");
String vthr=request.getParameter("fdate");
String vfor=request.getParameter("fto");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt1=con1.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);


String vsql1="select bankname,custname,state from  customers where bankname='"+vbank+"'and state='Sanction' and cdate between '"+vthr+"' and '"+vfor+"'";



ResultSet rs1=stmt1.executeQuery(vsql1);%>
<html><body bgcolor="white">
<table bgcolor="wheat" border="2">
<tr><th>Bankname</th><th>Custname</th><th>State</th></tr>
<%
while(rs1.next()){%>
    


<tr><td><%=rs1.getString("bankname")%></td>
<td><%=rs1.getString("custname")%></td>
<td><%=rs1.getString("state")%></td>
<%}
}catch(Exception e){out.println();}%>

</body></html>


<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
