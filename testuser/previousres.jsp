<head>
  <script>
    function cc()
    {
	document.getElementById('tr').style.color='red';
    } 
</script>
</head>
<%@ include file="menu.jsp" %>
<%@ include file="conn.jsp" %>
<body onload='cc()'>
<style>
a{color:DARKGREEN;}
table th{font-size:19px;
 padding-top: 5px;
    padding-bottom: 3px;
    text-overflow: ellipsis;
 }
table td{font-size:17px;
 }
</style>
<form>
<%
 String qr="select * from resultinfo where user_id=?";
 PreparedStatement ps=cn.prepareStatement(qr,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
 ps.setString(1,(String)session.getAttribute("userid"));
 ResultSet rst=ps.executeQuery();
  rst.first();
 int t=rst.getRow();
 if(t==0)
 {%>
 <div align='center' style='margin-top:50px'>
   <h2>Not given any test yet...</h2>
  </div>
  <%
  return;
 }%>
<table width="60%" align='center' style='margin-top:30px;border-collapse:collapse' cellpadding='5px' border='2'>
 <tr>
  <th>User Id</th><th>Paper</th><th>Total Questions</th><th>Correct Ans</th><th>Percent Scored</th><th>Test Date</th>
 </tr>
 <% rst.beforeFirst(); 
 while(rst.next())
 {
 %>
  <tr>
   <td><%=rst.getString(2)%></td>
   <td><%=rst.getString(3)%></td>
   <td><%=rst.getString(4)%></td>
   <td><%=rst.getString(5)%></td>
   <td><%=rst.getString(6)%></td>
   <td><%=rst.getString(7)%></td>
  </tr> 
<%}%>
</table>
</form>
<div align='center' style='margin-top:40px'>
 <a href='userhome.jsp' style='font-size:20px;color:green'>Back To Main Menu</a>
</div>