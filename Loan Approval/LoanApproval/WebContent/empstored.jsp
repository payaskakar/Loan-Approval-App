<header><jsp:include page="header.jsp"/></header>
<%@ page import="java.sql.*"%>

<% 
try{
String vempid=request.getParameter("empid");
String vempame=request.getParameter("empname");
String vempdesig=request.getParameter("design");
String vdept=request.getParameter("dept");
String vempaddress=request.getParameter("address");
String vphone=request.getParameter("phone");
String vemail=request.getParameter("email");
%>


<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
String vsql="insert into emp values(?,?,?,?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(vsql);
pstmt.setInt(1,Integer.parseInt(vempid));
pstmt.setString(2,vempame);
pstmt.setString(3,vempdesig);
pstmt.setString(4,vdept);
pstmt.setString(5,vempaddress);
pstmt.setString(6,vphone);
pstmt.setString(7,vemail);
pstmt.executeUpdate();

%>

<html>
<body bgcolor="white"><BR><BR><BR>
<center>
<font color="blue" size="6"><h3><%=vempame%> EMPLOYEE  DATA STORED SUCCESSFULLY</h3>
</font>
<a href="emp.jsp"><b>BACK</a></center>
</body>
</html>




<%
}catch(Exception e){

%>
<html>
<body bgcolor="white"><CENTER><BR><BR><BR>
<font color="blue" style="tahoma">
<H3>Sorry Aleady record exist with this ID...</H3>
<i>
<a href="emp.jsp"><B>BACK</a></i></font><CENTER>
</body>
</html>
<%}%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>