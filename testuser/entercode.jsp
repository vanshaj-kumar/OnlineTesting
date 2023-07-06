<script type="text/javascript">
function checkCode()
{ 
        var code=document.getElementById("testcode").value;
        var obj=new XMLHttpRequest();
        obj.onreadystatechange=function()
        { 
         if(obj.readyState==4)
         {
           	   var res=obj.responseText;
	   if(res.trim()==1)
	     location.href="questions1.jsp";
	   else	
	     document.getElementById("msg").innerHTML=res;	
         }
        };
        var url="checkcode.jsp?code="+code;
        obj.open("POST",url);
        obj.send();
    }
  </script>
 <style>
a{color:#7921D6;}
 input[type='text'] 
 {
   border-radius: 7px;
   font-size:18px;
   width:235px;
   height:37px;
  border: solid 2px black;
 }
 input[type='button']
 { 
   width:80px;
   height:30px;
 }
</style>
<div>
 <img src="../images/start.jpg" width="100%" height="35%">
</div>
<hr style='border:2px solid red'>
 <div style="margin-top:35px">
  <table style='border:0.5em solid purple;border-radius:0.5em;font-size:20px;background-color:BEBFC5'height="25%" width="35%" cellpadding='10px' align='center'>
  <tr><br>
   <td><b>Enter Test Code</b></td>
   <td><input type='text' name='testcode' id='testcode' required></td>
  </tr>
  <tr>
    <td colspan='2' align='center'>
      <label style='color:red' id="msg"></label>
    </td>
  </tr>
  <tr>
    <td colspan='2'align='center'>
      <input type='button' onclick="checkCode()" value='Submit' style='border-radius:0.5em;font-size:21px;border-color:black;background-color:DARKGREY;color:black'>
    </td>
   </tr>
  </table>
 </div>
<div align='center' style='margin-top:55px'>
 <a href='userhome.jsp' style='font-size:20px;font-family:lucida handwriting;color:green'>Back To Main Menu</a>
</div>