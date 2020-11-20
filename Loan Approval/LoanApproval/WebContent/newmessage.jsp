<header><jsp:include page="header.jsp"/></header>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>


<%String vone=request.getParameter("cwd");//email
String vpwd=request.getParameter("cpwd");//email
String vname=request.getParameter("cname");//name

%>

<body bgcolor="white">
<center><b><font color="blue" size="4">Compose Message To Adminitration</b></font>
<form action="sendmess.jsp">
<table align="center"  border="2"bgcolor="wheat">
<tr><td><b><font size="4"color="red"><i>F</i></font>rom:</b></td><td><%=vone%></td></tr>
<tr><td><b><font size="4"color="red"><i>T</i></font>o:</b></td><td>Admin</td></tr>

<tr><td><b><font size="4"color="red"><i>S</i></font>ubject:</b></td><td><input type="text" name="sub"></td></tr>
<tr><td><b><font size="4"color="red"><i>M</i></font>essage:</b></td><td><textarea rows="5"cols="20" name="mess"></textarea> </td></tr>


<tr><td colspan="2" align="center"><input type="submit" value="send">
<b><a href="message.jsp?cpwd=<%=vpwd%>&cname=<%=vname%>"/">BACK</a></b></td></tr>
<input type="hidden" name="to2" value="<%=vone%>">
</table>
<input type="hidden" name="cwd" value="<%=vone%>">
<input type="hidden" name="cpwd" value="<%=vpwd%>">
<input type="hidden" name="cname" value="<%=vname%>">
</form>
</body>
</html><div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>