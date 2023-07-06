<%@ include file="menu.jsp" %>
<%@ include file="conn.jsp" %>
<script>
function checkPassword()
{
  var req=new XMLHttpRequest(); 
  req.onreadystatechange=function()
  {
     if(req.readyState==4)
     {
	document.getElementById("msg").innerHTML=req.responseText;
     } 	
  };
  var pa=document.getElementById("currpass").value;
  var npa=document.getElementById("newpass").value;
  req.open("GET","checkpassword.jsp?pass="+pa+"&newpass="+npa,true);
  req.send();
}
</script>
<form>
  <table align='center' style='border:0.3em solid blue;margin-top:30px' cellpadding='10px'>
   <tr>
    <th align='left'>Enter Current Password:</th>
    <td><input type='text' name='currpass' id='currpass' required></td>
   </tr>
   <tr>
    <th align='left'>Enter New Password:</th>
    <td><input type='password' name='newpass' id='newpass'></td>
   </tr>
   <tr>
    <th align='left'>Confirm New Password:</th>
    <td><input type='text' name='rnewpass' id='rnewpass'></td>
   </tr>
   <tr>
    <td colspan='2' align='center'>
     <label id="msg"></label>
    </td>
   </tr>
   <tr>
    <td colspan='2' align='center'>
     <input type='button' value='Save' onclick="checkPassword()" style='font-size:1.2em;border-radius:0.4em'>
    </td>
   </tr>
  </table>
  </form>
  <div align='center' style='margin-top:30px;font-family:lucida handwriting'>
   <a href='editprofile.jsp' style='font-size:20px;color:green'>Back To Edit Profile</a>
  </div>
