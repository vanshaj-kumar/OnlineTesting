<%@ include file="conn.jsp" %>
<%
ResultSet rst=(ResultSet)session.getAttribute("rst");
int ai=(Integer)session.getAttribute("ai");
if(request.getParameter("bp")!=null)
{
 int n=Integer.parseInt(request.getParameter("bp"));
 if(n==1)
    ai=0;
 else if(n==2)
    ai--;
 else if(n==3)
    ai++;
 else
   ai=((Integer)session.getAttribute("tq"))-1;
}
else if(request.getParameter("dq")!=null)
{
  ai=Integer.parseInt(request.getParameter("dq"))-1;
}
int [] raq=(int[])session.getAttribute("raq");
rst.absolute(raq[ai]);
int qn=rst.getRow(); 
session.setAttribute("ai",ai);
int []ans=(int[])session.getAttribute("answer");
int x=ans[ai];
%>
<input type='hidden' id='qn' value='<%=(ai+1)%>' >
<table style='font-weight:bold;font-size:23px;margin-bottom:10px'>
  <tr>
      <td>
         <%=(ai+1)%>)<%=rst.getString(3)%>?
      </td>
   </tr>
  </table>
  <table style='font-style:italic;font-weight:bold;font-size:20px' cellpadding='5px'>
  <tr><td><input type="radio" name="bt" <%if(x==1){out.println("checked");}%> onclick="store(this.value)" value="1" name="ans"/>&nbsp;<%=rst.getString(4)%></td></tr>
  <tr><td><input type="radio" name="bt" <%if(x==2){out.println("checked");}%> onclick="store(this.value)" value="2" name="ans"/>&nbsp;<%=rst.getString(5)%></td></tr>
  <tr><td><input type="radio" name="bt" <%if(x==3){out.println("checked");}%> onclick="store(this.value)" value="3" name="ans"/>&nbsp;<%=rst.getString(6)%></td></tr>
  <tr><td><input type="radio" name="bt" <%if(x==4){out.println("checked");}%> onclick="store(this.value)" value="4"name="ans"/>&nbsp;<%=rst.getString(7)%></td></tr>
  </table>