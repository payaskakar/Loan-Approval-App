
<header><jsp:include page="header.jsp"/></header>
<html><body><h4 align="center"><a href="main.jsp">LOGOUT</a></h4></body></html>
<%@ page contentType="text/html"%>
<%@ page import="java.sql.*"%>

<% 
String vdepid=request.getParameter("depid");
String vdepname=request.getParameter("depname");
%>

<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
String vsql="insert into dept values(?,?)";
PreparedStatement pstmt=con.prepareStatement(vsql);
pstmt.setInt(1,Integer.parseInt(vdepid));
pstmt.setString(2,vdepname);
pstmt.executeUpdate();

%>


<html>
<body bgcolor="white"><CENTER><BR><BR><BR>
<font color="BLUE"><h3><%=vdepname%> DEPARTMENT STORED SUCCESSFULLY </h3>
</font><BR>
<a href="dept.jsp"><B>BACK</a>
</CENTER>
</body>
</html>




<%}catch(Exception e){%>
<html>
<body bgcolor="white"><CENTER><BR><BR><BR>
<font color="BLUE"><h3> DEPARTMENT ID ALREADY EXIST TRY AGAIN <I>!</I> </h3>
</font><BR>
<i>
<a href="depaddnew.jsp"><B>BACK</a></i></font></CENTER>
</body>
</html>
<%}%>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>