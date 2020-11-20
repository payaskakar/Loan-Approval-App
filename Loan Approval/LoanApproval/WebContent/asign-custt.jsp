<header><jsp:include page="header.jsp"/></header>


<%@ page import="java.sql.*"%>
<html><body  align="center">
 <font color="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

 
<%

try{
String vcontno=request.getParameter("contno");
String vstate=request.getParameter("state");
String vasign=request.getParameter("assign");
int l=Integer.parseInt(vcontno);
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
String vsql="select assignto, state from customers where contactno="+l;
ResultSet rs=stmt.executeQuery(vsql);
rs.next();
rs.updateString("STATE",vstate);
rs.updateString("ASSIGNTO",vasign);
rs.updateRow();%>
<html><body bgcolor="white"><br><br><br><br><center><font color="blue"><h3>

<%out.println("Task is assigned to "+vasign);
}catch(Exception e){out.println(e);}
%></h3><a href="cust-disp.jsp"><h5>NewCustomersInformation</a></h5>
<h5><a href="adminnew.jsp">ADMIN</a></h5></font>
</body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
