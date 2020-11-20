<header><jsp:include page="header.jsp"/></header>
<%@ page import="java.sql.*"%>

<%
try{

String vlname=request.getParameter("lname");
String vpwd=request.getParameter("pwd");
String user=request.getParameter("user");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String userAdmin="Admin";
if(user.equals(userAdmin))
{
String vsqlad="select * from "+user+"";
System.out.println(vsqlad);
ResultSet rs=stmt.executeQuery(vsqlad);
rs.next();
String alname=rs.getString("lname");
String apwd=rs.getString("pwd");
System.out.println("vlname--"+vlname);
System.out.println("vpwd--"+vpwd);
if(vlname.equals(alname)&&vpwd.equals(apwd)){

System.out.println("---i am in if ---");
RequestDispatcher rd=application.getRequestDispatcher("/adminnew.jsp");
rd.forward(request,response);




} else{
%>
<html><br><br><br><center><h3><i><font color="black">Invalid user name passward</font></i></h3>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body></html>
<%
}
}//------------------Admin








if(user.equals("Cust"))
{
String vsqlad="select * from CUSTOMERS where emailid='"+vpwd+"'";
System.out.println(vsqlad);
ResultSet rs=stmt.executeQuery(vsqlad);
rs.next();
String alname=rs.getString("CUSTNAME");
String apwd=rs.getString("EMAILID");
System.out.println("database--"+alname);
System.out.println("-database-"+apwd);
if(vlname.equals(alname)&&vpwd.equals(apwd)){%>
//cpwd=<%=vpwd%>

<%
RequestDispatcher rd1=application.getRequestDispatcher("/cmgmt.jsp?cpwd="+vpwd+"&vapwd="+apwd+"&avlname="+vlname);
rd1.forward(request,response);

}else {%>
<html><br><br><br><center><h3><i><font color="black">Invalid user name passward</font></i></h3>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body></html>
<%

}

}

//out.println("----------------------------------------------------------");






//from starting of pickup and verification


if(user.equals("PickUp")){

String vsql1="select empname,phone,dept from emp where empname='"+vlname+"' and phone="+vpwd+"";
ResultSet rs=stmt.executeQuery(vsql1);
rs.next();
String vempname=rs.getString("EMPNAME");
String vphone=rs.getString("PHONE");
String vdept=rs.getString("dept");




if(vlname.equals(vempname)&&vpwd.equals(vphone)&&user.equals(vdept)){

String vsql2="select * from customers where state='Pickup' and assignto='"+vlname+"'";
ResultSet r=null;
 r=stmt.executeQuery(vsql2);	
System.out.println(vsql2);%>
<html><body bgcolor="white"><center><b><h4>NEW CUSTOMERS INFORMATION</h4></b></center>
<table align="center" bgcolor="wheat" border="2">
<tr><th><b>CustmerName</b></th></th><th><b>PhoneNo</b></th><th><b>Address</b></th><th><b>EmaiId</b></th><th><b>Occupation</b></th><th><b>Status</b></th></tr>
<tr>


<%while(r.next())
{%>

<td><a href="/hello/picked-cust.jsp?cust1=<%=r.getLong("CONTACTNO")%>"\">
<%=r.getString("CUSTNAME")%></a></td>
<td><%=r.getLong("contactno")%></td>
<td><%=r.getString("custaddress")%></td>
<td><%=r.getString("emailid")%></td>
<td><%=r.getString("occupation")%></td>
<td><%=r.getString("STATE")%></td>
</tr>

<%}%>	

</table>
</body></html>
<%}//password if
else{
%>
<html><br><br><br><center><h3><i><font color="black">Invalid user name passward</font></i></h3>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body></html>
<%
}//else
}//pickup checking







 if(user.equals("Verification"))
{
String vsql1="select empname,phone,dept from emp where empname='"+vlname+"' and phone="+vpwd+"";
ResultSet rs=stmt.executeQuery(vsql1);
rs.next();
String vempname=rs.getString("EMPNAME");
String vphone=rs.getString("PHONE");
String vdept=rs.getString("dept");

if(vlname.equals(vempname)&&vpwd.equals(vphone)&&user.equals(vdept)){


String vsql3="select * from customers where state='"+user+"'";

ResultSet rs1=null;
rs1=stmt.executeQuery(vsql3);
System.out.println("--"+vsql3);
%>
<html><body bgcolor="white"><center><b><h4>NEW CUSTOMERS INFORMATION</h4></b></center>
<table align="center" bgcolor="wheat" border="2">
<tr><th><b>CustmerName</b></th><th><b>ContactNo</b></th><th><b>CustAddress</b></th><th><b>Emailid</b></th><th><b>Occupation</b></th><th><b>State</b></th></tr>
<tr>
<%while(rs1.next())
{%>




<td><a href="/hello/verification.jsp?cust1=<%=rs1.getLong("CONTACTNO")%>"\">
<%=rs1.getString("CUSTNAME")%></a></td>
<td><%=rs1.getLong("contactno")%></td>
<td><%=rs1.getString("custaddress")%></td>
<td><%=rs1.getString("emailid")%></td>
<td><%=rs1.getString("occupation")%></td>
<td><%=rs1.getString("STATE")%></td>
</tr>

<%//out.println(rs1.getString("assignto"));
//out.println(rs1.getString("CUSTNAME"));
//out.println("Welcome To Legal");%>

<%}%>
</table>
</body></html>
<%
}//password checking if
else{
%>
<html><br><br><br><center><h3><i><font color="black">Invalid user name passward</font></i></h3>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body></html>
<%}//else
}//verification if
////////////////////////////////////////
if(user.equals("Legal")){

String vsql1="select empname,phone,dept from emp where empname='"+vlname+"' and phone="+vpwd+"";
ResultSet rs=stmt.executeQuery(vsql1);
rs.next();
String vempname=rs.getString("EMPNAME");
String vphone=rs.getString("PHONE");
String vdept=rs.getString("dept");

if(vlname.equals(vempname)&&vpwd.equals(vphone)&&user.equals(vdept)){
%><html>
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
<body bgcolor="white"><form id="myForm" action="builderadd.jsp">
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
String vsql5="select * from builders_details where reason='NewBuilder'";
ResultSet rs2=null;
rs2=stmt.executeQuery(vsql5);
while(rs2.next())
{%>
<td><input type="checkbox" value="<%=rs2.getLong("REGNO")%>" name="check"></td>
<td><a href="/hello/builders.jsp?cust3=<%=rs2.getString("REGNO")%>"\">
<%=rs2.getString("BUILDERNAME")%></a></td>
<td><%=rs2.getString("OFFICEADDRESS")%></td>
<td><%=rs2.getLong("REGNO")%></td>
<td><%=rs2.getString("PANNUMBER")%></td>
<td><%=rs2.getLong("PHONE")%></td>
<td><%=rs2.getString("EMAIL")%></td>
<td><%=rs2.getString("WEBSITE")%></td>
</tr><%}%><tr><td colspan="24" align="center">
<input type="submit" onclick="changeAction('add')" name="add" value="AddNew">
<input type="submit" onclick="changeAction('del')" name="del" value="Delete"></td></tr>
</table>
</form>
</body>
</html>

<%}else{out.println("invalid user name and passward");}
}
}catch(Exception e){out.println(e+"<html><br><br><br><center><h3><i><font color=\"black\">invalid user name passward</font></i></h3>"); %>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body></html>
<%
}
%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>

