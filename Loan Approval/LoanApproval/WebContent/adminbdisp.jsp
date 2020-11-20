<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>
<%@ page import="java.sql.*"%>



<% 
String vs=request.getParameter("bank");
//String vs1=request.getParameter("bank1");
System.out.println("Bank vs "+vs);
//System.out.println("Bank1 vs1 "+vs1);

try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");



Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
String vsql="select * from  bank_loans where bankname='"+vs+"'";
ResultSet rs=stmt.executeQuery(vsql);%>

<html><head><script type="text/javascript">
function changeAction(txt)
{
var t=txt
	if(t=="del")
	{
	alert("You have clicked Delete Option")
	document.getElementById("myForm").submit()
	}else
		{
		var x=document.getElementById("myForm")
		x.action="adminddloan.jsp"
		alert("ThanQ for choosing for Addnew record")
		x.submit()
		}

}
</script>
</head>
<body bgcolor="white"><br><br><br>

	<form action="admindel.jsp" id="myForm">
 
<CENTER><FONT SIZE="4" COLOR="BLUE"><b>BANKSWISE LOAN INFORMATION</font></CENTER><br><br>
<table align="center" bgcolor="wheat" border="2">

<tr><TH></TH><th>BANKNAME</th><th>LOANTYPE</th><th>INTERESTRAT</th></tr>
<%while(rs.next()){%>
<TR><td><input type="checkbox" value="<%=rs.getInt("LOANID")%>" name="check"></td>
<td><a href="/hello/adminloaedit.jsp?bepid=<%=rs.getInt("LOANID")%>&bepid1=<%=rs.getString("BANKNAME")%>"\"><%=rs.getString(1)%></a></td>

 
<td><%=rs.getString(2)%></td>
<td><%=rs.getDouble(3)%></td> 

<%}%><%}catch(Exception e){out.println("error is "+e);}%></tr>
<%out.print("<tr><td colspan=\"8\" align=\"center\"><input   type=\"submit\" onclick=\"changeAction('addnew')\" name=\"addnew\" value=\"ADDNEW\">");
out.print("<input type=\"submit\" onclick=\"changeAction('del')\" name=\"del\"value=\"DELETE\"></TD></tr>");

out.println("</table>");%>
<CENTER><a href="adminnew.jsp">ADMIN</a><BR><a href="adminloan.jsp">BACK</a></center>
<tr></tr>

</table>
<input type="hidden" name="bank" value="<%=vs%>">
</form>
</body>
</html>	


<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>











