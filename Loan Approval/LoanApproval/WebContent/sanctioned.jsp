<header><jsp:include page="header.jsp"/></header>
<%@ page import="java.sql.*"%>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>



<body bgcolor="white"><form method="post" action="sanctioned.jsp">





<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
String vsql="select empname from emp where dept='PickUp'";
//String vsqll="select empname from emp where dept='Verification'";

ResultSet rs=stmt.executeQuery(vsql);
%>
<center><b>List Of Files Sanctioned(Business Excutives Wise)</b><center>
<table align="center"bgcolor="wheat">

<tr><td><select id="emp" name="ename">
<%while(rs.next()){%>
<option><%=rs.getString("empname")%><%}%>
</select></td>
<td><input type="submit" name="sub" value="GetFiles" onClick="getInfo()"></td></tr>
</table>
</form>
</body>
</html>

<%
String vone=request.getParameter("ename");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt1=con1.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);

String vsql2="select custname,state,assignto,sanctioneddate,cdate from customers where assignto='"+vone+"' and state='Sanction'";
//ResultSet rs1="null";
ResultSet rs1=stmt1.executeQuery(vsql2);%>
<html><body bgcolor="white">
<table align="center"bgcolor="wheat" border="2">
<tr><th>CustomerName</th><th>State</th><th>Date Of Customer Entered (yy/mm/dd)</th><th>Date Of Sanctioned (yy/mm/dd)</th><th>Assignto</th></tr>
<%while(rs1.next()){%>

<tr><td><%=rs1.getString("custname")%></td>
<td><%=rs1.getString("state")%></td>
<% java.sql.Date y=rs1.getDate("cdate");%>
<td align="center"><font color="blue"><b><%=y%></font></td>
<% java.util.Date z=rs1.getDate("sanctioneddate");%>
<font color="blue"><td align="center"><font color="blue"><b><%=z%></font></td>
<td align="center"><b><%=rs1.getString("assignto")%>

<%}%></td>
</tr></table></body>
</html>
 <html><body><center><a href="adminnew.jsp"><b>ADMIN</a>
<a href="repors.jsp"><b>BACK</a></center>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>