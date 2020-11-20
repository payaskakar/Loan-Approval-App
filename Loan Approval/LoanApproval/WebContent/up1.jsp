<header><jsp:include page="header.jsp"/></header>
<%@ page import="java.sql.*"%>
<% 
String vbid=request.getParameter("bankid");
String vbankname=request.getParameter("bankname");
String vbranch=request.getParameter("branch");
String vaddress=request.getParameter("address");
System.out.println("V bankid"+vbid);

%>
<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
String vsql="update banks set bankname='"+vbankname+"',branch='"+vbranch+"',address='"+vaddress+"' where bankid="+vbid;

stmt.executeUpdate(vsql);
String h="select bankid, bankname,branch,address from banks where bankid="+vbid;
ResultSet rs=stmt.executeQuery(h);
rs.next();
rs.updateInt("bankid",Integer.parseInt(vbid));
rs.updateString("bankname",vbankname);
rs.updateString("branch",vbranch);
rs.updateString("address",vaddress);
rs.updateRow();
}

catch(SQLException e)
{
	System.out.println(e);
	}

%>
<%

//out.print("<td><a href=\"delete.jsp\">delete</a></td></tr>");

%>
<html>
<body bgcolor="white"><br><br>
<center>
<font color="BLUE"><h3><U><%=vbankname%></U> BANK INFORMATION UPDATED SUCCESSFULLY</h3><br>
</font>
<a href="newcb.jsp"><b>BACK</a>
</center></body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>

