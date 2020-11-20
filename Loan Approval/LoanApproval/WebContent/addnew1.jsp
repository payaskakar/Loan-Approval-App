
<header><jsp:include page="header.jsp"/></header>


<html>
<head>
</head>
<script type="text/javascript">
function checkData()
{
var t2=document.getElementById("ltype").value;
var t3=document.getElementById("ltypeone").value;
var t4=document.getElementById("ltypetwo").value;
var t1=document.getElementById("intrate").value;
submitOK="true"
if( (!(isNaN(t2)==true))||(!(isNaN(t3)==true))||(!(isNaN(t4)==true)) )
{
alert("Please Enter a Valid Data");
submitOK="false"
document.getElementById("ltype").value=" "
document.getElementById("ltypeone").value=" "
document.getElementById("ltypetwo").value=" "
}
var a=" "
if((isNaN(t1)==true)||(t1==""))
{
alert("Enter a valid BankId");
document.getElementById("intrate").value="";
submitOK="false"
}
if(submitOK=="false")
{
return false;
}
}

</script>

<body bgcolor="white">
 
<form id="myForm" action="stored.jsp" onsubmit="return checkData()">	

<table align="center" border=2 bgcolor="wheat">
<caption><font color="BLACK"><h4>BankInformationForm</h4></font></caption>
<tr><td><b>Bankid</b></td><td><input name="bankid" id="intrate" type="text"></td> </tr><br>
<tr><td><b>BankName</b></td><td><input name="bankname" id="ltype" type="text"></td> </tr><br>
<tr><td><b>Branch</b></td><td><input name="branch" id="ltypeone"type="text"></td> </tr><br>
<tr><td><b>Address</b></td><td><input name="address" id="ltypetwo"type="text"></td> </tr><br>
<tr><td colspan ="2"align="center"><input type="submit" value="store"><a href="newcb.jsp"><b>BACK<b></a></td>
</tr><br>
</table></form></body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>

