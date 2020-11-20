<header><jsp:include page="header.jsp"/></header>
<%@ page import="java.sql.*"%>
hi this is "sanctioned.jsp"
<html>
<head>
<script type="text/javascript">

</script>
</head>

<body bgcolor="white"><form method="post" action="sanctioned.jsp">





<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
String vsql="select empname from emp where dept='PickUp'";;
ResultSet rs=stmt.executeQuery(vsql);
%>
<table bgcolor="wheat">
<tr><td><select id="emp">
<%while(rs.next()){%>
<option><%=rs.getString("empname")%><%}%>
</select></td></tr>
<tr><td><input type="submit" name="sub" value="GetFiles" onClick="getInfo()"></td></tr>
</table>
</form>
</body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
