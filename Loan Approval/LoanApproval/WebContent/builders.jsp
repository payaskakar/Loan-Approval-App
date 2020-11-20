<header><jsp:include page="header.jsp"/></header>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%@ page import="java.sql.*"%>
<%
String vreg=request.getParameter("cust3");
System.out.println(vreg);
//String ename1=request.getParameter("ename1");
String ename1=(String)session.getAttribute("ename1");
System.out.println(ename1);
System.out.println("222222222");
String empno1=(String)session.getAttribute("empno1");
System.out.println(empno1);
//String empno1=request.getParameter("empno1");
System.out.println("........builders.jsp"+empno1);
//session.setAttribute("empno",empno1);
%>
<html><head>

<script type="text/javascript">



	var regno=<%=vreg%>


function getIndex(){

var x=document.getElementById("mySelect")

if((x.selectedIndex)==1)
{
document.getElementById("apfno").disabled=false
document.getElementById("reason").disabled=true
//document.getElementById("dis").disabled=false

}else{
document.getElementById("apfno").disabled=true
document.getElementById("reason").disabled=false
document.getElementById("dis").disabled=false
document.getElementById('txt').innerHTML=""
document.getElementById("fav").value=""
}
if((x.selectedIndex)==0)
{
document.getElementById("reason").disabled=true
document.getElementById("dis").disabled=true
}
}
//-----------------------------------
function startTime()
{
var today=new Date()
var h=today.getHours()
var m=today.getMinutes()
var s=today.getSeconds()
//add zero in front of numbers<10
m=checkTime(m)
s=checkTime(s)
document.getElementById('txt').innerHTML=h+""+m+""+s+""+regno
document.getElementById("fav").value=h+""+m+""+s+""+regno
document.getElementById("dis").disabled=false

}
function checkTime(i)
{
if(i<10)
{i="0"+i}
return i
}

//------------------------------------
</script>
</head>

<body bgcolor="white"><form id="myForm" action="buildersres.jsp">
<b><h4 align="center">BuilderInformationForm <b></h4>
<table bgcolor="wheat" align="center" border="2">

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement();
String vsql="select * from builders_details where regno="+vreg;

ResultSet rs2=null;
rs2=stmt.executeQuery(vsql);
if(rs2.next()){
	String a1=rs2.getString("BUILDERNAME");
	String a2=rs2.getString("OFFICEADDRESS");
	int a3=rs2.getInt("REGNO");
	String a4=rs2.getString("PANNUMBER");
	int a5=rs2.getInt("PHONE");
	String a6=rs2.getString("EMAIL");
	String a7=rs2.getString("WEBSITE");
	String a8=rs2.getString("LP");
	String a9=rs2.getString("PNO");
	String a10=rs2.getString("NOC");
	String a11=rs2.getString("BP");
    String a12=rs2.getString("EC");
	%>


<tr><td><b>BuilderName</td><TD><%=a1%></td></tr>
<tr><td><b>Office Address</td><td ><%=a2%></td></tr>
<tr><td><b>RegNo</td><td><%=a3%></td></tr>
<tr><td><b>PanNo</td><td><%=a4%></td></tr>
<tr><td><b>Phone</td><td><%=a5%></td></tr>
<tr><td><b>Email</td><td><%=a6%></td></tr>
<tr><td><b>WebSite</td><td><%=a7%></td></tr>
<tr><td><b>Layout Plan</td> <td  align="center"><b><font color="red"><%=a8%></font></td></tr>
<tr><td><b>Panchayathi/ HudaPermission</td><td align="center"><b><font color="red"><%=a9%></font></td></tr>
<tr><td><b>No objection Certificate</td><td align="center"><b><font color="red"><%=a10%></font></td></tr>
<tr><td><b>Encumberance Certificate</td><td align="center"><b><font color="red"><%=a12%></font></td></tr>
<tr><td><b>Building Plan</td><td align="center"><b><font color="red"><%=a11%></font></td></tr>
<input type="hidden" name="reg"value="<%=a3%>">
<%}%>

<tr><td><b>Decision</td><td><select id="mySelect" onchange="getIndex()" name="decision"><option>None</option><option>YES
<option>NO</select></td></tr>
<tr><td><b>APF No</td><td><input type="button" id="apfno" onclick="startTime()" value="APFNO" disabled="true"><b><font color="white"><div id="txt"></div></td></tr>
<tr><td><b>Reason</td><td><input type="text"  name="reas" disabled="true" id="reason"></td></tr>
<tr><td colspan="2" align="center"><input id="dis"type="submit" disabled ="true"value="save"></td></tr>
</table>
<input type="hidden" name="fave"   id="fav" size="20">
<center><b><a href="newcheck.jsp?lname=<%=ename1%>&pwd=<%=empno1%>&user=Legal&Login=Login">BACK</a></b></center>
<input type="hidden" name="ename" value="<%=ename1%>">
<input type="hidden" name="empno" value="<%=empno1%>">
</form>
</body>
</html>


<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
