<%@ include file='conn.jsp' %>
<%
   String col=request.getParameter("col");
   String query="update questionbank set "+col+"=? where qid=?";
   PreparedStatement ps=cn.prepareStatement(query);
   ps.setString(2,(String)session.getAttribute("qid"));
   ps.setString(1,request.getParameter("val"));
   ps.executeUpdate();
%>
<div align='center' style='margin-top:17px'>
 <h3 style='font-family:algerian'>Question updated successfully....</h3>
</div>