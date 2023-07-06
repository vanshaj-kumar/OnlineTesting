<%@ include file='conn.jsp' %>
<%
PreparedStatement ps1=cn.prepareStatement("update Registration set mobileno=? where userid=?");
ps1.setString(1,request.getParameter("newmob"));
ps1.setString(2,(String)session.getAttribute("userid"));
ps1.executeUpdate();
out.println("<font color='blue'>Your no. has been changed</font>");
%>
