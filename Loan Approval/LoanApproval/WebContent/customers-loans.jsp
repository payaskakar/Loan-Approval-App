<header><jsp:include page="header.jsp"/></header>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>
<%@ page import="java.sql.*"%>
<%
try{
String vone=request.getParameter("cust");
String vtwo=request.getParameter("mail");
String ename=request.getParameter("ename");
String empno=request.getParameter("empno");

%>



<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="insert into customer_loan_details values(?,?,?,?,?,?,?,?,?,?)";

String yes="yes";
String var="Verification";
PreparedStatement pstmt=con.prepareStatement(vsql);
pstmt.setString(1,vone);
pstmt.setString(2,vtwo);
pstmt.setString(3,yes);
pstmt.setString(4,yes);
pstmt.setString(5,yes);
pstmt.setString(6, yes);
pstmt.setString(7,yes);
pstmt.setString(8,yes);
pstmt.setString(9,yes);
pstmt.setString(10,yes);
//pstmt.setString(11,var);
pstmt.executeUpdate();

%>




<%

String vsql1="update customers set state='Verification' where custname='"+vone+"' and emailid='"+vtwo+"'";
stmt.executeUpdate(vsql1);
%>
<html>
<body bgcolor="white"><br><br><br><br><center><h2><i><%=vone%> data has been Verified Successfully</i></h2>
<center><a href="newcheck.jsp?lname=<%=ename%>&pwd=<%=empno%>&user=PickUp&Login=Login"><b>BACK</b></a></center>
</body></html>
<%
}catch(Exception e1){out.println("**"+e1);}
%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
