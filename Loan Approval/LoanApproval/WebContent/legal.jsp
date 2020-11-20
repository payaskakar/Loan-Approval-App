<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%@ page import="java.sql.*"%>
<%
System.out.println("@@@@@@@@@@@@");
System.out.println("&&&&&&&&&&&&");
String ename1=request.getParameter("empname");
System.out.println(ename1);
String empno1=request.getParameter("empno");
System.out.println(empno1);
session.setAttribute("ename1",ename1);
session.setAttribute("empno1",empno1);
%>


<html>
<head>
<script type="text/javascript">
function changeAction(txt)
{
var t=txt
	if(t=="add")
	{
	alert("ThanQ for choosing for Addnew record")
	document.getElementById("myForm").submit()
	}else
		{
		var x=document.getElementById("myForm")
		x.action="builderdel.jsp"
		alert("You have clicked Delete Option")
		x.submit()
		}

}
</script>
</head>
<body bgcolor="white">
<form id="myForm" action="builderadd.jsp">
<b><h4 align="center">BuildersInformationForm <b></h4>
<table bgcolor="wheat" align="center" border="2">
<tr><td></td>
<td align="center"><b>BuilderName</td>
<td align="center"><b>Office Address</td>
<td align="center"><b>RegNo</td>
<td align="center"><b>PanNo</td>
<td align="center"><b>Phone</td>
<td align="center"><b>Email</td>
<td align="center"><b>WebSite</td>

</tr>
<tr>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement();

String vsql5="select * from builders_details where reason='NewBuilder'";
ResultSet rs2=null;
rs2=stmt.executeQuery(vsql5);
while(rs2.next())
{
	String a1=rs2.getString("BUILDERNAME");
	String a2=rs2.getString("OFFICEADDRESS");
	int a3=rs2.getInt("REGNO");

	%>
<td><input type="checkbox" value="<%=a3%>" name="check"></td>
<td><a href="/hello/builders.jsp?cust3=<%=a3%>&ename=<%=ename1%>&empno=<%=empno1%>"\">
<%=a1%></a></td>
<td><%=a2%></td>
<td><%=a3%></td>
<td><%=rs2.getString("PANNUMBER")%></td>
<td><%=rs2.getInt("PHONE")%></td>
<td><%=rs2.getString("EMAIL")%></td>
<td><%=rs2.getString("WEBSITE")%></td>
</tr><%}%><tr><td colspan="24" align="center">
<input type="submit" onclick="changeAction('add')" name="add" value="AddNew">
<input type="submit" onclick="changeAction('del')" name="del" value="Delete"></td></tr>
</table>

<input type="hidden" name="ename" value="<%=ename1%>">
<input type="hidden" name="empno" value="<%=empno1%>">

</form>
</body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
