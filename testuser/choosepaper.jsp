<%
if(session.isNew())
{
  response.sendRedirect("onlinetesting/testuser");
  return;
}
%>
<%@ include file="conn.jsp"%>
<html>
 <head>
  <script>
   function enable(index)
   {
     if(index>0)
      document.getElementById("st").disabled=false;
     else
      document.getElementById("st").disabled=true;
   }
  </script>
 </head>
  <div>
         <img src='../images/image9.jpg' width="100%" height="30%"/>
  </div>
  <hr style='border:2px solid red'>
  <form action="questions.jsp">
  <div style="margin-top:80px" align="center">
   <select style="font-size:23px" onchange="enable(this.selectedIndex)" name="paper">
     <option>Choose Paper</option>
     <%
      Statement st1=cn.createStatement();
      String query="select distinct papers.paperid,paper from papers join questionbank on papers.paperid=questionbank.paperid";
      ResultSet rst=st.executeQuery(query);
      while(rst.next())
      {
     %>
      <option value="<%=rst.getString(1)%>"><%=rst.getString(2)%></option>
      <% } %>
   </select>
   </div>
   <div align="center" style="margin-top:20px">
    <input type="submit" value="Start Test" style="font-size:22px" id="st" disabled>
   </div>
  </form>
</html>


