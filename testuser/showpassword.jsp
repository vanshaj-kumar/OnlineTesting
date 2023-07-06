<%
 if(request.getParameter("ans").equals((String)session.getAttribute("ans")))
 {
   out.println("Your password is:"+session.getAttribute("password"));
 }
 else
 {
   out.println("<font color='red'>Entered answer is wrong</font>");
 }
%>
 