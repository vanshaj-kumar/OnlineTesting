<%@ include file="conn.jsp" %>
<style>
 input[type='text']
 {
   border-radius:7px;
   font-size:19px;
   width:340px;
   height:30px;
 }
 select{
   border: 2px solid #AAA;
    border-radius: 5px;
    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
    color: #555;
    font-size:20px;
    padding-top: 1px;
    padding-bottom: 1px;
    text-overflow: ellipsis;
    white-space: nowrap;}
 input[type='submit']
 {
   border-radius:9px;
   font-size:14px;
   width:80px;
   height:25px;
 }
a{color:GREEN;}
</style>
<div>
 <img src="../images/oe3.jpg" width="100%" height="33%">
</div>
<hr style='border:2px solid red'>
<form action='sendrequest.jsp'>
<div style="margin-top:40px" align="center">
   <h2>Select Paper</h2>
    <select style="font-size:23px" name="paper">
     <%
     String qr="select paper from papers";
     ResultSet rst=st.executeQuery(qr);
     while(rst.next())
     {
	%>
	<option><%=rst.getString(1)%></option>
	<%	
     } 
     %>
    </select><br><br><br>
</div>
   <div align='center'>
    <input type='submit' value='Submit' style='border-radius:4px;font-size:19px;border-color:black;background-color:#CDCBCF;color:#030000'>
   </div>
</form>
<div align='center' style='margin-top:60px'>
 <a href='userhome.jsp' style='font-size:20px;font-family:lucida handwriting'>Back To Main Menu</a>
</div>