<header><jsp:include page="header.jsp"/></header>
<html>
<%@ page import="java.sql.*"%>

<%String vone=request.getParameter("bank");
String vtwo=request.getParameter("bank1");
System.out.println("Bank vone "+vone);
//System.out.println("Bank1 vone "+vtwo);

%>


<html>

<head>
<script type="text/javascript">
function checkData()
{
var x=document.getElementById("ltype").value;
var y=document.getElementById("intrate").value;
submitOK="true"
if((isNaN(y)==true)||(y==""))
{
alert("Please Enter a Valid Interest Rate");
document.getElementById("intrate").value=" "
document.getElementById("ltype").value=" "
submitOK="false"
}
if((!(isNaN(x)==true))||(x==""))
{
alert("Please Enter a Valid Loan Type");
submitOK="false"
document.getElementById("ltype").value=" "
}

if(submitOK=="false")
{
return false;
}
}

</script>
</head>
<body bgcolor="white">
<form id="myForm" action="saveloandetails.jsp" onsubmit="return checkData()">

<table align="center" border="2" bgcolor="wheat">
<tr><td><b>BankName</td><td><%=vone%></td></tr>
<tr><td><b>LoanType</td><td><input type="text" id="ltype" name="ltype"></td></tr>
<tr><td><b>InterestRate</td><td><input type="text" id="intrate" name="intrate"></td></tr>
<tr><td align="center"colspan="2"><input type="submit"  value="Save"></td></tr>
</table>
<center><a href="adminbdisp.jsp?bank=<%=vone%>"><h>BACK<h></a></center>

<form>
<input type="hidden" name="bank" value="<%=vone%>">
<input type="hidden" name="bank1" value="<%=vtwo%>">
</body></html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>