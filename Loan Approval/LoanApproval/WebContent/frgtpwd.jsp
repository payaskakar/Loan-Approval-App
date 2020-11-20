<header><jsp:include page="header.jsp"/></header>

<html><body bgcolor="white">
<center><caption><font color="red"><h3>Password Recovery</h3></font></caption></center></html>

<table align="center" bgcolor="white" border=0>
<td><b> Please provide your registered E-mail address so that we can help you to recover your password by sending to provided email address! Thank You !</b></td> </table> <br><br>
</body></html>


<html><head>
<SCRIPT LANGUAGE='javaScript'>
function checkData()
{
var email1=document.getElementById("t1").value.indexOf("@");
var email2=document.getElementById("t1").value.indexOf(".");
submitOK="true"
if(!(isNaN(t1)==true))
{
alert("Please Enter a Valid Data");
submitOK="false"
}
if(t1=="")
{
alert("Don't leave Empty Fields");
submitOK="false"
}
if((email1==-1)||(email2==-1))
{
alert("Not a Valid Emailid");
submitOK="false"
}
if(submitOK=="false")
{
return false;
}
</SCRIPT>
</head>
<body>
<form action="fkmsg.jsp" onsubmit="return checkData()">
<table align="center"bgcolor="white" >

<tr><td><b>Email</b></td><td><input type="email" /></td></tr>
<tr><td align="center" colspan="2"><input  name="email" type="submit" value="Submit">
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>