<header><jsp:include page="header.jsp"/></header>
<html><title>SmartOneEnterprice</title><body bgcolor="white">	


<center> <h3>SmartOneEnterprice<h3>
<table align="center"bgcolor="wheat" border=2>
<form action="admin.jsp">
<tr><td>LoginName</td><td><input name="lname"  type="text"/></td></tr>
<tr><td>Passward</td><td><input name="pwd"type="password"/></td></tr>
<tr><td>UserType</td><td>
<select name="user">
<option> Admin
<option>Cust
<option>emp
</select></TD></tr>
<tr><td align="center" colspan="2"><input  name="Login"type="submit" value="Login">
<input name="reset" type="reset"value="Reset"/></td></tr></table>
<h5 align="center"><font size="4"><a href="loans.jsp">RegisterNewCustomer</font></h5></a>
</form>
</body>

</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
