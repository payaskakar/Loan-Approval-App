<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%@ page import="java.sql.*"%>

<% try{
String vs[]=request.getParameterValues("check");
String ename1=request.getParameter("ename");
//out.println(ename1);
String empno1=request.getParameter("empno");
//out.println(empno1);



Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");


Statement stmt=con.createStatement();

for(int i=0;i<vs.length;i++)
 {
String vsql="delete from builders_details where REGNO="+vs[i];
stmt.executeUpdate(vsql);
//vsql=null;
//out.println(vs[i]);
    
}
%>
<html>
<body bgcolor="white">
<center><font color="blue" size="5">Records has been deleted successfully
<br	><b><a href="newcheck.jsp?lname=<%=ename1%>&pwd=<%=empno1%>&user=Legal&Login=Login">BACK</a></b></center>
</font>
</body>
</html>
<% }catch(java.lang.NullPointerException e)
{
String ename1=request.getParameter("ename");

String empno1=request.getParameter("empno");

%>
<html>
<body bgcolor="tan">
<br><br><br><br>
<center><font color="white" size="10"><H4><i>please Select data for deletetion</i></h4>
</font>
<center><b><a href="newcheck.jsp?lname=<%=ename1%>&pwd=<%=empno1%>&user=Legal&Login=Login">I want to select data</a></b></center>
<font color="white" size="10"></font></center></a>
</body>
</html>

<%}%>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
