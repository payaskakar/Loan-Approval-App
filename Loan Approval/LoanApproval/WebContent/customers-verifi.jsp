<header><jsp:include page="header.jsp"/></header>


<%@ page import="java.sql.*"%>
<%
try{
String vone=request.getParameter("cust");
String vtwo=request.getParameter("mail");
String vthr=request.getParameter("phone");
Long vthr1=Long.parseLong(vthr);
String ename1=request.getParameter("ename");
String empno1=request.getParameter("empno");

%>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="insert into  customers_verification values(?,?,?,?,?,?)";
String yes="yes";
String var="VerificationOver";

PreparedStatement pstmt=con.prepareStatement(vsql);
pstmt.setString(1,vone);
pstmt.setString(2,vtwo);
pstmt.setLong(3,vthr1);
pstmt.setString(4,yes);
pstmt.setString(5,yes);
pstmt.setString(6, yes);
pstmt.executeUpdate();

String vsql1="update customers set state='Verificationover' where custname='"+vone+"' and contactno="+vthr+" and emailid='"+vtwo+"'";
stmt.executeUpdate(vsql1);%>
<html>
<body bgcolor="white"><br><br><br><br><center><h2><i><%=vone%> data has been Verifiedover Successfully</i></h2></center>
<center><b><a href="newcheck.jsp?lname=<%=ename1%>&pwd=<%=empno1%>&user=Verification&Login=Login">BACK</a></b></center>
</body></html>
<%
}catch(Exception e1){out.println("**"+e1);}
%>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>