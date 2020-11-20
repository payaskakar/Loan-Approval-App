<header><jsp:include page="header.jsp"/></header>
<%@ page contentType="text/html"%>
<%@ page import="java.sql.*"%>

<% 
String vbid=request.getParameter("bankid");
String vbankname=request.getParameter("bankname");
String vbranch=request.getParameter("branch");
String vaddress=request.getParameter("address");

%>

<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
String vsql="insert into banks values(?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(vsql);
pstmt.setInt(1,Integer.parseInt(vbid));
pstmt.setString(2,vbankname);
pstmt.setString(3,vbranch);
pstmt.setString(4,vaddress);
pstmt.executeUpdate();

%>


<html>
<body bgcolor="white"><br><br>
<center>
<font color="white"><h3><u><%=vbankname%></u>  BANK INFORMATION STORED SUCCESSFULLY</h3><br>
</font>
<a href="newcb.jsp"><b>BACK</a>
</center></body>
</html>




<%}catch(Exception e){
//out.println("<h>Sorry Aleady record exist with this ID...");
%>
<html>
<body bgcolor="white"><br><br><br><br>
<center><font color="blue" style="tahoma"><i>
<b>Sorry Aleady record exist with this ID<br>
<a href="newcb.jsp"><b>BACK</a></i></font></center>
</body>
</html>
<%}%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>