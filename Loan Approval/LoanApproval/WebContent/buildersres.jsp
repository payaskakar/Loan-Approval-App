<header><jsp:include page="header.jsp"/></header>
<html><body  align="center">
 <font colo="blue"><h4 align="center"><a href="main.jsp"> LOGOUT</a></h4></font></body></html>


<%@ page import="java.sql.*"%>

<%!
String empno1;
String ename1;
%>

<%

try{
try{
	System.out.println("^^^^^^^^^^^^^^");
String v=request.getParameter("fave");
int v1=Integer.parseInt(v);
System.out.println(v1);
String vreg=request.getParameter("reg");
System.out.println(vreg);
String vo=request.getParameter("reas");
System.out.println(vo);
//String ename1=request.getParameter("ename");
//System.out.println(ename1);
empno1=(String)session.getAttribute("empno1");
ename1=(String)session.getAttribute("ename1");
//String empno1=request.getPararameter("empno");

System.out.println("..........builders.jsp"+empno1);
System.out.println("..........builders.jsp"+ename1);
 Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");

Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
System.out.println("#########");
String vsql1="update builders_details set APFNO='"+v1+"',REASON='noreason' where regno="+vreg;
stmt.executeUpdate(vsql1);
//String vsql="select APFNO,REASON from builders_details where regno="+vreg;
//ResultSet rs=stmt.executeQuery(vsql);
//rs.next();
//rs.updateLong("APFNO",Long.parseLong(v));
//rs.updateString("REASON","noreason");

//rs.updateRow();	

%>
<html>
<body bgcolor="white"><br><br><br><center>
<font color="blue" size="14"><i>u r data stored successfully</i>
<center><b><a href="newcheck.jsp?lname=<%=ename1%>&pwd=<%=empno1%>&user=Legal&Login=Login">BACK</a></b></center>
</font>
</body>
</html><%
}catch(NumberFormatException e){
//----------------------------------------
System.out.println("!!!!!!!!!!!!!!!!");
String v=request.getParameter("fave");
System.out.println(v);
String vreg=request.getParameter("reg");
System.out.println(vreg);
//String ename1=request.getParameter("ename");
//String empno1=request.getParameter("empno");

empno1=(String)session.getAttribute("empno1");
System.out.println(empno1);
ename1=(String)session.getAttribute("ename1");

System.out.println(ename1);
String vo=request.getParameter("reas");

System.out.println(vo);
System.out.println("@@@@@@@@");
if(vo.equals("null")){
Integer l=new Integer(0000);
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","soe","soe");
Statement stmt1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
String vsql2="update builders_details set APFNO='"+l+"' and REASON='"+vo+"' where regno="+vreg;
stmt1.executeUpdate(vsql2);
//String vsql="select APFNO,REASON from builders_details where regno="+vreg;
//ResultSet rs=stmt.executeQuery(vsql);
//rs.next();
//rs.updateLong("APFNO",l);
//rs.updateString("REASON",vo);

//rs.updateRow();	
%>
<html>
<body bgcolor="white"><br><br><br>
<center><font color="blue" size="2"><i>Data has been stored successfully</i>
</font>
<b><a href="newcheck.jsp?lname=<%=ename1%>&pwd=<%=empno1%>&user=Legal&Login=Login">BACK</a></b></center>
</body>
</html><%
}else{%>
<html>
<body bgcolor="white"><br><br><br><center>
<font color="blue" size="3"><i>Please Enter The Reason For Builder </i>
</font><br>
<center><b><a href="newcheck.jsp?lname=<%=ename1%>&pwd=<%=empno1%>&user=Legal&Login=Login">BACK</a></b></center>
</body>
</html>
<%
}
}
}catch(Exception e)
{
out.println(e);
}
%>


<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>