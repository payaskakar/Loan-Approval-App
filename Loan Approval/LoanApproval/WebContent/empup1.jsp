<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%@ page import="java.sql.*"%>
<% 
String vempid=request.getParameter("empid");
String vempname=request.getParameter("empname");
String vdesign=request.getParameter("design");
String vdept=request.getParameter("dept");
String vaddress=request.getParameter("address");
String vphone=request.getParameter("phone");
int vphone1=Integer.parseInt(vphone);
String vemail=request.getParameter("email");
%>
<%

try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

String vsql="update emp set empname='"+vempname+"',design='"+vdesign+"',dept='"+vdept+"',address='"+vaddress+"',phone='"+vphone1+"',email='"+vemail+"' where empid="+vempid;

stmt.executeUpdate(vsql);

}
catch(SQLException e)
{

}
/*String vsql="select empid,empname,design,dept,address,phone,email from emp where empid="+vempid;
ResultSet rs=stmt.executeQuery(vsql);
rs.next();
//rs.updateInt("empid",Integer.parseInt(vempid));
rs.updateString("empname",vempname);
rs.updateString("design",vdesign);
rs.updateString("dept",vdept);
rs.updateString("address",vaddress);
rs.updateInt("phone",vphone1);
rs.updateString("email",vemail);
rs.updateRow();
*/
%>

<html>
<body bgcolor="white"><center>
<font color="blue" size="6"><H3><b>EMPID:<i><%=vempid%></i>   <B>EMPLOYEE DATA UPDATED SUCCESSFULLY</h3>
</font><br><br>
<a href="emp.jsp"><b>BACK<b></a></center>
</body>
</html>


<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>