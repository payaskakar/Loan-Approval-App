<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%@ page import="java.sql.*"%>
<%
String vs1=request.getParameter("ltype");
String vs2=request.getParameter("intrate");
double vs5=Double.parseDouble(vs2);
String vs3=request.getParameter("bank");
String vs4=request.getParameter("bank1");

%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");


Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

String vsql="update bank_loans set LOANTYPE='"+vs1+"',INTERESTRATE='"+vs5+"' where LOANID="+vs4;

stmt.executeUpdate(vsql);


/*String vsql="select LOANTYPE,INTERESTRATE from bank_loans where  LOANID="+vs4;
System.out.println(vsql);
ResultSet rs=stmt.executeQuery(vsql);
rs.next();
//
rs.updateString("LOANTYPE",vs1);
rs.updateDouble("INTERESTRATE",Double.parseDouble(vs2));
//rs.updateInt("bankid",);
//rs.updateString("address",vaddress);
rs.updateRow();
*/
%>

<html>
<body bgcolor="white"><br><br>
<center><font color="BLUE" size="5"><H3>LOAN INFO UPDATED SUCCESSFULLY</h3>
<a href="adminbdisp.jsp?bank=<%=vs3%>"><h>BACK<h></a></center>
</font>
</body>
</html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
