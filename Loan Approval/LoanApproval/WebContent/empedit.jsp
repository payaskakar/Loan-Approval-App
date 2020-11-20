<header><jsp:include page="header.jsp"/></header>


<html><body><h5 align="center"><a href="main.jsp">LOGOUT</a></h5></body></html>
<%@ page import="java.sql.*"%>


<html>
<HEAD>
<SCRIPT LANGUAGE='javaScript'>
	
	
function checkData()
{
var t2=document.getElementById("t2").value;
var t3=document.getElementById("t3").value;
var t5=document.getElementById("t5").value;
var t6=document.getElementById("t6").value;
var t7=document.getElementById("t7").value;
var email1=document.getElementById("t7").value.indexOf("@");
var email2=document.getElementById("t7").value.indexOf(".");
submitOK="true"
if((!(isNaN(t2)==true))||(!(isNaN(t3)==true))||(!(isNaN(t5)==true))||(isNaN(t6)==true)||(!(isNaN(t7)==true)))
{
alert("Please Enter a Valid Data");
submitOK="false"
}
if((t2=="")||(t3=="")||(t5=="")||(t6==""))
{
alert("Don't leave Empty Fields");
submitOK="false"
}
if(t6.length<9)
{
alert("Phoneno should be minimum of 9 numbers");
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
}
</SCRIPT>
</head>

<%
try{
String v=request.getParameter("bepid");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
String vsql="select * from emp where empid="+v;
ResultSet rs=stmt.executeQuery(vsql);

rs.next();%>

<body bgcolor="white">
<form action="empup1.jsp" onsubmit="return checkData()"><br><br>

<table align="center" bgcolor="wheat" border="2">
<tr><td>Empid </td><td><%=rs.getInt(1)%></td><tr> <br>
<tr><td>EmpName</td>
<td><input name="empname"type="text"id="t2"value=<%=rs.getString(2)%>></td></tr> 
<tr><td>Design</td>
<td><input name="design"type="text" id="t3" value=<%=rs.getString(3)%>></td></tr> 
<tr><td>Dept</td><td><%=rs.getString(4)%></td></tr> 
<tr><td>Address</td>
<td><input name="address"type="text" id="t5" value=<%=rs.getString(5)%>></td></tr> 
<tr><td>Phone</td>
<td><input name="phone"type="text" id="t6" size="13" maxlength="12" value=<%=rs.getLong(6)%>></td></tr> 
<tr><td>Email</td>
<td><input name="email"type="text"id="t7"value=<%=rs.getString(7)%>></td></tr> 
<tr><td colspan="2" align="center" ><input type="submit" value="update"><a href="emp.jsp">BACK</a></td>
</tr></table>
<input name="empid" type="hidden"value=<%=rs.getInt(1)%>>
<input name="dept"type="hidden"value=<%=rs.getString(4)%>> 
<h5 align="center"><a href="adminnew.jsp">ADMIN</h5></a>
</body>
</html>
<%}catch(Exception e){out.print(e);}%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>