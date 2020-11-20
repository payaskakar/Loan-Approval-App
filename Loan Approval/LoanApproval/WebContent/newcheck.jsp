<header> 
    <jsp:include page="header.jsp"/></header>
     
      
     
<%@ page import="java.sql.*"%>


<%!
String vlname;
String vpwd;
String user;
%>
<%
try{

vlname=request.getParameter("lname");
System.out.println(vlname);
vpwd=request.getParameter("pwd");
System.out.println(vpwd);
user=request.getParameter("user");
System.out.println(user);
System.out.println("###########");
System.out.println("$$$$$$$$");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String userAdmin="Admin";
if(user.equals(userAdmin))
{
String vsqlad="select * from "+user+"";
System.out.println(vsqlad);
ResultSet rs=stmt.executeQuery(vsqlad);
rs.next();
String alname=rs.getString("lname");
String apwd=rs.getString("pwd");
System.out.println("vlname--"+vlname);
System.out.println("vpwd--"+vpwd);
if(vlname.equals(alname)&&vpwd.equals(apwd)){

//System.out.println("---i am in if ---");
 RequestDispatcher rd=application.getRequestDispatcher("/adminnew.jsp");
rd.forward(request,response);


} else{
%>
<html><br><br><br><center><h3><i><font color="black">Invalid user name passward</font></i></h3>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body></html>
<%
}
}//------------------Admin






if(user.equals("Cust"))
{
String vsqlad="select * from CUSTOMERS where emailid='"+vpwd+"'";
System.out.println(vsqlad);
ResultSet rs=stmt.executeQuery(vsqlad);
rs.next();
String alname=rs.getString("CUSTNAME");
String apwd=rs.getString("EMAILID");
out.println("apwd--"+apwd);
System.out.println("database--"+alname);
System.out.println("-database-"+apwd);
if(vlname.equals(alname)&&vpwd.equals(apwd)){%>
//cpwd=<%=vpwd%>

<%
RequestDispatcher rd1=application.getRequestDispatcher("/cmgmt.jsp?cpwd="+vpwd+"&vapwd="+apwd+"&avlname="+vlname);
rd1.forward(request,response);

}else {%>
<html><br><br><br><center><h3><i><font color="black">Invalid user name passward</font></i></h3>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body></html>
<%

}

}

//out.println("----------------------------------------------------------");






//from starting of pickup and verification


if(user.equals("PickUp")){

String vsql1="select empname,phone,dept from emp where empname='"+vlname+"' and phone="+vpwd+"";
ResultSet rs=stmt.executeQuery(vsql1);
rs.next();
String vempname=rs.getString("EMPNAME");
String vphone=rs.getString("PHONE");
String vdept=rs.getString("dept");




if(vlname.equals(vempname)&&vpwd.equals(vphone)&&user.equals(vdept)){

String vsql2="select * from customers where state='Pickup' and assignto='"+vlname+"'";
ResultSet r=null;
 r=stmt.executeQuery(vsql2);	
System.out.println(vsql2);%>
<html><body bgcolor="white">
<font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font>
<center><b><h4><font colo="blue">NEW CUSTOMERS INFORMATION</h4></b></center>
<table align="center" bgcolor="wheat" border="2">
<tr><th><b>CustmerName</b></th></th><th><b>PhoneNo</b></th><th><b>Address</b></th><th><b>EmaiId</b></th><th><b>Occupation</b></th><th><b>Status</b></th></tr>
<tr>


<%
while(r.next())
{
	System.out.println("&&&&&&&&&&&&");
	String a1=r.getString(1);
	String a2=r.getString(2);
	String a3=r.getString(3);
	String a4=r.getString(4);
	String a5=r.getString(5);
	String a6=r.getString(6);
    String a7=r.getString(7);
	String a8=r.getString(8);
	String a9=r.getString(9);
	String a10=r.getString(10);
	String a11=r.getString(11);
	String a12=r.getString(12);
	String a13=r.getString(13);
%>

<td><a href="/hello/picked-cust.jsp?cust1=<%=a7%>&empno=<%=vpwd%>&empname=<%=vlname%>"\">
<%=a1%></a></td>
<td><%=a7%></td>
<td><%=a2%></td>
<td><%=a13%></td>
<td><%=a4%></td>
<td><%=a11%></td>
</tr>

<%}%>	

</table>
</body></html>
<%}//password if
else{
%>
<html><br><br><br><center><h3><i><font color="black">Invalid user name passward</font></i></h3>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body></html>
<%
}//else
}//pickup checking







 if(user.equals("Verification"))
{
String vsql1="select empname,phone,dept from emp where empname='"+vlname+"' and phone="+vpwd+"";
ResultSet rs=stmt.executeQuery(vsql1);
rs.next();
System.out.println("askjhagsikh");
String vempname=rs.getString("EMPNAME");
String vphone=rs.getString("PHONE");
String vdept=rs.getString("dept");

if(vlname.equals(vempname)&&vpwd.equals(vphone)&&user.equals(vdept)){


String vsql3="select * from customers where state='"+user+"'";

ResultSet rs1=null;
rs1=stmt.executeQuery(vsql3);
System.out.println("--"+vsql3);
%>
<html><body bgcolor="white">
<font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font>
<center><b><h4>NEW CUSTOMERS INFORMATION</h4></b></center>
<table align="center" bgcolor="wheat" border="2">
<tr><th><b>CustmerName</b></th><th><b>ContactNo</b></th><th><b>CustAddress</b></th><th><b>Emailid</b></th><th><b>Occupation</b></th><th><b>State</b></th></tr>
<tr>
<%while(rs1.next())
{
	String a1=rs1.getString(1);
	String a2=rs1.getString(2);
	String a3=rs1.getString(3);
	String a4=rs1.getString(4);
	String a5=rs1.getString(5);
	String a6=rs1.getString(6);
	String a7=rs1.getString(7);
	String a8=rs1.getString(8);
	String a9=rs1.getString(9);
	String a10=rs1.getString(10);
	String a11=rs1.getString(11);
	String a12=rs1.getString(12);
	String a13=rs1.getString(13);
	
	
	
	%>




<td><a href="/hello/verification.jsp?cust1=<%=a7%>&empno=<%=vpwd%>&empname=<%=vlname%>"\">
<%=a1%></a></td>
<td><%=a7%></td>
<td><%=a2%></td>
<td><%=a13%></td>
<td><%=a4%></td>
<td><%=a11%></td>
</tr>


<%}%>
</table>
</body></html>
<%
}//password checking if
else{
%>
<html><br><br><br><center><h3><i><font color="black">Invalid user name passward</font></i></h3>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body></html>
<%}//else
}//verification if

if(user.equals("Legal")){

String vsql1="select empname,phone,dept from emp where empname='"+vlname+"' and phone="+vpwd+"";
ResultSet rs=stmt.executeQuery(vsql1);
rs.next();
String vempname=rs.getString("EMPNAME");
System.out.println(vempname);
String vphone=rs.getString("PHONE");
System.out.println(vphone);
String vdept=rs.getString("dept");
System.out.println(vdept);

if(vlname.equals(vempname)&&vpwd.equals(vphone)&&user.equals(vdept)){
%>
===========================================================
<%
RequestDispatcher rd1=application.getRequestDispatcher("/legal.jsp?&empno="+vpwd+"&empname="+vlname);
rd1.forward(request,response);
//RequestDispatcher rd=application.getRequestDispatcher("/message.jsp?cpwd="+vone);
%>
=============================================================
<%}else{out.println("invalid user name and passward");}
}
}catch(SQLException  e){
System.out.println("..."+e);
out.println("<html><br><br><br><center><h3><i><font color=\"black\">invalid user name password</font></i></h3>"); %>
<body bgcolor="white" align="center">
<a href="/hello/main.jsp">home</a>
</body></html>
<%
}
%>
 
     <div class="fbg">
    <footer> 
    <jsp:include page="footer.jsp"/></footer>
  </div>
 