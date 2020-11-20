
<header><jsp:include page="header.jsp"/></header>
<html><body><h5 align="center"><a href="main.jsp">LOGOUT</a></h5></body></html>







<%
String vmail=request.getParameter("vemail");
//out.println(vmail);
%>
<html>
<body bgcolor="white"><BR><BR>

<html><head>
<SCRIPT LANGUAGE='javaScript'>
	
function checkData()
{

var t8=document.getElementById("t8").value;
var t22=document.getElementById("t22").value;

submitOK="true"


if( (t8=="")||(t22==""))
{
alert("Don't leave Empty Fields");
submitOK="false"
}

if(t8.length<9)
{
alert("Password  should be 9 or above");
submitOK="false"

}
if(t22.length<9)
{
alert("Password  should be 9 or above");
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
<form  action="changeNewPass.jsp" onsubmit="return checkData()">

<br>
<br>
<br>
<br>
<br>

<table align="center" bgcolor="wheat" size="100" border="2">


<font color="red" size="4" >*Please Enter Valid Password</font>
<tr>
	<td>Enter your New Password</td>
	<td><input type="password"  id="t8" name="POne" ></td>
</tr>
<tr>
	<td>Re-Enter your Password</td>
	<td><input type="password" id="t22" name="PTwo"  ></td>
</tr>
<tr>
	
<td align="center"colspan="2"><input type="submit" value="Save"></td>
	
<input type="hidden"  name="vemail" value="<%=vmail%>">


</table>
</form>

</body>
</html>


<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>



	