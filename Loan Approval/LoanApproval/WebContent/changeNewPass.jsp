
<header><jsp:include page="header.jsp"/></header>






<%
try{

String vOne=request.getParameter("POne");
System.out.println(vOne);
String vTwo=request.getParameter("PTwo");
System.out.println(vTwo); 
String vmail=request.getParameter("vemail");
System.out.println(vmail);
if(vOne.equals(vTwo))
{
//out.println("Both are equal"); 
RequestDispatcher rd1=application.getRequestDispatcher("/saveNewPass.jsp?vmail="+vmail+"");
rd1.forward(request,response);
}
else
{
RequestDispatcher rd1=application.getRequestDispatcher("/errorPass.jsp");
rd1.forward(request,response);
//out.println("both are not equal");
}

}catch(Exception e){
System.out.println("THIS IS ERROR FROM "+e);}
%>
<div class="fbg"><footer><jsp:include page="footer.jsp"/></footer>
  </div>
