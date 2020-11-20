<header><jsp:include page="header.jsp"/></header>

<%@ page import="java.sql.*"%>


<%


 try{
String vs[]=request.getParameterValues("check");


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();

for(int i=0;i<vs.length;i++)
 {
String vsql="delete from  messages where MSGID="+vs[i];
stmt.executeUpdate(vsql);
//vsql=null;
//out.print(vs[i]);
    
}
%>
<html>
<body bgcolor="white">
<center><font color="blue" size="5"><%out.println(vs.length);%>  Messages has been deleted successfully<br>
<a href="adminmessage.jsp"><b>BACK</b></a></center>
</font>
</body>
</html>
<% }catch(java.lang.NullPointerException e)
{%>
<html>
<body bgcolor="tan">
<br><br><br><br>
<center><font color="white" size="10"><H4><i>please Select data for deletetion</i></h4>
</font>

</body>
</html>

<%}%>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>