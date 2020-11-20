<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>
<%@ page import="java.sql.*"%>
<%
String vs1=request.getParameter("bepid1");
String vs2=request.getParameter("bepid");
String vs4=request.getParameter("bank");
%>

<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select * from bank_loans where LOANID="+vs2;
ResultSet rs=stmt.executeQuery(vsql);
rs.next();
%>
<html>
<head>
<SCRIPT type="text/javascript">	
function checkData()
{

	
var t1=document.getElementById("t1").value;

var t2=document.getElementById("t2").value;

submitOK="true"

if( (!(isNaN(t1)==true))||((isNaN(t2)==true)))
{
alert("Please Enter a Valid Data");
submitOK="false"
}
if(t2==" ")
{
alter("please Enter a vlid Rate")
submitOK="false"
}
if((t1=="")||(t2==""))
{
alert("Don't leave Empty Fields");
submitOK="false"
}

if(submitOK=="false")
{
return false;
}
}
</SCRIPT>

</head>
<body bgcolor="white">

<form  action="loanupdate.jsp" onsubmit="return checkData()">
<CENTER><FONT SIZE="4" COLOR="BLUE"><b>UPDATION OF LOAN INFORMATION</font></CENTER><br><br>
<%try{%>
<table align="center" border="2" bgcolor="wheat">
<tr><td><b>BankName</td><td><%=rs.getString("BANKNAME")%></td></tr>
<tr><td><b>LoanType</td>
<td><input type="text" id="t1" name="ltype" value="<%=rs.getString("LOANTYPE")%>"></td></tr>
<tr><td><b>InterestRate</td>
<td><input type="text" id="t2" name="intrate" value="<%=rs.getString("INTERESTRATE")%>"></td></tr>
<tr><td align="center"colspan="2"><input type="submit"  value="Update"></td></tr>
</table>
<%}catch(SQLException  e){out.println("invalid data");}%>
<center><a href="adminbdisp.jsp?bank=<%=vs1%>"><h><b>BACK<h></a><BR>


<a href="adminnew.jsp"><b>ADMIN</a></center><BR>

<input type="hidden" name="bank" value="<%=vs1%>">
<input type="hidden" name="bank1" value="<%=vs2%>">
<input type="hidden" name="bank2" value="<%=vs4%>">
</form>
</body></html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>