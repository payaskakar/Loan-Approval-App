<header><jsp:include page="header.jsp"/></header>
<%@ page contentType="text/html"%>
<%@ page import="java.sql.*"%>

<% 
String vcname=request.getParameter("cname");
String vsex=request.getParameter("sex");
String vaddr=request.getParameter("addr");
String vcity=request.getParameter("city");
String vtac=request.getParameter("tac");
out.println("<center>"+vcname+"<center>");
%>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");


String vsql="insert into cinf values(?,?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(vsql);
pstmt.setString(1,vcname);
pstmt.setString(2,vsex);
pstmt.setString(3,vaddr);
pstmt.setString(4,vcity);
pstmt.setString(5,vtac);
pstmt.executeUpdate();
out.print("<center>Ur data has been stored successfully <center>");
out.print("<center><td><a href=\"display.jsp\">DISPLAY</a></td></tr><center>");

%>

<html><body bgcolor="white">
<a href="cust.jsp">BACK</a>
	</body>
</html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
