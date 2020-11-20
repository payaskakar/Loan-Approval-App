<header><jsp:include page="header.jsp"/></header>
<html>
<head>
	
</head>
<%@ page import="java.sql.*"%>
<body bgcolor="white">
<script type="text/javascript">
/*function getOptions()
{
var x=document.getElementById("bank");
var c=x.options[x.selectedIndex].text;
var txt=document.getElementById("result").value
document.getElementById("result").value=c
}*/
 var abc=1;


</script>

<form action="bdisp.jsp">
<h6 align="center"><BR><BR><BR><BR>
<font size="4" color="BLUE" align="center" stlye="thahoma">SELECT BANK TYPE</h6></font>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

String vsql="select *  from banks";
ResultSet rs=stmt.executeQuery(vsql);%><center>
<select  size ="0"name="bank" id="bank"  align="center" onchange="getOptions()">

<%
while(rs.next()){
%>
<option><%=rs.getString("bankname")%></option>
<%}%>
</select>
<input type="submit" id="result" align="center"  value="GET INFO">
<center><br><a href="main.jsp">HOME PAGE</a>
</form >
</body>
</html>

<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>