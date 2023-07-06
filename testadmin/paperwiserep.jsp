<head>
<script>
    function cc()
    {
	document.getElementById('pwr').style.color='red';
    } 
</script>
</head>
<style>
 input[type='text'] 
 {
   border-radius:5px;
   font-size:18px;
   width:170px;
   height:30px;
 }
</style>
<%@ include file='testusersmenu.jsp' %>
<%@ include file='conn.jsp' %>
<body onload='cc()'>
<form>
 <table style='margin-top:35px;border:2px solid blue;font-size:20px;background-color:#E0E0E0' cellpadding='3px' align='center'>
  <tr>
    <td>Enter Paper Name</td>
    <%
     String paper=request.getParameter("paper");
    %>
    <td><input type='text' name='paper' value='<%=paper==null?"":paper%>' required></td>
    <td><input type='submit' value='Show Record' style='border-radius:4px;font-size:17px;border-color:blue;background-color:#000;color:white'></td>
   </tr>
 </table>
</form>
<%
 String qr="select user_id,total_question,correct_answer,percentage,test_date from  resultinfo where paper=?";
PreparedStatement ps=cn.prepareStatement(qr,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
ps.setString(1,paper);
ResultSet rst=ps.executeQuery();
if(!rst.next())
{
  %>
   
  <%
  return;  
}
rst.beforeFirst();
%>
       <table border='2px' width="47%" height="10%" style='border-collapse:collapse;margin-top:32px' align='center' cellpadding='4px'>
 <thead style='font-size:1.2em'>
  <th>User Id</th><th>Total Questions</th><th>Correct Ans</th><th>Percent Scored</th><th>Test Date</th>
 </thead>
 <%
  while(rst.next())
  {
    %>
<tr>
      <td align="center" style='font-size:1.1em'><%=rst.getString(1)%></td>
      <td align="center" style='font-size:1.1em'><%=rst.getString(2)%></td>
      <td align="center" style='font-size:1.1em'><%=rst.getString(3)%></td>
      <td align="center" style='font-size:1.1em'><%=rst.getString(4)%></td>
      <td align="center" style='font-size:1.1em'><%=rst.getString(5)%></td>
     </tr> 
    <%
  }
 %>  
</table>
