<header><jsp:include page="header.jsp"/></header>

<%@ page import="java.sql.*"%>
<%! int a1;
String a2;
%>
<%
String v=request.getParameter("bepid");
System.out.println("Dep id "+v);

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select * from dept where depid="+v;
ResultSet rs=stmt.executeQuery(vsql);

rs.next();
int a1=rs.getInt(1);
String a2=rs.getString(2);



%>
<html><HEAD>
<SCRIPT LANGUAGE='javaScript'>
	
function checkData()
{
var t2=document.getElementById("ltype").value;

submitOK="true"
if( (!(isNaN(t2)==true)))
{
alert("Please Enter a Valid DepartmentName(not numbers)");
submitOK="false"
}
if((t2==""))
{
alert("Don't leave Empty Fields");
submitOK="false"
}

if(submitOK=="false")
{
return false;
}
}
</SCRIPT></head>
<body bgcolor="white"><form action="depup1.jsp" onsubmit="return checkData()">

<table align="center" bgcolor="wheat" border="2">
<tr><td>DepId </td><td><%=a1%></td><tr> <br>
<tr><td>DepName</td><td><input name="depname"type="text" id="ltype"value=<%=a2%>></td><tr> <br>
<tr><td colspan="2" align="center" ><input type="submit" value="update"><a href="dept.jsp">BACK</a></td>
</tr></table>
<input name="bankid" type="hidden" value=<%=a1%>>

</body>
</html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
