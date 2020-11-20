<header><jsp:include page="header.jsp"/></header>
<html><body bgcolor="white">
<H3 ALIGN="center"><a href="main.jsp">HOME PAGE</a></H3>
	</body>
</html>
<%@ page import="java.sql.*"%>
<% try{
String vcname=request.getParameter("cname");
String vaddr=request.getParameter("addr");
String vQualification=request.getParameter("Qualification");
String vOccupation=request.getParameter("Occupation");
String vCompany=request.getParameter("Company");
String vaddr1=request.getParameter("addr1");
String vContactno=request.getParameter("Contactno");
long vContactno1=Long.parseLong(vContactno);
String vSalary=request.getParameter("Salary");
String vDesignation=request.getParameter("Designation");
String vsex=request.getParameter("sex");
String vstate=request.getParameter("state");
String vemail=request.getParameter("email");
String vbank=request.getParameter("bank");

String vasignto="null";
//String vsanctioneddate="";
%>



<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con1.createStatement();
String vsql1="select sysdate from admin";
ResultSet rs1=stmt.executeQuery(vsql1);
rs1.next();

java.sql.Date d=rs1.getDate("SYSDATE");
//java.sql.Date d1=new Date(null);
java.sql.Date d1=null;
%>



<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

String vsql="insert into  customers values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(vsql);
pstmt.setString(1,vcname);
pstmt.setString(2,vaddr);
pstmt.setString(3,vQualification);
pstmt.setString(4,vOccupation);
pstmt.setString(5,vCompany);
pstmt.setString(6,vaddr1);
pstmt.setLong(7,vContactno1);
pstmt.setString(8,vSalary);
pstmt.setString(9,vDesignation);
pstmt.setString(10,vsex);
pstmt.setString(11,vstate);
pstmt.setString(12,vasignto);
pstmt.setString(13,vemail);
pstmt.setString(14,"NoB");
pstmt.setString(15,vbank);
pstmt.setDate(16,d);
pstmt.setDate(17,d1);
pstmt.executeUpdate();
out.print("<center> <font color=\"blue\"><BR><BR><B>THANK YOU FOR YOU ARE REGISTRATION <br></font></CENTER>");
out.print("<center> <font color=\"blue\"><BR><BR><B><A HREF=\"loans.jsp\"><B>BACK</A><br></font></CENTER>");
out.print("<center><td><a href=\"display.jsp\">Click here to Display</a></td></tr></center>");
}catch(Exception e){
System.out.println(e);
out.println("<center> <font color=\"blue\"><BR><BR><B>ALREADY REGISTERED WITH THIS CONTACT NO. TRY AGAIN</font></CENTER>");//
String vbank=request.getParameter("bank");%>//
<center><a href="bdisp.jsp?bank=<%=vbank%>"><b>BACK</a></center>

<%
}
%>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>

