<header><jsp:include page="header.jsp"/></header>
<HTML><BODY ALIGN="center"><H3 ALIGN="center"><a href="main.jsp">LOGOUT</a></H3></BODY></HTML>
<%@ page import="java.sql.*"%>

<html>
<head>
	
</head>	

<body bgcolor="white">
<script type="text/javascript">
/*function getOptions()
{
var x=document.getElementById("bank");
var c=x.options[x.selectedIndex].text;
var txt=document.getElementById("result").value
document.getElementById("result").value=c
}*/
 //var abc=1;

</script>


<form action="adminbdisp.jsp">
<h6 align="center"><br>
<font size="5" color="blue" align="center" stlye="thahoma">SELECT BANK TYPE</h6></font>


<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

String vsql="select *  from banks";
ResultSet rs=stmt.executeQuery(vsql);%>
<select  size ="0" name="bank" id="bank"  ALIGN="center" onchange="getOptions()">

<%
while(rs.next()){
%>
<option><%=rs.getString("bankname")%></option>
<%}%>
</select>
<input type="submit"  ALIGN="center" value="Result">

<BR><CENTER><a href="adminnew.jsp">ADMIN</a>
</form >
</body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>