<header><jsp:include page="header.jsp"/></header>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%
String ename1=request.getParameter("ename");
//out.println(ename1);
String empno1=request.getParameter("empno");
//out.println(empno1);
%>
<html>
<HEAD>
<SCRIPT LANGUAGE='javaScript'>
	
function checkData()
{

	
var t1=document.getElementById("t1").value;
var t2=document.getElementById("t2").value;
var t3=document.getElementById("t3").value;
var t4=document.getElementById("t4").value;
var t5=document.getElementById("t5").value;
var t6=document.getElementById("t6").value;
var t7=document.getElementById("t6").value;
var email1=document.getElementById("t6").value.indexOf("@");
var email2=document.getElementById("t6").value.indexOf(".");

var website=document.getElementById("t6").value.indexOf(".");
submitOK="true"
if((!(isNaN(t1)==true))||(!(isNaN(t2)==true))||(isNaN(t3)==true)||(!(isNaN(t4)==true))||(isNaN(t5)==true)||(!(isNaN(t6)==true))||(!(isNaN(t7)==true)))
{
alert("Please Enter a Valid Data");
submitOK="false"
}
if((t1=="")||(t2=="")||(t3=="")||(t4=="")||(t5=="")||(t6=="")||(t7==""))
{
alert("Don't leave Empty Fields");
submitOK="false"
}
if(t5.length<9)
{
alert("Phoneno should be minimum of 9 numbers");
submitOK="false"
}
if((email1==-1)||(email2==-1))
{
alert("Not a Valid Emailid");
submitOK="false"
}
if((website==-1))
alert("Not a Valid Website");
if(submitOK=="false")
{
return false;
}
}
</SCRIPT>
</head>



<body bgcolor="white">
<form action="buildstore.jsp" onsubmit="return checkData()">
<center><h3>New Builders Information Form</h3></center>
<table align="center" border="2" bgcolor="wheat">
<tr>
	<td>BuilderName:</td>
	<td><input type="text" size="30" id="t1" name="bname"></td>
</tr>
<tr>
	<td>Office Address:</td>
	<td><input type="text" size="30" id="t2"  name="oaddr"></td>
</tr>
<tr>
	<td>RegNo:</td>
	<td><input type="text" size="30" id="t3"  name="regno"></td>
</tr>
<tr>
	<td>PAN No:</td>
	<td><input type="text"size="30" id="t4"  name="pan"></td>
</tr>
<tr>
	<td>Phone:</td>
	<td><input type="text"size="15" maxlength="12"  id="t5"  name="phone"></td>
</tr>
<tr>
	<td>Email:</td>
	<td><input type="text" size="30" id="t6" name="email"></td>
</tr>
<tr>
	<td>WebSite:</td>
	<td><input type="text"size="30" id="t7"  name="webs"></td>
</tr>
<tr>
	<td colspan="2" align="center"><b>Submitted Certificates</b><td>
</tr>
<tr>
	<td><input type="checkbox" name="lp"  value="YES">LayoutPlan</td>
	<td><input type="checkbox" name="huda"  value="YES">Panchayati/HUDA permission</td>
</tr>
<tr>
	<td><input type="checkbox" name="noc" value="YES">No Objection Certificate</td>
	<td><input type="checkbox" name="bp" value="YES">BuildingPlan</td>
</tr>
<tr>
	
	<td colspan="2"><input type="checkbox" name="ec" value="YES">Enumberance Certificate</td>
</tr>


<tr>
	<td colspan="2" align="center"><input type="submit" value="SAVE">
	<b><a href="newcheck.jsp?lname=<%=ename1%>&pwd=<%=empno1%>&user=Legal&Login=Login">BACK</a></b></td>
</tr>
</table>
<input type="hidden" name="ename" value="<%=ename1%>">
<input type="hidden" name="empno" value="<%=empno1%>">

</form>
</body>
</html>


<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>