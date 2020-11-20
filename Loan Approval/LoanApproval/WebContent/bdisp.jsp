<header><jsp:include page="header.jsp"/></header>


<%@ page import="java.sql.*"%>
<% String vs=request.getParameter("bank");
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
String vsql="select * from  bank_loans where bankname='"+vs+"'";
ResultSet rs=stmt.executeQuery(vsql);%>

<html>
<body bgcolor="white"><BR><BR>

<table align="center" bgcolor="wheat" border="2">
<tr><th>BANKNAME</th><th>LOANTYPE</th><th>INTERESTRATE</th></tr>
<%while(rs.next()){%>
<tr><td><%=rs.getString(1)%></td> 
<td><%=rs.getString(2)%></td>
<td><%=rs.getDouble(3)%></td> 

<%}%><%}catch(Exception e){out.println("error is "+e);}%></tr>
<tr><td colspan="3" align="center" ><a href="loans.jsp">BACK</a></tr>
</table>
</body>
</html>	


<html><head>

<SCRIPT LANGUAGE='javaScript'>
	
function checkData()
{
var t1=document.getElementById("t1").value;
var t2=document.getElementById("t2").value;
var t3=document.getElementById("t3").value;
var email1=document.getElementById("t3").value.indexOf("@");
var email2=document.getElementById("t3").value.indexOf(".");
var t4=document.getElementById("t4").value;
var t5=document.getElementById("t5").value;
var t6=document.getElementById("t6").value;
var t7=document.getElementById("t7").value;
var t8=document.getElementById("t8").value;
var t9=document.getElementById("t9").value;
var t10=document.getElementById("t10").value;
submitOK="true"
if( (!(isNaN(t1)==true))||(!(isNaN(t2)==true))||(!(isNaN(t3)==true))||(!(isNaN(t4)==true))||(!(isNaN(t5)==true))||(!(isNaN(t6)==true))||(!(isNaN(t7)==true))||((isNaN(t8)==true))||((isNaN(t9)==true))||(!(isNaN(t10)==true)) )
{
alert("Please Enter a Valid Data");
submitOK="false"
}
if( (t1=="")||(t2=="")||(t3=="")||(t4=="")||(t5=="")||(t6=="")||(t7=="")||(t8=="")||(t9=="")||(t10==""))
{
alert("Don't leave Empty Fields");
submitOK="false"
}
if((email1==-1)||(email2==-1))
{
alert("Not a Valid Emailid");
submitOK="false"
}
if(t8.length<10)
{
alert("Invalid Contact no.");
submitOK="false"
}
if(submitOK=="false")
{
return false;
}
}
</SCRIPT>
</head>
<body>
<form  action="storedcustomers.jsp" onsubmit="return checkData()">

<table align="center" bgcolor="wheat" size="100" border="2">
<caption><h4><font color="BLUE">Custmer Register Form</font></h4></caption>
<tr>
	<td>CustomerName</td>
	<td><input type="text" name="cname" id="t1"></td>
</tr>

<tr>
	<td>Address</td>
	<td><textarea rows="3"cols="30" name="addr" id="t2"></textarea></td>
</tr>
<tr>
	<td>Email</td>
	<td><input type="email" name="email" id="t3"></td>
</tr>




<tr>
	<td>Qualification</td>
	<td><input type="text" name="Qualification" id="t4"></td>
</tr>
	
<tr>
	<td>Occupation</td>
	<td><input type="text" name="Occupation" id="t5"></td>
</tr>




<tr>
	<td>Company/Business</td>
	<td><input type="text" name="Company" id="t6" ></td>
</tr>
	



<tr>
	<td>Address</td>
	<td><textarea rows="3"cols="30" name="addr1" id="t7"></textarea></td>
</tr>	
<tr>
	<td>Contact no.</td>
	<td><input type="text" name="Contactno" id="t8" size="10" maxlength="10" ></td>
</tr>
<tr>
	<td>Salary</td>
	<td><input type="text" name="Salary" id="t9"></td>
</tr>
	
<tr>
	<td>Designation</td>
	<td><input type="text" name="Designation" id="t10"></td>
</tr>
	

<tr>
	<td>Gender</td>
	<td><input type="radio" name="sex" checked="true"value="male">Male
	<input type="radio" name="sex"value="female">Female</td>
</tr>


<tr>
	
	<td><input type="hidden" name="state" value="new"></td>
</tr>
	

<tr>
	
<td align="center"colspan="2"><input type="submit" value="Save"></td>
	<input type="hidden" name="bank" value="<%=vs%>">
</tr>

</table>
</form>

</body>
</html>	

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>