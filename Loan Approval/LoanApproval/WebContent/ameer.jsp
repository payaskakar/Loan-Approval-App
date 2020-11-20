<header><jsp:include page="header.jsp"/></header>
<%@ page import="java.sql.*"%>

<%

try{
String vlname=request.getParameter("lname");
String vpwd=request.getParameter("pwd");
String user=request.getParameter("user");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement();
/*1--*/if(user.equals("Admin")||user.equals("Cust"))
{

String vsqlad="select * from "+user+"";
System.out.println(vsqlad);
ResultSet rs=stmt.executeQuery(vsqlad);
String userAdmin="Admin";



/*1.1--*/if(user.equals(userAdmin))
{
rs.next();
String alname=rs.getString("lname");
String apwd=rs.getString("pwd");
System.out.println("vlname--"+vlname);
System.out.println("vpwd--"+vpwd);
/*1.1a--*/if(vlname.equals(alname)&&vpwd.equals(apwd)){
%>

<body bgcolor="white">
	<center><caption><font  color="black"><h4>Administration</h4></font></caption></center>
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
out.println("<h3><i><font color=\"black\">admin--invalid user name passward</font></i></h3>"); %>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body>

<%
}
}else{

rs.next();
String alname=rs.getString("CNAME");
String apwd=rs.getString("CPWD");
System.out.println("vlname--"+alname);
System.out.println("vpwd--"+apwd);
/*1.1b--*/if(vlname.equals(alname)&&vpwd.equals(apwd)){
%>
<body bgcolor="white">
	<center><caption><font  color="black"><h4>CustomerManagement</h4></font></caption></center>
<a href="cust.jsp"> <font color="black">Custmers Mangement</font></a>
</body>
<%
}/*1.1b--*/else {
//out.print("----Invalid UserName or password");
%>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body>
<%

}

}

//out.println("----------------------------------------------------------");
}
/*1--*/else{
            }






//if(user.equals("PickUp")||user.equals("Legal")){


String vsql1="select empname,phone,DEPT from emp where empname='"+vlname+"' and phone="+vpwd+"";

ResultSet rs=stmt.executeQuery(vsql1);



rs.next();
String vempname=rs.getString("EMPNAME");
String vphone=rs.getString("PHONE");
String vdept=rs.getString("DEPT");

if(vlname.equals(vempname)&&vpwd.equals(vphone)&&user.equals(vdept)){

if(vdept.equals("PickUp"))
{


String vsql2="select * from customers where state='New' and assignto='"+vlname+"'";

ResultSet rs1=null;
 rs1=stmt.executeQuery(vsql2);	
System.out.println(vsql2);%>
<html><body bgcolor="white"><center><b><h4>NEW CUSTOMERS INFORMATION</h4></b></center>
<table align="center" bgcolor="wheat" border="2">
<tr><th><b>CustmerName</b></th><th><b>State</b></th></tr>
<tr>
<%while(rs1.next())
{
//out.println("--------this is PickUp-----");
//out.println("Welcome,"+vempname);
%>
<td><%=rs1.getString("STATE")%></td>
<td><a href="exp.jsp"><%=rs1.getString("CUSTNAME")%></td></tr>

<%}%>	

</table>
</body></html>
<% 
}
}
else{
out.println("in valid user type");
}
if(vdept.equals("verification"))
{
if(vlname.equals(vempname)&&vpwd.equals(vphone)&&user.equals(vdept)) 
{

String vsql3="select * from customers where state='verification' and assignto='"+vlname+"'";

ResultSet rs1=null;
 rs1=stmt.executeQuery(vsql3);
System.out.println(vsql3);
%>
<html><body bgcolor="white"><center><b><h4>NEW CUSTOMERS INFORMATION</h4></b></center>
<table align="center" bgcolor="wheat" border="2">
<tr><th><b>State</b></th><th><b>CustmerName</b></th></tr>
<tr>

<%while(rs1.next())
{%>
<td><%=rs1.getString("STATE")%></td>
<td><a href="exp.jsp"><%=rs1.getString("CUSTNAME")%></td></tr>

<%}%>
</table>
</body></html>
<%
}
}
	

//}//end of admin&cust

}catch(Exception e){out.println("<html><h3><i><font color=\"black\">catch--invalid user name passward</font></i></h3>"+e); %>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body></html>
<%
}

%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>