<header><jsp:include page="header.jsp"/></header>
<%@ page import="java.sql.*"%>

<%String vthr=request.getParameter("ltype");
String vfor=request.getParameter("intrate");
String vone=request.getParameter("bank");
//String vtwo=request.getParameter("bank1");

%>


<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();

String vsql3="select count(*) from bank_loans";
ResultSet rs3=stmt.executeQuery(vsql3);
rs3.next();
int co=rs3.getInt("COUNT(*)");
co+=co+(501211/3);
//out.println(co);
con.close();
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

String vsave="insert into bank_loans values(?,?,?,?)";
PreparedStatement pstmt=con1.prepareStatement(vsave);
pstmt.setString(1,vone);
pstmt.setString(2,vthr);
pstmt.setString(3,vfor);
pstmt.setInt(4,co);
pstmt.executeUpdate();
con1.close();
%>
<html><body BGCOLOR="white"><BR><BR><BR>
<center><b><FONT COLOR="BLUE"> Data Successfuly stored</FONT></b></center>
<center><a href="adminbdisp.jsp?bank=<%=vone%>"><h>BACK<h></a></center>
</html></body>
<%}catch(Exception e){
out.println("<html><body bgcolor=\"white\"><center><b>Please Enter a Valid Data</center></body></html>");}%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>