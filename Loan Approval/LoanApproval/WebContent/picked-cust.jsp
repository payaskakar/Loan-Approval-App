<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>
<%@ page import="java.sql.*"%>
<%
String v=request.getParameter("cust1");
String ename=request.getParameter("empname");
String empno=request.getParameter("empno");
%>





<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select custname,emailid from customers where contactno="+v;
ResultSet rs=stmt.executeQuery(vsql);

out.print("<html><head><title>CustomersForm</title>");%>
<script type="text/javascript">

function createOrder()
{	
ags=document.forms[0].ags
if(ags[0].checked&&ags[1].checked&&ags[2].checked&&ags[3].checked&&ags[4].checked&&ags[5].checked&&ags[6].checked&&ags[7].checked)
	{
	document.getElementById("dis").disabled=true
	}else{
	document.getElementById("dis").disabled=false
	}

}
function text()
{
ags=document.forms[0].ags
if(ags[0].checked&&ags[1].checked&&ags[2].checked&&ags[3].checked&&ags[4].checked&&ags[5].checked&&ags[6].checked&&ags[7].checked)
	{
	
	document.getElementById("dis").disabled=true
	}else{
	document.getElementById("dis").disabled=false
	}

}

</script>
</head>
<%
out.print("<body bgcolor=\"white\">");
%> <form id="one" action="customers-loans.jsp">


<center><b><H3>Welcome TO 
<%
if(rs.next())
{
	String a1=rs.getString("custname");
	String a2=rs.getString("emailid");
%>
<%=a1%>  (<%=a2%>)

	<input type="hidden" name="cust" value="<%=a1%>">
	<input type="hidden" name="mail" value="<%=a2%>">
<%}%>
Information</B></H3>

<br><br>
<TABLE size="" align="center" bgcolor="white"   border="1">
<tr>
	<td><input type="checkbox" onclick="if(this.checked){createOrder()}" name="ags" value="yes"></td>
	<td><b>Agreement Of sale</td>
</tr>


<tr>
	<td><input type="checkbox" onclick="if(this.checked){createOrder()}" name="ags" value="yes"></td>
	<td><b>WorkOrder</td>
</tr>




<tr>
	<td><input type="checkbox" onclick="if(this.checked){createOrder()}" name="ags" value="yes"></td>
	<td><b>3 Months Payslips</td>
</tr>



<tr>
	<td><input type="checkbox" onclick="if(this.checked){createOrder()}" name="ags" value="yes"></td>
	<td><b>Offer Letter</td>
</tr>


<tr>
	<td><input type="checkbox" onclick="if(this.checked){createOrder()}" name="ags" value="yes"></td>
	<td><b>AddressProof</td>
</tr>


<tr>
	<td><input type="checkbox" onclick="if(this.checked){createOrder()}" name="ags" value="yes"></td>
	<td><b>PhotoIdentity</td>
</tr>

<tr>
	<td><input type="checkbox" onclick="if(this.checked){createOrder()}" name="ags" value="yes"></td>
	<td><b>I.T.Returns</td>
</tr>

<tr>
	<td><input type="checkbox" onclick="if(this.checked){createOrder()}" name="ags" value="yes"   ></td>
	<td><b>PAN Card</td>
</tr>


<tr>
	<td colspan="2" align="center"><input type="submit" onclick= "text()" id="dis" disabled="false" value="submit"/>
	<a href="newcheck.jsp?lname=<%=ename%>&pwd=<%=empno%>&user=PickUp&Login=Login">BACK</a></td>
	
</tr>
</table>
<center>
	<input type="hidden" name="ename" value="<%=ename%>">
	<input type="hidden" name="empno" value="<%=empno%>">
</form>
</body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
