<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <h4 align="center"><a href="main.jsp"> HOMEPAGE</a></h4></body></html>
<html>
<head>
	</head>	

<body bgcolor="white"><form action="cust-inf.jsp">
<SCRIPT LANGUAGE='javaScript'>
	var toDay=new Date();
	document.write(toDay);
	document.write(toDay.getDate());
	</SCRIPT>


<table align="center" bgcolor="wheat" size="100" border="10">
<caption><h4><font color="white">CustmerInformationForm</font></h4></caption>
<tr>
	<td>CustumerName</td>
	<td><input type="text" name="cname"></td>
</tr>
<tr>
	<td>Gender</td>
	<td><input type="radio" name="sex" value="male">Male
	<input type="radio" name="sex"value="female">Female</td>
</tr>
<tr>
	<td>Address</td>
	<td><textarea rows="3"cols="30" name="addr"></textarea></td>
</tr>
<tr>
	<td>City</td>
	<td><select name="city">
		<option>Anantapur
		<option>Chittoor
		<option>Tirupathi
		<option>Palamaner
		<option>Vishakapatnam
		<option>Vijayawada
		<option>Hyderabad
		<option>Kadapa
		<option>Karnool
		<option>Hindupur
		<option>Puttaparthi
	    </select>
	</td>
</tr>
<tr>
	<td>Type of A/c</td>
	<td>
		<select name="tac">
		<option>Current
		<option>Savings
		<option>Loan
		<option>Lockers
		<option>FixedDepo
	    </select>
	
	</td>
</tr>
<tr>
	
	<td align="center"colspan="2"><input type="submit" value="submit"></td>
	
	
</tr>

</table>
</form>

</body>
</html>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>

