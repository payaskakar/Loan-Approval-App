<header><jsp:include page="header.jsp"/></header>
<%@ page import="java.sql.*"%>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>


<html>
<head></head>
<body bgcolor="white">
<form  id="myForm"action="msgdelete.jsp">


<b><font  color="blue" size="5"><center>Messages From Customers</center></font> 


<br><br><font color="white" size="3"></b>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement();
%>
<html>

<head>
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
		x.action="admincompose.jsp"
		alert("ThanQ for choosing for compose")
		x.submit()
		}

}
</script>
</head></head>
<body bgcolor="white">
<table align="center" border="2" bgcolor="wheat">
<tr><th></th><th>From</th><th>To</th><th>Subject</th><th>Date</th></tr>

<%try{
String vsqlad="select * from messages  where to1='admin'order by cdate Desc";
System.out.println(vsqlad);
ResultSet rs=stmt.executeQuery(vsqlad);
while(rs.next()){
	int a1=rs.getInt("MSGID");
	String a2=rs.getString("from1");
	String a3=rs.getString("to1");
	
	%>
<tr><td><input type="checkbox" name="check" value="<%=a1%>">


</td>
<td><%=a2%></td>
<td><%=a3%></td>

<td><a href="/hello/adminreadmessage.jsp?bepid=<%=a1%>"\"><%=rs.getString("msgsubject")%></a></td>

<td><%=rs.getDate("cdate")%></td>
<input type="hidden" name="to2" value="<%=a3%>">
</tr>
<%}}catch(Exception e){out.println(e+"this is exception");}

out.print("<tr><td colspan=\"6\" align=\"center\"><input   type=\"submit\" onclick=\"changeAction('addnew')\" name=\"addnew\" value=\"Compose\">");
%>

<%
out.print("<input type=\"submit\" onclick=\"changeAction('del')\" name=\"del\"value=\"DELETE\"></td></tr>");
%>

</table>
<center><a href="adminnew.jsp"><b>ADMIN<b></a></center>
</body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
