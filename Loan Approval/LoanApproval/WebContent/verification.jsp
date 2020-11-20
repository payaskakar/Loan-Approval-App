<header><jsp:include page="header.jsp"/></header>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>
<%@ page import="java.sql.*"%>
<%String v=request.getParameter("cust1");
String ename=request.getParameter("empname");
String empno=request.getParameter("empno");
%>



<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select custname,emailid,contactno from customers where contactno="+v;
ResultSet rs=stmt.executeQuery(vsql);

out.print("<html><head><title>Customers Verification Form</title>");%>
<script type="text/javascript">

function createOrder()
{	
ags=document.forms[0].ags
if(ags[0].checked&&ags[1].checked&&ags[2].checked)
	{
	document.getElementById("dis").disabled=false
	}else{
	document.getElementById("dis").disabled=true
	}

}
function text()
{
ags=document.forms[0].ags
if(ags[0].checked&&ags[1].checked&&ags[2].checked)
	{
	
	document.getElementById("dis").disabled=false
	}else{
	document.getElementById("dis").disabled=true
	}

}

</script>
</head>
<%
out.print("<body bgcolor=\"white\">");
%> <form id="one" action="customers-verifi.jsp">


<center><b><H3>Welcome TO 
<%
if(rs.next())
{
	String b1=rs.getString("custname");
	System.out.println(b1);
	 
	String b3=rs.getString(2);
	System.out.println(b3);

	long b2=rs.getLong(3);
System.out.println(b2);
%>
<%=b1%>  (<%=b3%>)

	<input type="hidden" name="cust" value="<%=b1%>">
	<input type="hidden" name="mail" value="<%=b3%>">
	<input type="hidden" name="phone" value="<%=b2%>">
<%}%>
VerificationForm</B></H3>

<br><br>
<TABLE align="center" border="1">
<tr>
	<td><input type="checkbox" onclick="if(this.checked){createOrder()}" name="ags" value="yes"></td>
	<td><b>AddressProof</td>
</tr>


<tr>
	<td><input type="checkbox" onclick="if(this.checked){createOrder()}" name="ags" value="yes"></td>
	<td><b>Company Details</td>
</tr>



<tr>
	<td><input type="checkbox" onclick="if(this.checked){createOrder()}" name="ags" value="yes"   ></td>
	<td><b>PersonelEnquiry</td>
</tr>


<tr>
	<td colspan="2" align="center"><input type="submit" onclick="text()" id="dis" disabled="true" value="submit">
	<a href="newcheck.jsp?lname=<%=ename%>&pwd=<%=empno%>&user=Verification&Login=Login">BACK</a></td></td>
	
</tr>
</table>
<input type="hidden" name="ename" value="<%=ename%>">
<input type="hidden" name="empno" value="<%=empno%>">
	
</form>
</body>
</html>




<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>



