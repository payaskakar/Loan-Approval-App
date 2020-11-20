<header><jsp:include page="header.jsp"/></header>
<html><BODY><h5 align="center"><br><a href="main.jsp">LOGOUT</a></h5></BODY></html>


<%String vone =request.getParameter("cust2");%>
<%@ page import="java.sql.*"%>
<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();


String vsql3="select * from customers where contactno="+vone;

ResultSet rs1=null;
rs1=stmt.executeQuery(vsql3);

%>
<html><body bgcolor="white"><center><b><h4>VERIFICATIONOVERED CUSTOMERS INFORMATION</h4></b></center>
<form action="custfinal.jsp">
<table align="center" bgcolor="wheat" border="2">


<tr>
<%if(rs1.next())
{
	String a1=rs1.getString("CUSTNAME");
	String a2=rs1.getString("custaddress");
	String a3=rs1.getString("occupation");
	String a4=rs1.getString("CONTACTNO");
	String a5=rs1.getString("STATE");
	String a6=rs1.getString("emailid");
	
	%>




<tr><td><b>CustmerName</b></td><td><%=a1%></td></tr>
<tr><td><b>ContactNo</b></td><td><%=a4%></td></tr>
<tr><td><b>CustAddress</b></td><td><%=a2%></td></tr>
<tr><td><b>EmailId</b></td><td><%=a6%></td></tr>
<tr><td><b>Occupation</b></td><td><%=a3%></td></tr>
<tr><td><b>status</b></td><td><%=a5%></td></tr>
<input type="hidden" name="cusname" value="<%=a1%>">
</tr>

<%}
String vsql4="SELECT APFNO,BUILDERNAME FROM BUILDERS_DETAILS WHERE REASON='noreason'";
ResultSet rs2=null;
rs2=stmt.executeQuery(vsql4);%>
<tr><td><b>BuilderName</td><td><select name="buil">
<%while(rs2.next()){%>
<option><%=rs2.getString("BUILDERNAME")%>
<%}%>
</select></td></tr>
<tr><td><b>Status</td><td><select name="sant"><option >Sanction<option>Reject</FONTW></select></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="submit"><b><a href="vover.jsp">BACK</b></a></td></tr>

</table>




</form>
</body></html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>