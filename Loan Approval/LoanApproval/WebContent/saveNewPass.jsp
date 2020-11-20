
<header><jsp:include page="header.jsp"/></header>
<%@ page import="java.sql.*"%>
<% 
String vpOne=request.getParameter("POne");
String vpTwo=request.getParameter("PTwo");
String vmail=request.getParameter("vemail");

%>

<%
try{

	

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
String vsql ="update CUSTOMERS set emailid='"+vpTwo+"' where emailid='"+vmail+"'";
//String vsql="select emailid from CUSTOMERS where emailid='"+vmail+"'";

//out.println(vsql);
stmt.executeUpdate(vsql);
//ResultSet rs=stmt.executeQuery(vsql);
//rs.next();
//rs.updateString("EMAILID",vpTwo);
//rs.updateRow();
}catch(Exception e){System.out.println("THIS IS FROM SAVE"+e);}
%>
<html>
<body bgcolor="white"><center><br><br><br><br><br>
<font color="blue" size="6"><H3><B> SUCCESSFULLY  YOUR PASSWORD CHANGED</h3>
</font><br><br>
</body>
</html>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
