<header><jsp:include page="header.jsp"/></header>
<html><body><h5 align="center"><a href="main.jsp">LOGOUT</a></h5></body></html>


<%@ page import="java.sql.*"%>



<% try{
String vs[]=request.getParameterValues("check");


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement();

for(int i=0;i<vs.length;i++)
 {
String vsql="delete from dept where depid="+vs[i];
stmt.executeUpdate(vsql);
//vsql=null;
//out.print(vs[i]+" u r data deleted successfully");
    
}

%>
<html>
<body bgcolor="white"><CENTER><BR><BR><BR>
<font color="BLUE"><h3> DEPARTMENT INFORMATION DELETED SUCCESSFULLY </h3>
</font><BR>
<a href="dept.jsp"><B>BACK</a>
</CENTER>
</body>
</html>
<% }catch(java.lang.NullPointerException e)
{%>
<html>
<body bgcolor="white">
<br><br><br><br>
<center><font color="blue" size="6"><H3><i>please Select data for deletetion</i></h3>
</font>
<a href="dept.jsp"><font color="blue" size="6">I want to select data</font></center></a>
</body>
</html>

<%}%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>