<head>
<script type='text/javascript'>
function cc()
{
  document.getElementById('showp').style.color='red';
} 
</script>
</head>
<%@ include file='papersmenu.jsp' %>
<%@ include file='conn.jsp' %>
<body onload='cc()'>
<%
String qr="select * from papers";
PreparedStatement ps=cn.prepareStatement(qr);
ResultSet rst=ps.executeQuery();
%>
 <table border=1 style='margin-top:50px;font-size:1.3em;border-radius:0.4em' align='center' cellpadding='4px'>
 <thead>
  <th>Paper Id</th><th>Paper Name</th>
 </thead>
 <%
  while(rst.next())
  {
    %> 
    <tr>
      <td style='font-size:1.2em'><%=rst.getString(1)%></td>
      <td style='font-size:1.2em'><%=rst.getString(2)%></td>
     </tr>
  <%}
 %>  
</table>
