<header><jsp:include page="header.jsp"/></header>

<HTML><body bgcolor="white">
<form >
<table align="center" border="2"bgcolor="wheat">
<tr><td>TO</td><td>Admin</td></tr>


<%@ page import="java.sql.*"%>
<%String v=request.getParameter("bepid");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
String vsql="select * from  messages where  MSGID="+v;
ResultSet rs=stmt.executeQuery(vsql);
rs.next();%>



<tr><td>From</td><td><%=rs.getString("from1")%></td></tr>

<tr><td>Subject</td><td><%=rs.getString("MSGSUBJECT")%></td></tr>
<tr><td>Message</td><td><textarea name="msg" rows="5" cols="20"><%=rs.getString("MSG")%></textarea></td></tr>



<tr><td colspan="2" align="center"><a href="adminmessage.jsp"><b>BACK<b></a></td></tr>
<input type="hidden" name="to2" value="<%=v%>">
</table>
</form>
</body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
