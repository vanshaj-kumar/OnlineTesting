<%@ include file='conn.jsp' %>
<%
PreparedStatement ps=cn.prepareStatement("select password from Registration  where userid=?");
ps.setString(1,(String)session.getAttribute("userid"));
ResultSet rst=ps.executeQuery();
rst.next();
String pa=rst.getString(1);
if(!pa.equals(request.getParameter("pass")))
{
  out.println("<font color='red'>Your current password is wrong</font>");
  return;
}
PreparedStatement ps1=cn.prepareStatement("update Registration set password=? where userid=?");
ps1.setString(1,request.getParameter("newpass"));
ps1.setString(2,(String)session.getAttribute("userid"));
ps1.executeUpdate();
out.println("<font color='blue'>Your password has been changed</font>");
%>
