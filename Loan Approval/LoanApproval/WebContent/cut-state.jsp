<header><jsp:include page="header.jsp"/></header>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>
<html><head>
<script type="text/javascript">
function myfun()
{
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection newcon=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");


Statement newstmt=newcon.createStatement();%>

var d=document.getElementById("state")
var n=document.getElementById("assign")

if((d.selectedIndex)==1)
{
	document.getElementById("sub").disabled=false
	<%String pic="select empname from emp where dept='PickUp'";
	ResultSet picrs=newstmt.executeQuery(pic);
	Vector newv=new Vector();
	while(picrs.next())
	{
	newv.add(picrs.getString("empname"));
	}
	int newvone=newv.size();
	%>
	

	var s=<%=newvone%>
	document.getElementById("assign").length=s

	<%for(int i=0;i<newv.size();i++)
	{%>
	n.options[<%=i%>].text="<%=newv.get(i)%>"<%}%>

}
if((d.selectedIndex)==2)
{	document.getElementById("sub").disabled=false
	<%String veri="select empname from emp where dept='Verification'";
	ResultSet rs1=newstmt.executeQuery(veri);
	Vector v1=new Vector();
	while(rs1.next())
	{
	v1.add(rs1.getString("empname"));
	}
	int vs=v1.size();
	%>
	var s1=<%=vs%>
	document.getElementById("assign").length=s1

	<%for(int i=0;i<v1.size();i++)
	{%>
	n.options[<%=i%>].text="<%=v1.get(i)%>"<%}%>

}
if((d.selectedIndex)==0)
{
document.getElementById("sub").disabled=true
document.getElementById("assign").length=1
n.options[0].text="--"
}
}
</script>

</head>
<%String v=request.getParameter("cust");%>
<body bgcolor="white">
<form action="asign-cust.jsp">
<input type="hidden" name="contactno" value="<%=request.getParameter("contactno")%>">
<center><h4><font color="black">New Customers Information</font></h4></center>
<table align="center" bgcolor="wheat" border="2">
<%
ResultSet rs=null;
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
String vsql="select * from customers where contactno=''";

rs=stmt.executeQuery(vsql);

if(rs.next())
{
out.print("<tr><td><b>CustumerName</b></td><td>"+rs.getString("CUSTNAME")+"</td></tr>");
out.print("<tr><td><b>Address</b></td><td>"+rs.getString("CUSTADDRESS")+"</td></tr>");
out.print("<tr><td><b>EmailId</b></td><td>"+rs.getString("emailid")+"</td></tr>");
out.print("<tr><td><b>Qualification</b></td><td>"+rs.getString("QUALIFICATION")+"</td></tr>");
out.print("<tr><td><b>Occupation</b></td><td>"+rs.getString("OCCUPATION")+"</td></tr>");
out.print("<tr><td><b>Company/Business</b></td><td>"+rs.getString("COMPANYBS")+"</td></tr>");
out.print("<tr><td><b>Address</b></td><td>"+rs.getString("COMADDRESS")+"</td></tr>");
out.print("<tr><td><b>Contactno</b></td><td>"+rs.getLong("CONTACTNO")+"</td></tr>");

out.print("<tr><td><b>Salary</b></td><td>"+rs.getLong("SALARY")+"</td></tr>");
out.print("<tr><td><b>Designation</b></td><td>"+rs.getString("DESIGNATION")+"</td></tr>");
out.print("<tr><td><b>Gender</b></td><td>"+rs.getString("GENDER")+"</td></tr>");
//out.print("<tr><td><b>State</b></td><td>"+rs.getString("STATE")+"</td></tr>");

}
}
catch(SQLException e){
	System.out.println(e);
}
%>
<tr><td><b>State</b></td>
<td><select id="state" name="state" onchange="myfun()">
<option>---
<option>Pickup
<option>Verification
</select></td></tr>

<tr><td><b>AssignTo</b></td>
<td><select id="assign" name="assign">
<option>--
<option>satish
</select></td></tr>

<tr><td colspan="2"align="center"><input type="submit" id="sub" disabled="true" value="Submit"><b><a href="cust-disp.jsp">BACK</a></b></td></tr>
</table>

</body>
</html>



<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
