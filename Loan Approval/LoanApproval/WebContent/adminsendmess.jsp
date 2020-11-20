<header><jsp:include page="header.jsp"/></header>

<%@ page import="java.sql.*"%>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>


<%String vone=request.getParameter("to2");

String vthr=request.getParameter("sub");
String vfor=request.getParameter("mess");

String vid=request.getParameter("mails");

%>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();
String vsql="select sysdate from admin";
ResultSet rs=stmt.executeQuery(vsql);
rs.next();

java.sql.Date d=rs.getDate("SYSDATE");


//con.close();
String vsql3="select count(*) from messages";
ResultSet rs3=stmt.executeQuery(vsql3);
rs3.next();
Integer co=rs3.getInt("COUNT(*)");
co+=co+(501211/3);
//out.println(co);

%>




<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
String vsql1="insert into  messages values(?,?,?,?,?,?)";
PreparedStatement pstmt=con1.prepareStatement(vsql1);
pstmt.setInt(1,co);
pstmt.setString(2,vone);
pstmt.setString(3,vid);
pstmt.setString(4,vthr);
pstmt.setString(5,vfor);
pstmt.setDate(6,d);
pstmt.executeUpdate();
}catch(Exception e){out.println(e);}
%> 
<html><body bgcolor="white">
<center><b>Message has been successfully sent</b><br>
<a href="adminmessage.jsp"><b>BACK</b></a></center>
</body></html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
