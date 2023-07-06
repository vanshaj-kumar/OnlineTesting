 <style>
 input[type='text'] 
 {
   border-radius:6px;
   font-size:18px;
   width:175px;
   height:39px;
 }
</style>
<div>
 <img src="../images/fp3.jpg" width="100%" height="35%">
</div>
<hr style='border:2px solid red'>
<%
String userid=request.getParameter("user");
%>
<form action='showuserinfo.jsp'>
 <div style="margin-top:35px">
  <table style='border:2px solid darkblue;font-size:20px;background-color:#E0E0E0' cellpadding='10px' align='center'>
  <tr>
   <td><b>Enter User Id</b></td>
   <td><input type='text' name='userid' id='userid' value='<%=userid!=null?userid:""%>' required></td>
  </tr>
  <tr>
    <td colspan='2' align='center'>
      <label style='color:red'><%=userid!=null?"User id does not exist...":""%></label>
    </td>
  </tr>
  <tr>
    <td colspan='2' align='center'>
      <input type='submit' value='Submit' style='border-radius:6px;font-size:19px;border-color:blue;background-color:AEA5A3;color:black'>
    </td>
   </tr>
  </table>
 </div>
</form>
<div align='center' style='margin-top:55px'>
 <a href='index.jsp' style='font-size:21px;font-family:lucida handwriting;color:032976'>Back To Login</a>
</div>