<%@ include file="menu.jsp" %>
<%@ include file="conn.jsp" %>
<%
PreparedStatement ps=cn.prepareStatement("select profilepics from Registration  where userid=?");
ps.setString(1,(String)session.getAttribute("userid"));
ResultSet rst=ps.executeQuery();
rst.next();
String photo=rst.getString(1);
%>
<div align='center' style='margin-top:10px'>
    <h2>Current photo</h2>  	
    <img src='profilepic/<%=photo%>' height='150px'>
</div>
<form action="updatepic.jsp" method='post' enctype="multipart/form-data"> 
   <div align='center' style='margin-top:20px'>
    <h2>Upload new photo..</h2>
   </div>
   <div align='center' style='margin-top:20px'>
    <input type='file' name='newpic' style='font-size:16px;margin-left:130px'>
   </div>
   <div align='center'>
    <input type='submit' value='Update' style='margin-top:35px;font-size:1.1em;border-radius:0.3em'>
   </div>
</form>
  <div align='center' style='margin-top:31px'>
   <a href='editprofile.jsp' style='font-size:20px'>Back To Edit Profile</a>
  </div>