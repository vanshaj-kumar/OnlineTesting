<head>
  <script>
    function cc()
    {
	document.getElementById('ep').style.color='red';
    } 
</script>
</head>
<%@ include file="menu.jsp" %>
<body onload='cc()'>
<style>
 th
 {
   text-align:left;
   font-size:20px;
   font-family:poor richard;
 }
 a
 {
   font-size:20px;
   text-decoration:none;
   margin-left:50px;
   color:DARKGREEN;
 }
</style>
<table style='border:3px solid #5D6D7E ;border-radius:7px;margin-top:35' cellpadding='15px' align='center'>
<tr>
 <th>Password<th>
 <td><a href='changepassword.jsp' style='font-family:cambria;color:blue'>Change<a/></td>
</tr>
<tr>
 <th>Mobile Number<th>
 <td><a href='changemobile.jsp' style='font-family:cambria;color:blue'>Change</a></td>
</tr>
<tr>
 <th>Profile picture<th>
 <td><a href='changeprofile.jsp' style='font-family:cambria;color:blue'>Change</a></td>
</tr>
</table>
<div align="center" style='margin-top:55px'>
 <a href='userhome.jsp' style='font-size:20px;font-family:lucida handwriting'>Back To Main Menu</a>
</div>
