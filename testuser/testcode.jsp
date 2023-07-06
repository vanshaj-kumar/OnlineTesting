<head>
  <script>
    function cc()
    {
	document.getElementById('tc').style.color='red';
    } 
  </script>
</head>
<%@ include file="menu.jsp" %>
<%@ include file="conn.jsp" %>
<body onload='cc()'>
<form>
<%
 String qr="select * from schedulerequest where status =? and userid=?";
 PreparedStatement ps=cn.prepareStatement(qr,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
 ps.setString(1,"Approved");
 ps.setString(2,(String)session.getAttribute("userid"));
 ResultSet rst=ps.executeQuery();
 rst.first();
 int t=rst.getRow();
 if(t==0)
 {%>
 <div align='center' style='margin-top:50px'>
   <h2>No Test Code found...</h2>
  </div>
  <%
  return;
 }%>
 <table width="60%" align='center' style='margin-top:50px;border-collapse:collapse' cellpadding='5px' border='2'>
 <tr>
  <th>User Id</th><th>Paper Name</th><th>Request Date</th><th>Test Code</th>
 </tr>
 <%rst.beforeFirst();
 while(rst.next())
 {
  String sid=rst.getString(1);
  %>
  <tr>
   <td style='font-size:1.1em'><%=rst.getString(2)%></td>
   <td style='font-size:1.1em'><%=rst.getString(3)%></td>
   <td style='font-size:1.1em'><%=rst.getString(4)%></td>
   <td style='font-size:1.1em'><%=rst.getString(5)%></td>
  </tr> 
  <%
 }
%>
</table>
</form>
<div align='center' style='margin-top:60px'>
 <a href='userhome.jsp' style='font-size:20px'>Back To Main Menu</a>
</div>
