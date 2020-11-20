<header><jsp:include page="header.jsp"/></header>

<html><body><h5 align="center"><a href="main.jsp">LOGOUT</a></h5></body></html>
<%@ page import="java.sql.*"%>


<%
String vone=request.getParameter("buil");
System.out.println(vone);
String vtwo=request.getParameter("sant");
System.out.println(vtwo);
String vthr=request.getParameter("cusname");
System.out.println(vthr);
%>




<%try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);



String vsql1="select sysdate from admin";
ResultSet rs1=stmt.executeQuery(vsql1);
rs1.next();

java.sql.Date d=rs1.getDate("SYSDATE");

/*int day=d.getDay();
System.out.println(day);
int m=d.getMonth();
System.out.println(m);
int y=d.getYear();
System.out.println(y);
String yy=

int y1=day+m+y;
System.out.println(y1);
*/
out.println(d);

//String vsql="select custname,state,buildername,SANCTIONEDDATE from customers where CUSTNAME='"+vthr+"'";
//ResultSet rs=stmt.executeQuery(vsql);


if(vtwo.equals("Reject")){
//rs.next();
String vsql="update customers set state='"+vtwo+"',buildername='nobuilder',SANCTIONEDDATE='"+d+"' where CUSTNAME='"+vthr+"'";
stmt.executeUpdate(vsql);
//rs.updateString("STATE",vtwo);
//rs.updateString("BUILDERNAME","nobuilder");
//rs.updateDate("SANCTIONEDDATE",d);
//rs.updateRow();	
out.println("data stored---reject");
}else
{
	System.out.println("######");
	String vsql2="update customers set state='"+vtwo+"',buildername='"+vone+"',SANCTIONEDDATE='"+d+"' where CUSTNAME='"+vthr+"'";
	System.out.println(vsql2);
	stmt.executeUpdate(vsql2);
	System.out.println("********");
	//rs.next();

//rs.updateString("STATE",vtwo);
//rs.updateString("BUILDERNAME",vone);
//rs.updateDate("SANCTIONEDDATE",d);
//rs.updateRow();
out.println("data stored");

}

}catch(Exception e){}%><html>
<body bgcolor="white" align="center">
<font color="white" align="center"><h3>DATA STORED</h3>
</font>
<html><body><h5 align="center"><a href="adminnew.jsp">ADMIN</a></h5></body></html>
<html><body><h5 align="center"><a href="vover.jsp">BACK</a></h5></body></html>
</body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>