<header><jsp:include page="header.jsp"/></header>

<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>

<%@ page import="java.sql.*"%>
<%
String ename1=request.getParameter("ename");
//out.println(ename1);
String empno1=request.getParameter("empno");
//out.println(empno1);
%>
<html>
<body bgcolor="white">

<% 


String vbname=request.getParameter("bname");
String voaddr=request.getParameter("oaddr");
String vregno=request.getParameter("regno");
String vpan=request.getParameter("pan");
String vphone=request.getParameter("phone");
String vemail=request.getParameter("email");
String vwebs=request.getParameter("webs");
String vlp=request.getParameter("lp");
String vhuda=request.getParameter("huda");
String vnoc=request.getParameter("noc");
String vbp=request.getParameter("bp");
String vec=request.getParameter("ec");
try{
if(vlp.equals("YES"))
	{vlp="YES";}
}catch(java.lang.NullPointerException e){vlp="NO";}

try{
if(vhuda.equals("YES"))
	{vhuda="YES";}
}catch(java.lang.NullPointerException e){vhuda="NO";}


try{
if(vnoc.equals("YES"))
	{vnoc="YES";}
}catch(java.lang.NullPointerException e){vnoc="NO";}

try{
if(vbp.equals("YES"))
	{vbp="YES";}
}catch(java.lang.NullPointerException e){vbp="NO";}

try{
if(vec.equals("YES"))
	{vec="YES";}
}catch(java.lang.NullPointerException e){vec="NO";}


%>



<%
int l=new Integer(000);
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

String vsql="insert into  builders_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(vsql);
pstmt.setString(1,vbname);
pstmt.setString(2,voaddr);
pstmt.setInt(3,Integer.parseInt(vregno));
pstmt.setString(4,vpan);
pstmt.setInt(5,Integer.parseInt(vphone));
pstmt.setString(6, vemail);
pstmt.setString(7,vwebs);
pstmt.setString(8,vlp);
pstmt.setString(9,vhuda);
pstmt.setString(10,vnoc);
pstmt.setString(11,vbp);
pstmt.setString(12,vec);
pstmt.setInt(13,l);
pstmt.setString(14,"NewBuilder");
pstmt.executeUpdate();
%>

<html>
<body bgcolor="white"><br><br><br><center>
<font color="white"><h3>U R DATA WILL BE VERIFIED</h3>
</font>
<I><B>THANK Q</B></I>
<center><br><a href="main.jsp">LOGOUT</a>
<center><b><a href="newcheck.jsp?lname=<%=ename1%>&pwd=<%=empno1%>&user=Legal&Login=Login">BACK</a></b></center>
</body>
</html>


<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>