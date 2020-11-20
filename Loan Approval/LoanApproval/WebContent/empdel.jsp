<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <font color="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>
<%@ page import="java.sql.*"%>

<% try{
String vs[]=request.getParameterValues("check");


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement();


for(int i=0;i<vs.length;i++)
 {
String vsql="delete from emp where empid="+vs[i];
stmt.executeUpdate(vsql);%>
<CENTER><B><FONT COLOR="BLUE">EMPLOYEE ID: 
<%
out.print(vs[i]);%>
<BR>
<%}%>
<html>
<body bgcolor="white">
<br><br><br><br>
<center><font color="blue" size="6"><H3><i> RECORDS DELETED SUCCESSFULLY</i></h3>
</font><a href="emp.jsp"><B>BACK<B></a>
</center>
</body>
</html>
<% }catch(java.lang.NullPointerException e)
{%>
<html>
<body bgcolor="white">
<html><body><h5 align="center"><a href="main.jsp">LOGOUT</a></h5></body></html>
<br><br><br><br>
<center><font color="blue" size="6"><H3><i>please Select data for deletetion</i></h3>
</font>
<a href="emp.jsp"><font color="blue" size="6">I want to select data</font></center></a>

</body>
</html>

<%}%>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>