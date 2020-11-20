<header><jsp:include page="header.jsp"/></header>
<%@ page import="java.sql.*"%>

<%String vone=request.getParameter("to2");
String vthr=request.getParameter("sub");
String vfor=request.getParameter("mess");
String vmail=request.getParameter("cwd");//email
String vpwd=request.getParameter("cpwd");//email
String vname=request.getParameter("cname");//name

//String vfive=request.getParameter("cdate");
String to1="admin";
//java.sql.Date d=new java.sql.Date();

//String s=d.toString();
//out.println(s);
%>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select sysdate from admin";
ResultSet rs=stmt.executeQuery(vsql);
rs.next();

java.sql.Date d=rs.getDate("SYSDATE");

String vsql3="select count(*) from messages";
ResultSet rs3=stmt.executeQuery(vsql3);
rs3.next();
Integer co=rs3.getInt("COUNT(*)");
//co+=100;
co+=co+(501211/5);
//out.println(co);

//con.close();

%>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>


<html><head><body bgcolor="white">


<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
String vsql1="insert into  messages values(?,?,?,?,?,?)";
PreparedStatement pstmt=con1.prepareStatement(vsql1);
pstmt.setInt(1,co);
pstmt.setString(2,vone);
pstmt.setString(3,to1);
pstmt.setString(4,vthr);
pstmt.setString(5,vfor);
//pstmt.setString(6,"cdate");
pstmt.setDate(6,d);
pstmt.executeUpdate();
con1.close();%>
<center><font color="blue" size="4">Ur message has been send successfully</font></center>
<%
}catch(Exception e){out.println(e);}%>

<b><center><a href="message.jsp?cpwd=<%=vpwd%>&cname=<%=vname%>"/">BACK</a></center></b>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>