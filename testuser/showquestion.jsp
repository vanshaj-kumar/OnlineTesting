<%@ include file="conn.jsp" %>
<%
ResultSet rst=(ResultSet)session.getAttribute("rst");
if(request.getParameter("qn")==null)
{
  int n=Integer.parseInt(request.getParameter("bp"));
  if(n==1)
    rst.first();
  else if(n==2)
    rst.previous();
  else if(n==3)
    rst.next();
  else 
    rst.last();
}
else
  rst.absolute(Integer.parseInt(request.getParameter("qn")));
int qn=rst.getRow(); 
session.setAttribute("qn",qn);
int []ans=(int[])session.getAttribute("answer");
int x=ans[qn-1];
%>
<input type='hidden' id='qn' value='<%=qn%>' >
<table style='font-weight:bold;font-size:22px;margin-bottom:10px'>
  <tr>
      <td>
         <%=qn%>)<%=rst.getString(3)%>?
      </td>
   </tr>
  </table>
  <table style='font-style:italic;font-weight:bold;font-size:17px' cellpadding='5px'>
  <tr><td><input type="radio" name="bt" <%if(x==1){out.println("checked");}%> onclick="store(this.value)" value="1" name="ans"/>&nbsp;<%=rst.getString(4)%></td></tr>
  <tr><td><input type="radio" name="bt" <%if(x==2){out.println("checked");}%> onclick="store(this.value)" value="2" name="ans"/>&nbsp;<%=rst.getString(5)%></td></tr>
  <tr><td><input type="radio" name="bt" <%if(x==3){out.println("checked");}%> onclick="store(this.value)" value="3" name="ans"/>&nbsp;<%=rst.getString(6)%></td></tr>
  <tr><td><input type="radio" name="bt" <%if(x==4){out.println("checked");}%> onclick="store(this.value)" value="4"name="ans"/>&nbsp;<%=rst.getString(7)%></td></tr>
  </table>