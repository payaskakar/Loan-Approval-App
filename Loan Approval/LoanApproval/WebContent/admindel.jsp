<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>


<%@ page import="java.sql.*"%>

<% try{
String vs[]=request.getParameterValues("check");
String vone=request.getParameter("bank");


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();

for(int i=0;i<vs.length;i++)
 {
String vsql="delete from BANK_LOANS where loanid="+vs[i];
stmt.executeUpdate(vsql);
//vsql=null
   
}%>


<html>
<body bgcolor="white"><FORM><BR><BR><BR>
<CENTER>
<font color="BLUE" size="4">Records Deleted<BR>
<a href="adminbdisp.jsp?bank=<%=vone%>"><b>BACK</a>

</CENTER></font></FORM>
</body>
</html>
<% 
}catch(java.lang.NullPointerException e)

{String vone=request.getParameter("bank");

%>
<html>
<body bgcolor="white">
<br><br><br><br>
<center><font color="BLUE" size="5"><H4><i>please Select data for deletetion</i></h4>
</font>
<a href="adminbdisp.jsp?bank=<%=vone%>"><font color="BLUE" size="5">I want to select data</font></center></a>
</body>
</html>

<%}%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>