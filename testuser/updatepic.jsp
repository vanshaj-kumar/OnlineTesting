<%@ include file='conn.jsp' %>
<%@ page import="com.oreilly.servlet.*" %>
<%
String path=application.getRealPath("/testuser/profilepic"); 
MultipartRequest mpr=new MultipartRequest(request,path,500*1024*1024);
String pic=mpr.getOriginalFileName("newpic");
PreparedStatement ps=cn.prepareStatement("update Registration set profilepics=? where userid=?");
ps.setString(1,pic);
ps.setString(2,(String)session.getAttribute("userid"));
ps.executeUpdate();
session.setAttribute("pic",pic);
%>
<%@ include file='menu.jsp' %>
<div align='center' style='margin-top:50px'>
 <h2>You profile photo has been changed...</h2>
</div>