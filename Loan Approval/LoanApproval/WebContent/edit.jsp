<header><jsp:include page="header.jsp"/></header>


<%@ page contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%! int a1;
String a2,a3,a4;
%>
<%
String v=request.getParameter("bid");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select * from banks where bankid="+v;
System.out.println("BANK"+vsql);
ResultSet rs=stmt.executeQuery(vsql);

rs.next();

a1=rs.getInt(1);
a2=rs.getString(2);
a3=rs.getString(3);
a4=rs.getString(4);
%>
<html><HEAD>
<SCRIPT LANGUAGE='javaScript'>
	var toDay=new Date();
	document.write(toDay);
	document.write(toDay.getDate());
function checkData()
{
var t2=document.getElementById("ltype").value;
var t3=document.getElementById("ltypeone").value;
var t4=document.getElementById("ltypetwo").value;
submitOK="true"
if( (!(isNaN(t2)==true))||(!(isNaN(t3)==true))||(!(isNaN(t4)==true)) )
{
alert("Please Enter a Valid Data(not numbers)");
submitOK="false"
}
if( (t2=="")||(t3=="")||(t4==""))
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
</HEAD>
<body bgcolor="white"><form action="up1.jsp" onsubmit="return checkData()">

<table align="center" bgcolor="WHEAT" border="2">
<tr><td>Bankid </td><td><%=a1%></td><tr> <br>
<tr><td>BankName
</td><td><input name="bankname" ID="ltype"type="text"value=<%=a2%>></td><tr> <br>
<tr><td>Branch</td><td><input name="branch"type="text" ID="ltypeone"value=<%=a3%>></td><tr> <br>
<tr><td>Address</td><td><input name="address"type="text" ID="ltypetwo"value=<%=a4%>></td><tr> <br>
<tr><td colspan="2" align="center" ><input type="submit" value="update"><a href="newcb.jsp"><B>BACK</a></td>
</tr></table>
<input name="bankid" type="hidden"value=<%=a1%>>

</body>
</html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>