
<header><jsp:include page="header.jsp"/></header>
<html><body><h5 align="center"><a href="main.jsp">LOGOUT</a></h5></body></html>


<%@ page import="java.sql.*"%>
<% 
String vbid=request.getParameter("bankid");
int vbid1=Integer.parseInt(vbid);
System.out.println("Vbid"+vbid1);
String vdname=request.getParameter("depname");
System.out.println(vdname);

%>
<%


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
String vsql="update dept set depid='"+vbid1+"',depname='"+vdname+"' where depid="+vbid1;

stmt.executeUpdate(vsql);

/*String vsql="select depid,depname from dept where depid="+vbid;
System.out.println("Vsql"+vsql);
ResultSet rs=stmt.executeQuery(vsql);
rs.next();
//rs.updateInt("bankid",Integer.parseInt(vbid));
//rs.updateString("depid",vbid);
rs.updateString("depname",vdname);
//rs.updateString("address",vaddress);
rs.updateRow();	
*/
%>





<html>
<body bgcolor="white"><CENTER><BR><BR><BR>
<font color="BLUE"><h3> DEPARTMENT UPDATED  SUCCESSFULLY </h3>
</font><BR>
<a href="dept.jsp"><B>BACK</a>
</CENTER>
</body>
</html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>

