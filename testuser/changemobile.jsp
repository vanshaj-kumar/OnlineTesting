<%@ include file="menu.jsp" %>
<%@ include file="conn.jsp" %>
<script>
function updatemob()
{
  var req=new XMLHttpRequest(); 
  req.onreadystatechange=function()
  {
     if(req.readyState==4)
     {
	document.getElementById("msg").innerHTML=req.responseText;
     } 	
  }
  var nmob=document.getElementById("newmob").value;
  req.open("GET","updatemob.jsp?newmob="+nmob,true);
  req.send();
}
</script>
<%
PreparedStatement ps=cn.prepareStatement("select mobileno from Registration  where userid=?");
ps.setString(1,(String)session.getAttribute("userid"));
ResultSet rst=ps.executeQuery();
rst.next();
  String ph=rst.getString(1);
  %>
  <form>
  <table align='center' style='margin-top:35px' cellpadding='10px'>
   <tr>
    <th align='left' style='font-size:1.2em'>Current Mobile Number:</th>
    <td style='font-size:1.2em'><%=ph%></td>
   </tr>
   <tr>
    <th align='left' style='font-size:1.2em'>Enter New Number:</th>
    <td><input type='text' name='newmob' id='newmob' style='font-size:1.2em'></td>
   </tr>
   <tr>
    <td colspan='2' align='center'>
    <input type='button' value='Save' onclick="updatemob()" style='margin-top:22px;font-size:1.2em;border-radius:0.4em;border-color:black'></td>
   </tr>
  </table>
   <div align='center' style='margin-top:25px;font-size:1em'>
   <label id='msg'></label>
   </div>
  </form>
  <div align='center' style='margin-top:30px'>
   <a href='editprofile.jsp' style='font-size:20px'>Back To Edit Profile</a>
  </div>
