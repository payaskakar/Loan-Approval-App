
<header><jsp:include page="header.jsp"/></header>

 



<%@ page import="java.sql.*"%>
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
var email1=document.getElementById("t6").value.indexOf("@");
var email2=document.getElementById("t6").value.indexOf(".");
submitOK="true"
if( (isNaN(t1)==true)||(!(isNaN(t2)==true))||(!(isNaN(t3)==true))||(!(isNaN(t4)==true))||(isNaN(t5)==true)||(!(isNaN(t6)==true)))
{
alert("Please Enter a Valid Data");
submitOK="false"
}
if( (t1=="")||(t2=="")||(t3=="")||(t4=="")||(t5=="")||(t6==""))
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
if(submitOK=="false")
{
return false;
}
}
</SCRIPT>
</head>
<body bgcolor="white">
<form action="empstored.jsp" onsubmit="return checkData()">
<table align="center" BORDER="2" bgcolor="WHEAT">
<caption><font color="blue"><h4>EmployessDetailsForm</h4></font></caption>
<tr><td><b>EmpId</b></td>
<td><input name="empid" id="t1"type="text"></td> </tr><br>
<tr><td><b>EmpName</b></td>
<td><input name="empname"type="text"id="t2"></td> </tr><br>
<tr><td><b>Desig</b></td>
<td><input name="design" type="text"id="t3"></td> </tr><br>
<tr><td><b>Dept</b></td><td><select name="dept">
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
String vsql="select *  from dept";
ResultSet rs=stmt.executeQuery(vsql);
while(rs.next()){
%>
<option><%=rs.getString("depname")%>
<%}%>

</select></td> </tr>

<tr><td><b>Adress</b></td>
<td><input name="address" type="text"id="t4"></td> </tr><br>
<tr><td><b>phone</b></td>
<td><input name="phone"type="text"id="t5" size="13" maxlength="12"></td> </tr><br>
<tr><td><b>Email</b></td>
<td><input name="email"type="text"id="t6"></td> </tr><br>
<tr><td colspan ="2"align="center"><input type="submit" value="store"><a href="emp.jsp"><b>BACK<b></a></td></tr><br>
<body  align="center">
 <font color="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body>
</body>
</html>

