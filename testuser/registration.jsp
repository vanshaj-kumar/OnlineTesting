<script type='text/javascript'>
function checkCaptcha()
{
  var ac=document.getElementById("cap").alt;
  var tc=document.getElementById("captcha").value;
  if(ac!=tc)
  {
    alert("Invalid captcha");
    return false;
  }
}
</script>
<style>
 input[type='text'],input[type='password'] 
 {
   border-radius:7px;
   font-size:19px;
   width:340px;
   height:30px;
 }
</style>
<div>
 <img src="../images/studreg.jpg" width="100%" height="33%">
</div>
<hr style='border:2px solid red'>
<form action='save_record.jsp'>
 <table style='border:0.2em solid blue;border-radius:0.5em;font-size:22px;background-color:#E0E0E0' cellpadding='10px' align='center'>
  <tr>
   <td colspan='2' align='center'>
    <b><u><h3>Registration Form</h3></u></b>
   </td>
  </tr>
  <tr>
   <td><b>First Name</b></td>
   <td><input type='text' name='fname' required></td>
  </tr>
  <tr>
   <td><b>Last Name</b></td>
   <td><input type='text' name='lname' required></td>
  </tr>
  <tr>
   <td><b>User Id<b></td>
   <td><input type='text' name='userid' required></td>
  </tr>
  <tr>
   <td><b>Password</b></td>
   <td><input type='password' name='password' required></td>
  </tr>
 <tr>
   <td><b>Retype Password</b></td>
   <td><input type='password' name='rpassword' required></td>
  </tr>
 <tr>
   <td><b>Gender</b></td>
   <td><input type="radio" name="sex" value="male" size="10">Male
   <input type="radio" name="gender" value="Female" size="10">Female</td>
 </tr>
 <tr>
   <td><b>Date of Birth</b></td>
   <td>
        <select style="font-size:18px" name="date">
        <option>Date</option>
         <%
         for(int d=1;d<=31;d++)
         {
	   %><option><%=d%></option><%
	 } 
         %> 
        </select>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select style="font-size:18px" name="month">
        <option>Month</option>
        <%
        String [] str={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
        for(int i=0;i<str.length;i++)
        {
          %><option value='<%=(i+1)%>'><%=str[i]%></option><%
	}  
        %>   
        </select>
        <select style="font-size:18px" name="year">
          <option>Year</option>
         <%
         for(int y=1950;y<=2017;y++)
         {
	   %><option><%=y%></option>
	 <%} 
         %> 
    </select></td>
 </tr>
 <tr>
   <td><b>MobileNo.</b></td>
   <td><input type="text" name="mobileno" id="mobileno" size="30"></td>
 </tr>
 <tr>
   <td><b>Security Question</b></td>
   <td>
    <select style="font-size:20px" name="secq">
     <option>Choose</option>
     <option>What is your Pet Name</option>  
     <option>What is your Favourite Color</option>  
     <option>What is your School Name</option> 
     <option>Where is your Home Town </option>	
     <option>What is your Mother Name</option> 
    </select>
   </td> 
 </tr>
 <tr>
   <td><b>Enter Answer</b></td>
   <td><input type="text" name="ans" id="ans" size="30"></td>
 </tr>
 <tr>
   <td colspan='2' align='center'>
     <b>Captcha Code</b><br>
     <%
     java.util.Random ra=new java.util.Random();
     int noc=ra.nextInt(3)+6;
     int t=0;
     String cap="";
     do
     {
       int n=ra.nextInt(75)+48;
       if((n>=48 && n<=57)||(n>=65 && n<=90)||(n>=97 && n<=122) )
       {
         cap=cap+(char)n;
	 t++;
         if(t==noc)
          break;
       }
     }while(true);
     %>
     <img alt='<%=cap%>' id='cap' style='font-size:40px;background-color:blue;color:white'></img>
   </td>
 </tr>
 <tr>
   <td><b>Enter Captcha</b></td>
   <td><input type="text" name="captcha" id="captcha" size="30"></td>
 </tr>
 <tr>
  <td colspan='2' align='center'>
   <input type='submit' value='Register Me' style='border-radius:0.6em;font-size:1.06em;border-color:black;background-color:white;color:black'>
  </td>
 </tr>
 </table>
</form>