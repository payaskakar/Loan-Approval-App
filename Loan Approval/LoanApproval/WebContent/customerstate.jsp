<header><jsp:include page="header.jsp"/></header>

<%@ page import="java.sql.*"%>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>
<%
String vpwd=request.getParameter("cpwd");
String cname=request.getParameter("cname");
%>

<html><body>


<form action="customerstate.jsp">
<input type="hidden" name="cpwd" value="<%=vpwd%>">
<input type="hidden" name="cname" value="<%=cname%>">
<table align="center" bgcolor="wheat">
<tr>
<td><font color="blue" size="3">Click On Status Button</font></td>
<td><input type="hidden" name ="email" value="<%=vpwd%>"></td>
<td><input type="submit" id="getstate" value="Get Status"></td>
</form><table border="3"></tr></table></body></html>
<html><body bgcolor="white"><table  align="center"border="3" bgcolor="wheat">
<tr><th>Customername</th><th>Status</th></tr>

<%
String vone=request.getParameter("email");
//out.print("Welcome,  "+vone);
try{if(vone.equals("null")){out.println("this is null");}
}catch(NullPointerException e){}
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select custname,STATE,EMAILID from customers where EMAILID='"+vone+"'";

ResultSet rs=stmt.executeQuery(vsql);
out.print("<b>Welcome,  </b>");
if(rs.next()){
	String b1=rs.getString("custname");
	String b2=rs.getString("state");
	String b3=rs.getString("EMAILID");
	
	
	%>
 <b> <%=b3%></b>
<tr><td><%=b1%></td>
   <td><b><font color="red"><%=b2%></font></td></tr></table>
<%}%>

<center><table><tr><td><a href="newcheck.jsp?lname=<%=cname%>&pwd=<%=vpwd%>&user=Cust&Login=Login">BACK</a></td></tr></table>
</body></html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>