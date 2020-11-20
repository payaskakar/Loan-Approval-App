<header><jsp:include page="header.jsp"/></header>

<html><body  align="center">
 <font color="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%@ page import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select * from  emp";
ResultSet rs=stmt.executeQuery(vsql);
response.setContentType("text/html");
try{
out.print("<html><head><title>EmployeesInformations</title>");%>
<script type="text/javascript">
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
		x.action="empaddnew1.jsp"
		alert("ThanQ for choosing for Addnew record")
		x.submit()
		}

}
</script>
</head>
<%
out.print("<body bgcolor=\"white\">");%>
<form id="myForm" action="empdel.jsp">
<%
out.print("<center><caption><font style=\"tahoma\" color=\"blue\" SIZE=\"4\"><b>EmployeesInformations</b></font></caption><center>");
out.print("<table align=\"center\"bgcolor=\"wheat\" border=\"2\">");
out.println("<tr><th></th><th>EMPID</th><th>EMPNAME</th><th>DESIG</th><th>DEPT</th><th>ADDRESS</th><th>PHNO</th><th>EMAIL</th></tr>");
while(rs.next())
{
	int a1=rs.getInt(1);
	String a2=rs.getString(2);
	String a3=rs.getString(3);
	String a4=rs.getString(4);
	String a5=rs.getString(5);
	String a6=rs.getString(6);
	String a7=rs.getString(7);
%>
</tr><td><input type="checkbox" value="<%=a1%>" name="check"></td>
<td><a href="/hello/empedit.jsp?bepid=<%=a1%>"\"><%=a1%></a></td>
<%out.print("<td>"+a2+"</td>");
out.print("<td>"+a3+"</td>");
out.print("<td>"+a4+"</td>");
out.print("<td>"+a5+"</td>");
out.print("<td>"+a6+"</td>");
out.print("<td>"+a7+"</td>");
%>

</tr>
<%
}
out.print("<tr><td colspan=\"8\" align=\"center\"><input   type=\"submit\" onclick=\"changeAction('addnew')\" name=\"addnew\" value=\"ADDNEW\">");
out.print("<input type=\"submit\" onclick=\"changeAction('del')\" name=\"del\"value=\"DELETE\"></td></tr>");
out.println("</table>");%>
<a href="adminnew.jsp">ADMIN</a></center>
<font color="blue"><b><ul><li>Click on The Empid for Edit.</li></ul></b></font>

<%out.print("</form></body></html>");
}catch(SQLException e){out.println("Error is---"+e);}
%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>

	