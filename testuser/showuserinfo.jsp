<script>
function showPassword()
{
  var req=new XMLHttpRequest(); 
  req.onreadystatechange=function()
  {
     if(req.readyState==4)
     {
	document.getElementById("password").innerHTML=req.responseText;
     } 	
  };
  var ans=document.getElementById("ans").value;
  req.open("GET","showpassword.jsp?ans="+ans,true);
  req.send();
}
</script>
<style>
 input[type='text'] 
 {
   
   border-radius:6px;
   font-size:12px;
   width:170px;
   height:30px;
 }
  input[type='button'] 
 {
   font-family:arial rounded mt;
   font-size:0.8em;
   width:8.9em;
   height:28px;
   border-radius:0.25em
   border-color:solid black
 }
</style>
<%@ include file="conn.jsp" %>
<div>
 <img src="../images/fp3.jpg" width="100%" height="33%">
</div>
<hr style='border:2px solid red'>
<%
Statement st1=cn.createStatement();
String userid=request.getParameter("userid");
ResultSet rst=st1.executeQuery("select * from Registration where userid='"+userid+"'");
if(rst.next())
{
  String name=rst.getString(1)+" "+rst.getString(2);
  session.setAttribute("password",rst.getString(4));
  String qst=rst.getString(8);
  session.setAttribute("ans",rst.getString(9));
  %>
  <form>
  <table align='center' style='border:0.27em solid blue;margin-top:35px;background-color:#E0E0E0' cellpadding='10px'>
   <tr>
    <th align='left' style='font-size:1.2em'><b>User Name:</b></th>
    <td style='font-size:1.2em'><%=name%></td>
   </tr>
   <tr>
    <th align='left' style='font-size:1.2em'><b>Security question:</b></th>
    <td style='font-size:1.2em'><%=qst%></td>
   </tr>
   <tr>
    <th align='left' style='font-size:1.2em'>Enter answer:</th>
    <td><input type='text' name='ans' id='ans' style='font-size:1.2em'></td>
   </tr>
   <tr>
    <td colspan='2' align='center' style='font-size:1em'><label id='password'></label></td>
   </tr>
   <tr>
    <td colspan='2' align='center'><input type='button' value='Show Password' onclick="showPassword()"></td>
   </tr>
  </table>
  </form>
  <%
}
else
{
  response.sendRedirect("forgotpass.jsp?user="+userid);
}
%>
<div align='center' style='margin-top:42px'>
   <a href='index.jsp' style='font-size:20px;color:032976;font-family:lucida handwriting'>Back To Login</a>
  </div>
