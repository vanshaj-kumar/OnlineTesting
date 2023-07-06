<%@ include file='conn.jsp' %>
<%
String name=request.getParameter("fname")+" "+request.getParameter("lname");
String userid=request.getParameter("userid");
PreparedStatement ps1=cn.prepareStatement("select userid from Registration  where userid=?");
ps1.setString(1,userid);
ResultSet rst=ps1.executeQuery();
if(rst.next())
{
  %>
    <div>
  <img src="../images/sorry.jpg" width="100%" height="40%">
   </div>
   <hr style='border:2px solid green'>
   <div align='center' style='margin-top:50px'>
    <h2 style='color:red'>Sorry!!!!<%=name%></h2>
    <h3>Userid <%=userid%> has already taken by someone else</h3>
    <h3>Please choose another userid</h3>
   </div>
  <%
  return;
}
PreparedStatement ps=cn.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,request.getParameter("fname"));
ps.setString(2,request.getParameter("lname"));
ps.setString(3,request.getParameter("userid"));
ps.setString(4,request.getParameter("password"));
ps.setString(5,request.getParameter("gender"));
ps.setString(6,request.getParameter("date")+"/"+request.getParameter("month")+"/"+request.getParameter("year"));
ps.setString(7,request.getParameter("mobileno"));
ps.setString(8,request.getParameter("secq"));
ps.setString(9,request.getParameter("ans"));
ps.setString(10,"");
ps.executeUpdate();
session.setAttribute("name",name);
session.setAttribute("userid",userid);
%>

  <div>
  <img src="../images/reg5.png" width="100%" height="40%">
  </div>
  <hr style='border:2px solid red'>
<div align='center' style='margin-top:50px'>
 <h2>Congratulations!!!!<%=name%></h2>
 <h2 style='color:green'>You have registered successfully!!!!</h2>
 <h3 style='color:blue'>Your userid is:<%=userid%></h3>
</div>
<div align='center' >
 <a href='uploadphoto.jsp' style='margin-top:30px;font-family:lucida handwriting'>UPLOAD PROFILE PIC.....</a> 
</div>