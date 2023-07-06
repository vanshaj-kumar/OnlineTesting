<head>
<script>
    function cc()
    {
	document.getElementById('aur').style.color='red';
    } 
</script>
</head>
<style>
th
{
  font-size:1.2em;
}
td
{
  font-size:1.1em;
}
</style>
<%@ include file='testusersmenu.jsp' %>
<%@ include file='conn.jsp' %>
<body onload='cc()'>
<%
String qr="select user_id,paper,percentage,test_date from  resultinfo";
PreparedStatement ps=cn.prepareStatement(qr,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
ResultSet rst=ps.executeQuery();
if(!rst.next())
{
  %>
   <div align='center' style='margin-top:50px'>
    <h2 style='color:red'>No record found...</h2>
   </div>
  <%
  return;  
}
rst.beforeFirst();
%>
<table border='2px' width="52%" height="36%" style='border-collapse:collapse;margin-top:30px' align='center' cellpadding='4px'>
 <thead>
  <th>User Id</th><th>Paper</th><th>Percent Scored(%)</th><th>Test Date</th>
 </thead>
 <%
  while(rst.next())
  {
    %>
     <tr>
      <td align="center"><%=rst.getString(1)%></td>
      <td align="center"><%=rst.getString(2)%></td>
      <td align="center"><%=rst.getString(3)%>&nbsp;%</td>
      <td align="center"><%=rst.getString(4)%></td>
     </tr> 
    <%
  }
 %>  
</table>