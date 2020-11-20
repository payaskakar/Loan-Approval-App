<header><jsp:include page="header.jsp"/></header>

<html><body  align="center">
 <h4 align="center"><a href="main.jsp"> LOG OUT</a></h4></body></html>
<%@ page import="java.sql.*"%>
<%@ page contentType="text/html"%>



<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select * from dept";
ResultSet rs=stmt.executeQuery(vsql);
response.setContentType("text/html");
try{
out.print("<html><head><title>DEPARTMENTS</title>");%>
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
		x.action="depaddnew.jsp"
		alert("ThanQ for choosing for Addnew record")
		x.submit()
		}

}
</script>
</head>
<%
out.print("<body bgcolor=\"white\">");%>
<form id="myForm" action="depdel.jsp">

<%//out.print("<center><caption><font style=\"tahoma\" color=\"blue\"><b> 
//Departments Management</b></font></caption></center>");%>
<center><caption><font style="tahoma" color="blue"><b> 
Departments Management</b></font></caption></center>

<%
out.print("<table align=\"center\"bgcolor=\"wheat\" border=\"2\">");
out.println("<tr><th></th><th>DEPID</th><th>DEPTNAME</th></tr></center>");

while(rs.next())
{
int a1=rs.getInt(1);
String a2=rs.getString(2);

%>
</tr><td><input type="checkbox" value="<%=a1%>" name="check"></td>
<td><a href="/hello/depedit.jsp?bepid=<%=a1%>"\"><%=a1%></a></td>

<%out.print("<td>"+a2+"</td>");
%>

<td></td></tr>
<%
}
out.print("<tr><td colspan=\"6\" align=\"center\"><input   type=\"submit\" onclick=\"changeAction('addnew')\" name=\"addnew\" value=\"ADDNEW\">");
out.print("<input type=\"submit\" onclick=\"changeAction('del')\" name=\"del\"value=\"DELETE\"></td></tr>");
out.println("</table>");%>
<center><a href="adminnew.jsp">ADMIN</a></center>


<center><font color="blue"><b><ul><li>Click on The Bankid of Edit.<center></li></ul></b></font>
<%out.print("</form></body></html>");
}catch(SQLException e){out.println(e);}
%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>

