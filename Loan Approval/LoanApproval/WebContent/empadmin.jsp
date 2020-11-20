
<header><jsp:include page="header.jsp"/></header>
<%@ page import="java.sql.*"%>
<%
try{
String lname=request.getParameter("lname");
String pwd=request.getParameter("pwd");
String user=request.getParameter("user");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");


Statement stmt=con.createStatement();
String vsql="select * from "+user+"";
System.out.println(vsql);
ResultSet rs=stmt.executeQuery(vsql);
String userAdmin="+user";
if(user.equals(userAdmin))
{
rs.next();
String vlname=rs.getString("lname");
String vpwd=rs.getString("pwd");
System.out.println("vlname--"+vlname);
System.out.println("vpwd--"+vpwd);
if(lname.equals(vlname)&&pwd.equals(vpwd)){
%>

<body bgcolor="white">
	<center><caption><font color="black"><h4>Administration</h4></font></caption></center>
<table border=2 align="center"bgcolor="wheat">
<tr><td><a href="newcb.jsp"> <font color="black">Banks Mangement</font></a></tr></td>
<tr><td><a href="dept.jsp"> <font color="black">Departments Management</font></a></tr></td>
<tr><td><a href="emp.jsp"> <font color="black">EmployeesManagement</font></a></tr></td>
<tr><td><a href="loans.jsp"> <font color="black">Loans Mangement</font></a></tr></td>
<tr><td><a href="cust-disp.jsp"> <font color="black">Customers Mangement</font></a></tr></td>
<tr><td><a href="buil.jsp"> <font color="black">Builders Mangement</font></a></tr></td>
</table>
</body>
<%
} else{
out.println("<h3><i><font color=\"black\">invalid user name passward</font></i></h3>"); %>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body>

<%
}
}else{

rs.next();
String vlname=rs.getString("CNAME");
String vpwd=rs.getString("CPWD");
System.out.println("vlname--"+vlname);
System.out.println("vpwd--"+vpwd);
if(lname.equals(vlname)&&pwd.equals(vpwd)){
%>
<body bgcolor="white">
	<center><caption><font color="black"><h4>CustomerManagement</h4></font></caption></center>
<a href="cust.jsp"> <font color="black">Custmers Mangement</font></a>
</body>
<%
}else {
out.print("Invalid UserName or password");
%>
<body bgcolor="white" align="center">
<a href="/soe/main.jsp">home</a>
</body>
<%

}

}
}catch(Exception e){out.print(e);}
%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>

