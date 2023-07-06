<div>
 <img src="../images/al5.jpg" width="100%" height="37%">
</div>
<hr style='border:2px solid red'>
<form method="post">
<%
String aid=request.getParameter("adminid");
String pa=request.getParameter("password");
if(aid!=null)
{
  if(aid.equals("admin") && pa.equals("admin"))
  {
	session.setAttribute("admin","admin");
	response.sendRedirect("home.jsp");
  }
}  
%>  
<div style="margin-top:45px">
  <table align="center" cellpadding="8" height="34%" style="font-size:20px;border-radius:0.8em;border-color:green" bgcolor='#AACCBB'>
    <tr>
         <td colspan="2"><div align="center" style="height:32px;font-size:20px;color:White;background-color:#0000FF">
             Admin Login Form</div></td>
    </tr>
    <tr>
     <td style='font-size:1.1em'><b>Admin Login Id</b></td>
     <td><input type='text' name='adminid' style='width:200px;height:30;font-size:1em'></td>
    </tr>
    <tr>
     <td style='font-size:1.1em'><b>Admin Password</b></td>
     <td><input type='password' name='password'  style='width:200px;height:30;font-size:1em'></td>
    </tr> 
    <tr>
     <td colspan="2" align="right">
      <input type="submit" value="Login" style="width:80px;height:30px;border-color:black;border-radius:0.3em;font-size:1.1em">
     </td>
    </tr>  
  </table>
</div>
</form>