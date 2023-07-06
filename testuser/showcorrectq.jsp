<%@ include file="conn.jsp" %>
<%
ResultSet rst=(ResultSet)session.getAttribute("rst");
int qn=Integer.parseInt(request.getParameter("qn"));
rst.absolute(qn);
int []ans=(int[])session.getAttribute("answer");
int []answers=(int[])session.getAttribute("answers");
int x=ans[qn-1];
%>
<table style='font-weight:bold;font-size:20px;margin-bottom:10px'>
  <tr>
      <td>
         <%=qn%>)<%=rst.getString(3)%>?
      </td>
   </tr>
  </table>
  <table style='font-style:italic;font-weight:bold;font-size:17px' cellpadding='5px'>
  <tr><td><input type="radio" name="bt" <%if(x==1){out.println("checked");}%> />&nbsp;<%=rst.getString(4)%></td></tr>
  <tr><td><input type="radio" name="bt" <%if(x==2){out.println("checked");}%> />&nbsp;<%=rst.getString(5)%></td></tr>
  <tr><td><input type="radio" name="bt" <%if(x==3){out.println("checked");}%> />&nbsp;<%=rst.getString(6)%></td></tr>
  <tr><td><input type="radio" name="bt" <%if(x==4){out.println("checked");}%> /><%=rst.getString(7)%></td></tr>
</table>
<hr style='border:2px solid red;margin-top:10px'>
<h3 style='margin-top:10px'>Correct answer is:<%=answers[qn-1]%></h3>