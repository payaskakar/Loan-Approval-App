<header><jsp:include page="header.jsp"/></header>

<%@ page import="java.sql.* "%>
<%@ page import="java.sql.ResultSet"%>

<html><body  align="center">
 <font color="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

 
<%
try{
String vcontno=request.getParameter("contactno");
String vstate=request.getParameter("state");
String vasign=request.getParameter("assign");
long l=Long.parseLong(vcontno);

System.out.println(vstate+vasign+l);
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement();

//String vsql="select assignto, state from customers where contactno="+l;
String vsql="update customers set STATE='"+vstate+"',ASSIGNTO='"+vasign+"' where contactno="+l; 



int i=stmt.executeUpdate(vsql);
//rs.next();
//rs.updateString("STATE",vstate);
//rs.updateString("ASSIGNTO",vasign);
//
//rs.updateRow();

%>
<html><body bgcolor="white"><br><br><br><br><center><font color="blue"><h3>

<%out.println("Task is assigned to "+vasign);
}catch(Exception e){out.println(e);}
%></h3><a href="cust-disp.jsp"><h5>NewCustomersInformation</a></h5>
<h5><a href="adminnew.jsp">ADMIN</a></h5></font>
</body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
