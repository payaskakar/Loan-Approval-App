
<header><jsp:include page="header.jsp"/></header>

<%@ page import="java.sql.*"%>

<% try{
String vs[]=request.getParameterValues("check");


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement();


for(int i=0;i<vs.length;i++)
 {
String vsql="delete from banks where bankid="+vs[i];
stmt.executeUpdate(vsql);
//vsql=null;
//out.print(vs[i]+" u r data deleted successfully");
    
}
%>
<html>
<body bgcolor="white"><br><br>
<center>
<font color="white"><h3> BANKS INFORMATION DELETED SUCCESSFULLY</h3><br>
</font>
<a href="newcb.jsp"><b>BACK</a>
</center></body>
</html>

<% }catch(java.lang.NullPointerException e)
{%>
<html>
<body bgcolor="white">
<br><br><br><br>
<center><font color="BLUE" size="6"><H4><i>please Select data for deletetion</i></h4>
</font>
<a href="newcb.jsp"><font color="BLUE"size="6" >I want to select data</font></center></a>
</body>
</html>

<%}%>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
