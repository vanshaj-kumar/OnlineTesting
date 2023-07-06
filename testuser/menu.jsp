<html>
<style>
 a
 {
   font-family:lucida calligraphy;
   font-size:20px;
   text-decoration:none;
   color:DARKGREEN;
 }
</style>
<body>
      <div>
      <div>
       <img src='../images/user.jpg' width="80%" height="31%" style="float:left"/>
      </div>
      <div>
	<div align='center' style='margin-top:10px;'>	
    	<img src='profilepic/<%=session.getAttribute("pic")%>' width="18%" height="31% style="border:solid black">
	</div>
      </div>
      </div><br>
	<div align='center' style='color:rgb(0,75,226) ;font-size:26px'><b>Welcome,<%=session.getAttribute("name")%></b></div>
         <hr style="border:2px solid red;"/>
   	<table width="100%" align="center">
	<tr>
	   <td><a href="userhome.jsp" id='home'>Home</a></td><td><a href="testreq.jsp">Test Request</a></td>
	   <td><a href="previousres.jsp" id='tr'>Test Report</a></td><td><a href="testcode.jsp" id='tc'>Test Codes</a></td>
	   <td><a href="entercode.jsp">Start Test</a></td><td><a href="editprofile.jsp" id='ep'>Edit Profile</a></td>
	   <td><a href="logout.jsp">Logout</a></td>
	</tr>
          </table>
      <hr style="border:2px solid red;"/>
    </body>
</html>