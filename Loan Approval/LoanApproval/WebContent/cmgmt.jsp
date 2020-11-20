<header><jsp:include page="header.jsp"/></header>


<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%String v=request.getParameter("cpwd");
String vlname=request.getParameter("avlname");
String apwd=request.getParameter("vapwd");

%>
<html>
<body bgcolor="white"><form>
	<center><caption><font  color="blue"><h4>CustomerManagement</h4></font></caption></center>
<a href="customerstate.jsp?cpwd=<%=v%>&cname=<%=vlname%>"\"> <font color="black">Customers Status</font></a><br><br>
<a href="message.jsp?cpwd=<%=v%>&cname=<%=vlname%>"\"><font color="black">Messages</font></a> <BR>
<BR>
<a href="changePassword.jsp?cpwd=<%=v%>&cname=<%=vlname%>"\"><font color="black">ChangePassword</font></a>


<input type="hidden" disabled="true" name="cname" value="<%=vlname%>">

<input type="hidden" disabled="true" name="cname" value="<%=vlname%>">
<input type="hidden"  name="vemail" value="<%=apwd%>">


</form>
</body></html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
