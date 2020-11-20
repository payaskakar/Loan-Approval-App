<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<header><jsp:include page="header.jsp"/></header>
     <div class="main">
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
       <html>

<center> <h3>LOAN APPROVAL SYSTEM <h3>
<table align="center"border=2>
<form action="newcheck.jsp">
<tr><td><b>LoginName</b></td><td><input name="lname"  type="text"/></td></tr>
<tr><td><b>Password</b></td><td><input name="pwd"type="password"/></td></tr>
<tr><td><b>UserType</td><td>
<select name="user">
<option><b> Admin</b>
<option><b>Cust</b>
<option><b>PickUp</b>
<option><b>Verification</b>
<option><b>Legal</b>
</select></TD></tr>
<tr><td align="center" colspan="2"><input  name="Login"type="submit" value="Login">
<a href="frgtpwd.jsp">Forget Password?</a></td></tr></table>
<h5 align="center"><font size="4"><a href="loans.jsp">Register New Customer</font></h5></a>
</form>
</body>

</html>
       
        <div class="article">
           </div>
      </div>
  <sidebar> 
    <jsp:include page="sidebar.jsp"/></sidebar>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <footer> 
    <jsp:include page="footer.jsp"/></footer>
  </div>
</body>
</html>
